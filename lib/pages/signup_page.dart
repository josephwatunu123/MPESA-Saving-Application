import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_app/components/header_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                HeaderWidget(image: 'assets/images/FundNest.jpg'),
              ],
            )),
      ),
    );
  }
}
