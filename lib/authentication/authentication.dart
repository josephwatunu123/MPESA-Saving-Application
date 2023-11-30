import 'dart:math';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/exeptions/emailPwdFailed.dart';
import 'package:save_app/authentication/mpesa_keys.dart';
import 'package:save_app/components/classes.dart';
import 'package:save_app/controllers/newgoal_controllers.dart';
import 'package:save_app/database/manageUserDetails.dart';
import 'package:save_app/pages/homepage.dart';
import 'package:save_app/pages/login_page.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';



class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  late DateTime? lastLogoutTime;
  Timer? redirectTimer;
  late StreamSubscription<User?> _userSubscription;
  var verificationId= ''.obs;



  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _userSubscription = firebaseUser.listen((user) {
      if (user != null) {
        // User logged in, start the inactivity timer
        print(user);
        String userId= user.uid;
        print("Mr Joseph this is the user "+userId);
        _startInactivityTimer();
      } else {
        // User logged out, cancel the timer
        _cancelInactivityTimer();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _cancelInactivityTimer();
    _userSubscription.cancel();
    super.onClose();
  }

  void _startInactivityTimer() {
    _cancelInactivityTimer(); // Cancel any existing timer
    redirectTimer = Timer(Duration(minutes: 130), () {
      // Automatically log out the user after 5 minutes of inactivity
      _auth.signOut();
      Get.offAll(()=>LoginPage());
    });
  }

  void _cancelInactivityTimer() {
    redirectTimer?.cancel();
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginPage()) : Get.offAll(() =>  HomePage());
  }

  Future<void> phoneAuthentication(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
        verificationCompleted: (credentials) async {
        await _auth.signInWithCredential(credentials);
        },
        codeSent: (verificationId, resendToken){
        this.verificationId.value= verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value= verificationId;
        },
    verificationFailed: (e){
        if(e.code=='Invalid-phone-number'){
          Get.snackbar(('Error'), 'The provided phone number is not valid');
        }else{
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
    },
    );
  }

  Future<bool> verifyOTP (String otp) async{
    var credentials= await _auth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null?true: false;
  }


  Future<void> CreateUserWithEmailAndPassword(String email,String password)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

    Get.off(() => HomePage());

    } on FirebaseAuthException catch(e){
      final ex= SignUpWithEmailandPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION- ${ex.message}');
      throw ex;
    }catch (_){
      const ex= SignUpWithEmailandPasswordFailure();
      print('EXEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> AddUserDetails(String firstname, String lastname, String email, String phone, String pass)async{

    _userSubscription = firebaseUser.listen((user) async {
      if (user != null) {
        await ManageUserDetails(uid: user.uid).updateUserData(
            firstname, lastname, email, phone, pass);
        globalUser global_user= globalUser(uid: user.uid);
      }

    });


  }

  Future<void> CreateDefaultWallet()async{
    _userSubscription= firebaseUser.listen((user) async{
      if(user!=null) {
        await ManageUserDetails(uid: user.uid).createSaveNowWallet();
      }
    });
  }

  Future<void> TransactionHistoryDoc()async{
    _userSubscription= firebaseUser.listen((user) async{
      if(user!=null) {
        await ManageUserDetails(uid: user.uid).createTransactionDocument();
      }
    });

  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    const int toastShort = 2; // 2 seconds
    const int toastLong = 5; // 5 seconds
    print('we are missing this pass $password but we have $email');
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(() => HomePage());
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
      showToast(" ${e.message} or missing value", toastLong);

    } catch (error) {
      print('Error: $error');
      showToast("Error ${error}", toastLong);
    }
  }


  void showToast(String message, int duration) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, 
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.blueGrey, // Customize the background color
      textColor: Colors.white, // Customize the text color
    );
  }

  Future<void> logout() async => await _auth.signOut();



  void deleteGoal(Map<String, dynamic> goalData) async {
    print('Entering deleteGoal function');
    String idForDelete = goalData['goalId'].toString();
    print('Goal ID for deletion: $idForDelete');
    print('Current user: ${firebaseUser.value}');

    User? user = firebaseUser.value;

    if (user != null) {
      print('User is not null. Calling DeleteGoalComplete.');
      await ManageUserDetails(uid: user.uid).DeleteGoalComplete(idForDelete);
    }
  }

  Future<void> updateGoalDeposit({required String amount, required String gid}) async{
    print("We reached auth doc amount is $amount");
    final user = firebaseUser.value;
    if(user!= null){
        await ManageUserDetails(uid: user.uid).updateDepoAmt(amount, gid);
    }
  }


  Future<void> depositRecord({required String amount}) async{
    print("We reached auth doc amount is $amount");
    final user = firebaseUser.value;
    if(user!= null){
      await ManageUserDetails(uid: user.uid).recordDepositTransaction(amount);
    }
  }

  Future<void> startMpesaTransaction() async{
    print("MPESA STK called");
    dynamic transactionInitialisation;

    try{
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: "174379",
        transactionType: TransactionType.CustomerPayBillOnline,
        amount: 1.0,
        partyA: "254711414747",
        partyB: "174379",
        callBackURL: Uri(
          scheme: "https",
          host: "4c63-105-162-25-167.ngrok-free.app",
          path: "/webhook"
        ),
        accountReference: "testapi",
          phoneNumber: "254112572569",
        baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
        transactionDesc: "save",
        passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"
      );
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());

      return transactionInitialisation;

    } catch (e){
      print("ERROR EROR ERROR FROM MPESA HERE!!!! "+ e.toString());
    }
  }


}
