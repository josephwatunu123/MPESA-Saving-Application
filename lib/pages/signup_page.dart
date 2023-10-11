import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/components/header_widget.dart';
import 'package:save_app/controllers/signup_controllers.dart';
import 'package:save_app/components/classes.dart';

import 'otp_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey= GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  HeaderWidget(image: 'assets/images/FundNest.jpg'),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0 - 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.firstname,
                            decoration: InputDecoration(
                                label: Text('First Name'),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.lightGreen))),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: controller.sirname,
                            decoration: InputDecoration(
                                label: Text('Sir Name'),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.lightGreen))),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                label: Text('Email'),
                                prefixIcon: Icon(Icons.email_rounded),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.lightGreen))),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: controller.phone,
                            onChanged: (value){

                            },
                            decoration: InputDecoration(
                                label: Text('Phone Number'),
                                prefixIcon: Icon(Icons.numbers),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.lightGreen))),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.password,
                            decoration: InputDecoration(
                                label: Text('Password'),
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.lightGreen))),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,


                            //BUTTON WITH OTP
                            child: ElevatedButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    // SignUpController.instance.Registeruser(controller.email.text.trim(), controller.password.text.trim());
                                    SignUpController.instance.phoneAuthentication(controller.phone.text.trim());
                                    Get.to(()=>OTPScreen());
                                  }
                                }, child: Text('Sign up'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(150, 60),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                backgroundColor: Colors.black87,
                                elevation: 15,
                                side: BorderSide(color: Colors.black, width: 2),
                              ),),


                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
