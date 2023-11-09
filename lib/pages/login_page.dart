import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:save_app/components/passwordfields.dart';
import 'package:save_app/pages/reset_through_mail.dart';
import 'package:save_app/pages/reset_through_phone.dart';
import 'package:save_app/pages/signup_page.dart';
import 'package:save_app/components/constants.dart';
import '../components/loginpg_forgotpinbtn.dart';
import '../components/resetpass_mail.dart';
import '../components/resetpass_phone.dart';
import '../controllers/login_controllers.dart';
import 'otp_screen.dart'; // Make sure the import path is correct.

class LoginPage extends StatelessWidget {
  final Function()? onTap;

  LoginPage({super.key, this.onTap});

  final controller = Get.put(loginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 212, 2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                // Container holding the logo
                width: 200.0,
                height: 150.0,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(50.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 6.0),
                  image: DecorationImage(
                    image: AssetImage('lib/images/logo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0),

            // Welcome back Text
            Text(
              'Welcome back',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(height: 25),

            Container(
              width: 300.0, // Adjust the width as needed
              decoration: BoxDecoration(

              ),
              child: Form(
                key: _formKey,
                child: Column(

                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.email,
                      decoration: loginpg(),
                    ),
                    const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controller.password,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Enter Pin',
                      prefixIcon: Icon(Icons.password),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(),
                      ),
                    ),
                  ),
                )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),
            Forgotpinbtn(),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.userAuthentication(controller.email.text.trim(), controller.password.text.trim());
                }
              },
              child: Text("Sign In"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(150, 70),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.black87,
                elevation: 15,
                side: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              child: Text.rich(
                TextSpan(
                  text: 'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: const [
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration loginpg() {
    return InputDecoration(
                      labelText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black87),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.lightBlue,
                        ),
                      ),
                    );
  }
}
