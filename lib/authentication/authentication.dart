import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/exeptions/emailPwdFailed.dart';
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

  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _userSubscription = firebaseUser.listen((user) {
      if (user != null) {
        // User logged in, start the inactivity timer
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
    redirectTimer = Timer(Duration(minutes: 1), () {
      // Automatically log out the user after 5 minutes of inactivity
      _auth.signOut();
      Get.offAll(()=>LoginPage());
    });
  }

  void _cancelInactivityTimer() {
    redirectTimer?.cancel();
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginPage()) : Get.offAll(() => const HomePage());
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
  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email:email, password:password);
    }on FirebaseAuthException catch(e){

    }catch (_){}
  }

  Future<void> logout() async => await _auth.signOut();
   
}