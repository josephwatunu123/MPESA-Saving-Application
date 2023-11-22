import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class boxDecoration{
  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        border: Border( bottom: BorderSide(
            color: Colors.green,
            width: 1.5
        ))
    );
  }
}