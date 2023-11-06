import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatefulWidget {

  late final String documentId;
  GetUserDetails({required this.documentId});

  @override
  _SubCategoryClassState createState() => _SubCategoryClassState();

}

class _SubCategoryClassState extends State<GetUserDetails> {
  final db= FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
    stream: db
        .collection('test')
        .doc(widget.documentId)
        .collection('user_goals')
        .snapshots(),
      builder: (context, snapshot){
      if(snapshot.hasData){
        var docs= snapshot.data!.docs;
        final goalData= docs as Map<String, dynamic>;
        return Text('${goalData['goalname']} ${goalData['amount']}');
      }
      return Text("Data currently unavailable");
      },
    )
    );}

}
