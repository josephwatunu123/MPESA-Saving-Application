import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget{
  const OTPScreen ({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please Enter OTP Sent"),
            const SizedBox(height:20.0),
            Align(
              alignment: Alignment.topCenter,
              child: Center(
                  child: OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                  ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}