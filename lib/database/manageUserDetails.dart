import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:save_app/components/classes.dart';

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

  Future<void> updateDepoAmt(String amount, String gid) async {
    const int toastLong = 5;
    print("We reached the final function $gid");

    final CollectionReference<Map<String, dynamic>> testCollection =
    FirebaseFirestore.instance.collection('test');

    // Get the reference to the existing document or create it if it doesn't exist
    final DocumentReference<Map<String, dynamic>> userGoalDocRef =
    testCollection.doc(uid).collection('user_goals').doc(gid);

    // Check if the document exists
    final docSnapshot = await userGoalDocRef.get();
    if (docSnapshot.exists) {
      // Document exists, update the 'deposit' field
      final double depositAmount = double.parse(amount);
      userGoalDocRef.update({
        'deposit': FieldValue.increment(depositAmount),
      });
      ShowToast toastPop = ShowToast();
      toastPop.showToast("Successfully deposited. Refresh goal to update", toastLong);
    } else {
      // Document doesn't exist, you may want to handle this case accordingly
      print('Document does not exist');
    }
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