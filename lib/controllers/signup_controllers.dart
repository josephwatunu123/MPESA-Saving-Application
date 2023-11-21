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
        firstname.text.trim(),
        sirname.text.trim(),
        email,
        phone.text.trim(),
        password.toString().trim());

    AuthenticationRepository.instance.CreateDefaultWallet();
    AuthenticationRepository.instance.TransactionHistoryDoc();


  }

  void phoneAuthentication( String phone){
    AuthenticationRepository.instance.phoneAuthentication(phone);
  }


}