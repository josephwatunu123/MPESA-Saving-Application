import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/exeptions/emailPwdFailed.dart';
import 'package:save_app/components/classes.dart';
import 'package:save_app/database/manageUserDetails.dart';
import 'package:save_app/pages/homepage.dart';
import 'package:save_app/pages/login_page.dart';
import 'dart:async';



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


  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email:email, password:password);
    }on FirebaseAuthException catch(e){

    }catch (_){}
  }

  Future<void> logout() async => await _auth.signOut();
   
}