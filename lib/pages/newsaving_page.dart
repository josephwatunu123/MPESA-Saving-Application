

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/newgoal_controllers.dart';

class NewSaving extends StatelessWidget{
  const NewSaving({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final controller= Get.put(newGoalControllers());

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
        children:[
            TextFormField(
            controller: controller.firstncont,
            decoration: InputDecoration(
              label: Text('First Name'),
              prefixIcon: Icon(Icons.person_outline_rounded),
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.black87),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.0, color: Colors.lightGreen)
              )
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
            controller: controller.lastnamecont,
            decoration: InputDecoration(
              label: Text('Last Name'),
              prefixIcon: Icon(Icons.person_outline_rounded),
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.black87),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.0, color: Colors.lightGreen)
                    )
                  ),
                ),
             SizedBox(height: 20.0),
            ElevatedButton(
            onPressed: () {
              final controller = Get.find<newGoalControllers>();// Create an instance
              controller.createUser(
                  firstname: controller.firstncont.text,
                  lastname: controller.lastnamecont.text);
              }, child: Text('Create'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20.0),
              fixedSize: Size(150, 60),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.black87,
              elevation: 15,
              side: BorderSide(color: Colors.black, width: 2),
            ),)

            ]


          ),
        )
    ),
    );

  }




}