import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatelessWidget{
  final String documentId;

  GetUserDetails({required this.documentId});

  String? firstname, lastname;

  @override
  Widget build (BuildContext context){
    CollectionReference test = FirebaseFirestore.instance.collection('test');

    return FutureBuilder<DocumentSnapshot>(
      future: test.doc(documentId).get(),
      builder: ((context, snapshot){
        if(snapshot.connectionState== ConnectionState.done){
          Map<String, dynamic> data=
              snapshot.data!.data() as Map<String, dynamic>;

          return Text('${data['firstname']}'+ ' '+'${data['lastname']}' );
        }
        return Text('loading');
      }
      ),

    );
  }
}