import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//
// class verifyUserPhone{
//   void verificationPhone(phoneNumber) async{
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: ${phoneNumber},
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) {},
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }


class globalUser{

  final String uid;

  globalUser({required this.uid});

}

class NewGoal{

}
class ShowToast{
  void showToast(String message, int duration) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.green, // Customize the background color
      textColor: Colors.white, // Customize the text color
    );
  }
}
