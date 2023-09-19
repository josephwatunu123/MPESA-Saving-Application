import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
class TextFormFieldTheme{
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme=
    const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.black87),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.lightGreen)
        )
        );
}