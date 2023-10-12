import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../authentication/authentication.dart';

class loginController extends GetxController{
  static loginController get instance => Get.find();

  final phone= TextEditingController();

  void phoneAuthentication( String phone){
    AuthenticationRepository.instance.phoneAuthentication(phone);
  }
}