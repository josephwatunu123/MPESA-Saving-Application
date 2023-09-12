import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_app/components/passwordfields.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap});

  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 212, 2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Align(
                alignment: Alignment.topCenter,
                child: Center(
                    child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset('lib/images/logo.png'),
                ))),
            SizedBox(height: 50),
            Text(
              'Welcome back',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(height: 25),
            MyPassFields(
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot PIN?',
                    style: TextStyle(color: Color.fromARGB(255, 0, 24, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 22, 7),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
