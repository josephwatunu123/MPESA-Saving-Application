import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class newGoalControllers extends GetxController{

  //the test controllers we will use for now

  final firstncont =TextEditingController();
  final lastnamecont =TextEditingController();



  Future createUser({required String firstname, required String lastname}) async{
    firstname= firstncont.text;
    lastname=lastnamecont.text;
    final docUser = FirebaseFirestore.instance.collection('test').doc();

    final user = User(
        id: docUser.id,
        firstname: firstname,
        lastname: lastname
    );
    final json = user.toJson();

    await docUser.set(json);
  }



}

class User{
  String id;
  final String firstname;
  final String lastname;

  User({
    this.id='',
    required this.firstname,
    required this.lastname
});

  Map<String, dynamic> toJson()=>{
    'id': id,
    'firstname': firstname,
    'lastname': lastname,
  };

  static User fromJson(Map<String, dynamic> json)=> User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname']
  );
}