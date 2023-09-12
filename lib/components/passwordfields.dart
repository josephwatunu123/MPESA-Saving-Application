import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPassFields extends StatelessWidget {
  final controller;
  final bool obscureText;

  const MyPassFields({
    super.key,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: 'Enter Pin',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 3, 252, 11)),
          ),
          fillColor: Color.fromARGB(255, 170, 250, 174),
          filled: true,
        ),
      ),
    );
  }
}
