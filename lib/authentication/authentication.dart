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

  @override
  void onReady(){
    firebaseUser= Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user !=null) {
      if (lastLogoutTime != null) {
        final currentTime = DateTime.now();
        final difference = currentTime.difference(lastLogoutTime!);
        if (difference.inMinutes <= 2) {
          // User has returned within 2 minutes, redirect to HomePage
          Get.offAll(() => const HomePage());
        }
      }
      Get.offAll(() => LoginPage());
    } else {
      lastLogoutTime = null;
      Get.offAll(() => const HomePage());
    }
  }

  Future<void> CreateUserWithEmailAndPassword(String email,String password)async{
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value !=null? Get.offAll(()=>const HomePage()) :Get.to(()=> LoginPage());
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