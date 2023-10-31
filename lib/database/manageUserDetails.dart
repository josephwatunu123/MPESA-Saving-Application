import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ManageUserDetails{

  final String uid;
  ManageUserDetails({required this.uid});

  final CollectionReference TestCollection = FirebaseFirestore.instance.collection('test');

  Future updateUserData(String firstname, String lastname, String email, String phone, String pass)async{
    return await TestCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'password': pass,
    });

    
  }
}