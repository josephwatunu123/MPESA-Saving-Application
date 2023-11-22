import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../authentication/authentication.dart';

class loginController extends GetxController{
  static loginController get instance => Get.find();

  final email= TextEditingController();
  final password= TextEditingController();

  void userAuthentication( String email, String password){
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}