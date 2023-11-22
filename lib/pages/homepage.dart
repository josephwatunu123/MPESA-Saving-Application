import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/controllers/newgoal_controllers.dart';
import 'package:save_app/database/getUserDetails.dart';
import 'package:save_app/pages/newsaving_page.dart';
import 'package:save_app/pages/single_goal_screen.dart';
import 'package:save_app/pages/testread_page.dart';

import '../components/SavingCardWidget.dart';

class HomePage extends StatelessWidget {



  String? userId;
  var CurrentUser= FirebaseAuth.instance.currentUser;
  final db= FirebaseFirestore.instance;



  Future<String?> getDocId() async {
    if(CurrentUser!=null){
      userId= CurrentUser?.uid;
      print('This user id: $userId');
      return userId;

    }
    return null;

  }

  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: [
                ListTile(
                  title: Text('New Saving Goal'),
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(()=> NewSaving());
                    // Close the modal
                  },
                ),
                ListTile(
                  title: Text('Save Now (Currently view goals from db)'),
                  onTap: () {
                    // Get.to(()=> ReadTest());
                    Navigator.pop(context); // Close the modal
                  },
                ),
                ListTile(
                  title: Text('New Group (Currently single goal info)'),
                  onTap: () {
                    Navigator.pop(context);

                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<String?>(
                future: getDocId(), // Obtain the document ID
                builder: (context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show loading indicator while waiting for data
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Text("User ID not found");
                  }
                  String userId = snapshot.data!;
                  return StreamBuilder<QuerySnapshot>(
                    stream: db
                        .collection('test')
                        .doc(userId)
                        .collection('user_goals')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Show loading indicator while waiting for data
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Text("No goals found for this user.");
                      }
                      List<DocumentSnapshot> docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length, // Set the number of items in the list
                        itemBuilder: (context, index) {
                          var goalData = docs[index].data() as Map<String, dynamic>; // Correctly cast the data

                          return GestureDetector(
                            onTap: (){
                              Get.to(() => viewGoal(goalData: goalData));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.black, width: 2.0),
                                    image: DecorationImage(
                                        image: AssetImage('lib/images/saving.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                                child: ListTile(
                                  title: Text(goalData['goalname'] ?? "No goal name"), // Display the goal name
                                  subtitle: Text('${goalData['amount'] ?? "0"}'), // Display the amount
                                  contentPadding: EdgeInsets.all(20), // Add padding to the ListTile content
                                  tileColor: Colors.black87, // Background color of the ListTile
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Add rounded corners
                                  ),
                                  // You can customize text styles as well
                                  titleTextStyle: TextStyle(
                                    color: Colors.white, // Changed to white for visibility
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30,
                                  ),
                                  subtitleTextStyle: TextStyle(
                                    color: Colors.white70, // Changed to white for visibility
                                    fontSize: 20,
                                  ),
                            ),
                          ));

                        },
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                    padding: EdgeInsets.only(right: 16, bottom: 25)  ,
                  child:FloatingActionButton(
                  elevation: 10.0,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    _showOptionsModal(context);
                  }
              ),
              )
            )

          ],
        ),
      ),
    );
  }

}

