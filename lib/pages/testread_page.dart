import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/database/getUserDetails.dart';

class ReadTest extends StatelessWidget {



  List<String>docsIDs=[];

  Future getDocId() async{
    await FirebaseFirestore.instance.collection('test').get().then(
        (snapshot)=> snapshot.docs.forEach((document){
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
                  future: getDocId() ,
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: docsIDs.length,
                        itemBuilder: (context,index){
                          return ListTile(title:GetUserDetails(documentId: docsIDs[index]),
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