import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/database/getUserDetails.dart';

class ReadTest extends StatefulWidget {
  @override
  _ReadTestState createState() => _ReadTestState();
}

class _ReadTestState extends State<ReadTest> {
  List<String> userGoals = [];
  String? userId;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchUserId();
  // }
  //
  // String? getCurrentUser() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String userId = user.uid;
  //     return userId;
  //   }
  //   return null;
  // }
  //
  // void fetchUserId() {
  //   userId = getCurrentUser(); // Assign userId directly
  //   if (userId != null) {
  //     print('User ID: $userId');
  //     fetchUserData();
  //   } else {
  //     print('User not signed in');
  //   }
  // }
  //
  // Future<void> fetchUserData() async {
  //   try {
  //     DocumentSnapshot documentSnapshot = (await FirebaseFirestore.instance
  //         .collection('test')
  //         .doc(userId)
  //         .collection('user_goals')
  //         .get()) as DocumentSnapshot<Object?>;
  //
  //     if (documentSnapshot.exists) {
  //       QuerySnapshot usergoalsQuery = await FirebaseFirestore.instance
  //       .collection('test').doc(userId).collection('user_goals').get();
  //       print("usergoalquery print around here");
  //       print(usergoalsQuery);
  //
  //       if(usergoalsQuery.docs.isNotEmpty){
  //         userGoals= usergoalsQuery.docs.map((doc)=>doc.get('user_goals')as String).toList();
  //       } else {
  //         userGoals = [];
  //       }
  //     } else {
  //       print("Document 'user_goals' doesn't exist.");
  //       userGoals = [];
  //     }
  //     setState(() {});
  //   } catch (e) {
  //     print('Error fetching user data: $e');
  //     userGoals = [];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: userGoals.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage('lib/images/saving.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListTile(
                      title: GetUserDetails(documentId: userGoals[index]),
                      contentPadding: EdgeInsets.all(20),
                      tileColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
