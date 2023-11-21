import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:save_app/controllers/newgoal_controllers.dart';

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

  Future createSaveNowWallet()async{
    CollectionReference TestCollection = FirebaseFirestore.instance.collection('test');
    TestCollection.doc(uid).collection('user_goals').add(
      {
        'goalname': 'save now',
        'amount': '0',
        'goalId': uid,
      }
    );
    return 'success';
  }

  Future<void> createTransactionDocument() async {
    CollectionReference testCollection = FirebaseFirestore.instance.collection('test');
    testCollection.doc(uid).collection('Transactions').add(
      {
        'Joined':FieldValue.serverTimestamp()
      }
    );
    print('Transaction Doc Creation worked');
  }


  Future<void> DeleteGoalComplete(String required_id) async {
    try {
      CollectionReference TestCollection = FirebaseFirestore.instance.collection('test');
      await TestCollection.doc(uid).collection('user_goals').doc(required_id).delete();
      print('Document deleted successfully!');
    } catch (e) {
      print('Error deleting goal: $e');
    }
  }


}