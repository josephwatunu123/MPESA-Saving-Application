import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class newGoalControllers extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  late StreamSubscription<User?> _userSubscription;

  final CollectionReference TestCollection = FirebaseFirestore.instance.collection('test');

  final amount = TextEditingController();
  final goalname = TextEditingController();
  final maturity = TextEditingController();

  @override
  void onInit() {
    super.onInit(); // Always call super.onInit() at the beginning of onInit
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _userSubscription = firebaseUser.listen((user) {
      if (user != null) {
        String userId = user.uid;
        // Perform actions with userId if necessary
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _userSubscription.cancel(); // Don't forget to cancel the subscription when the controller is closed
  }

  Future createNewGoal({required int amount, required String goalname, required String maturity}) async {
    final user = firebaseUser.value; // Get the current user from the Rx<User?>.
    if (user != null) {
      await TestCollection
          .doc(user.uid) // Use the UID of the user.
          .collection('user_goals')
          .add({
        'goalname': goalname,
        'amount': amount,
        'maturity': maturity,
      });
    } else {
      // Handle the case where there is no user logged in.
    }
  }
}
