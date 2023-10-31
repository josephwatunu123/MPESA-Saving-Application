import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/database/getUserDetails.dart';

class ReadTest extends StatelessWidget {
  List<String> docsIDs = [];

  Future getDocId() async {
    DocumentReference testDocRef = FirebaseFirestore.instance.collection('test').doc('your_test_document_id');
    await FirebaseFirestore.instance.collection('saving_goal').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docsIDs.add(document.reference.id);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docsIDs.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(15),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width:2.0),
                          image: DecorationImage(
                              image: AssetImage('lib/images/saving.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                          child: ListTile(
                            title: GetUserDetails(documentId: docsIDs[index]),
                            contentPadding: EdgeInsets.all(20), // Add padding to the ListTile content
                            tileColor: Colors.black87, // Background color of the ListTile
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Add rounded corners
                            ),
                            // You can customize text styles as well
                            titleTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ),

                      );
                    },
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
