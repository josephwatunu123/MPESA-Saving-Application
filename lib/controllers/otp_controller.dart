import 'package:get/get.dart';
import 'package:save_app/authentication/authentication.dart';
import 'package:save_app/pages/homepage.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP (String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified? Get.offAll( HomePage()): Get.back();
  }
}