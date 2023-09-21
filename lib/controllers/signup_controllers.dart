import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{
  static SignUpController get instance =>Get.find();

  //Controllers to get data input by user

  final firstname = TextEditingController();
  final sirname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  void Registeruser(String firstname, String sirname, String email, String phone, String password){
    //firebase logic


  }

}