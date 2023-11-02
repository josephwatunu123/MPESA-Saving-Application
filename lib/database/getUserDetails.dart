import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatelessWidget {
  final String documentId;

  GetUserDetails({required this.documentId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('test')
          .doc(documentId)
          .collection('user_goals')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("Found some data");
          if (snapshot.data!.docs.isNotEmpty) {
            // Get the first document from the QuerySnapshot.
            DocumentSnapshot documentSnapshot = snapshot.data!.docs.first;

            // Check if the document exists.
            if (documentSnapshot.exists) {
              Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

              if (data.containsKey('goalname') && data.containsKey('amount')) {
                String goalName = data['goalname'].toString();
                String amount = data['amount'].toString();

                return Text('$goalName $amount');
              } else {
                return Text('Data is missing or invalid.');
              }
            } else {
              return Text('Document not found.');
            }
          } else {
            // The QuerySnapshot does not contain any documents.
            return Text('No documents found.');
          }
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
