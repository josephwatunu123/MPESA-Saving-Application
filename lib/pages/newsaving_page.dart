

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
        children:[
              SizedBox(height: 20.0),
              Text('Create Goal',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              TextFormField(
              controller: controller.amount,
              decoration: InputDecoration(
                label: Text('Amount'),
                prefixIcon: Icon(Icons.monetization_on_outlined),
                enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.green)),
                labelStyle: TextStyle(color: Colors.black87, fontSize: 30),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0, color: Colors.lightGreen)
                ),
                contentPadding: EdgeInsets.symmetric(vertical:25.0, horizontal:10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                ),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 50.0),
              TextFormField(
              controller: controller.goalname,
              decoration: InputDecoration(
                label: Text('Goal name'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.green)
                ),
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0, color: Colors.lightGreen)
                      )
                    ),
                  ),
                SizedBox(height: 40.0),
                TextFormField(
                controller: controller.maturity,
                decoration: InputDecoration(
                  label: Text('Mautrity date format dd-mm-yy'),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.green)
                ),
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0, color: Colors.lightGreen)
                )
            ),
          ),
               SizedBox(height: 40.0),
              ElevatedButton(
              onPressed: () {
                final controller = Get.find<newGoalControllers>();// Create an instance
                controller.createNewGoal(
                    amount: controller.amount.text,
                    goalname: controller.goalname.text,
                    maturity: controller.maturity.text,
                );
                Navigator.pop(context);
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
        ),
          )
    ),
    );

  }




}