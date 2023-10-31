import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/authentication.dart';


class SignUpController extends GetxController{
  static SignUpController get instance =>Get.find();

  //Controllers to get data input by user

  final firstname = TextEditingController();
  final sirname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  void Registeruser(String email, String password){
    AuthenticationRepository.instance.CreateUserWithEmailAndPassword(email, password);
    AuthenticationRepository.instance.AddUserDetails(
        firstname.toString(),
        sirname.toString(),
        email.toString(),
        phone.toString(),
        password.toString().trim());


  }

  void phoneAuthentication( String phone){
    AuthenticationRepository.instance.phoneAuthentication(phone);
  }


}