import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_app/components/common_boxDecoration.dart';

class TransactionsPage extends StatelessWidget {
  final String? uid;

  TransactionsPage({required this.uid});



  final db = FirebaseFirestore.instance;

  boxDecoration boxdecoration = boxDecoration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection('test')
                    .doc(uid)
                    .collection('Transactions')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    print("transactions page working with $uid");
                    return Text('No transactions found');
                  }
                  List<DocumentSnapshot> docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      var transactionData =
                      docs[index].data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          Container(
                            decoration: boxdecoration.buildBoxDecoration(),
                            padding: EdgeInsets.all(15),
                            child: ListTile(
                              title: Text(
                                  transactionData['Deposited'] ?? "Error getting details"),
                              subtitle: Text(
                                  '${transactionData['Time'] ?? "timestamp"}'),
                              titleTextStyle: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),

                          ),
                          Container(
                            decoration: boxdecoration.buildBoxDecoration(),
                            padding: EdgeInsets.all(15),
                            child: ListTile(
                              title: Text(
                                  transactionData['Withdrawal'] ?? "Error getting details"),
                              subtitle: Text(
                                  '${transactionData['Time'] ?? "timestamp"}'),
                              titleTextStyle: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),

                          )
                        ],

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
