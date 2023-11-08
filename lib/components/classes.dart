import 'package:firebase_auth/firebase_auth.dart';
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