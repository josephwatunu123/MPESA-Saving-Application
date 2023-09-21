import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:save_app/pages/homepage.dart';
import 'package:save_app/pages/login_page.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    firebaseUser= Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user== null? Get.offAll(()=> LoginPage()): Get.offAll(()=> const HomePage());
  }

  Future<void> CreateUserWithEmailAndPassword(String email,String password)async{
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){

    }catch (_){}
  }
  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithPhoneNumber(phoneNumber)
    }
  }
   
}