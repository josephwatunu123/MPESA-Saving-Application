import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class newGoalControllers extends GetxController{

  //the test controllers we will use for now

  final firstncont =TextEditingController();
  final lastnamecont =TextEditingController();



  Future createUser({required String firstname, required String lastname}) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    final json ={
      'first name': firstname,
      'last name': lastname
    };

    await docUser.set(json);
  }


}