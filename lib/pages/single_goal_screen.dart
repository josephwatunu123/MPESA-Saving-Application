import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/authentication.dart';
import 'package:save_app/components/common_boxDecoration.dart';
import 'package:save_app/components/goal_delete_confirmation_card.dart';
import 'package:save_app/components/modalContexts_homepage.dart';
import 'package:save_app/pages/deposit_money_screen.dart';
import 'package:save_app/pages/homepage.dart';

class viewGoal extends StatelessWidget{

  final Map<String, dynamic>goalData;

  viewGoal({Key? key ,required this.goalData}): super (key: key);


  boxDecoration boxdecoration = boxDecoration();

  static const descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    fontSize: 18,

  );
  static const buttondec = TextStyle(
    color: Colors.black,

  );

 ModalContexts saveContext = ModalContexts();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 250.0,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('lib/images/hope2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.red
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(padding: EdgeInsets.all(10),
                        child: Text(
                          goalData['goalname']??'Name unavailable',
                          style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 17),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('amount saved',
                        style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 7),
                      Text('Target'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(goalData['deposit'].toString()??'0'),
                      Text(goalData['amount'].toString()??'0'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all( 9.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Activity',
                style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold) ,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: boxdecoration.buildBoxDecoration(),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Save',
                        style: descTextStyle,),
                      Text('save money in this goal'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Save Now',
                        style: buttondec),
                        onPressed: (){
                          saveContext.showSaveMoneyInput(context, goalData['goalId']);
                        },)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: boxdecoration.buildBoxDecoration(),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Transfer to a Goal',
                        style: descTextStyle,),
                      Text('move money to a goal'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Transfer',
                            style: buttondec),
                        onPressed: (){
                          saveContext.showTransferMoney(context);
                        },)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: boxdecoration.buildBoxDecoration(),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Withdraw Funds',
                        style: descTextStyle,),
                      Text('Move money to MPESA'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Withdraw',
                            style: buttondec),
                        onPressed: (){
                          saveContext.showWidthdrawMoney(context, goalData['goalId']);
                        },)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: boxdecoration.buildBoxDecoration(),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Edit goal',
                        style: descTextStyle,),
                      Text('modify this goal'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Modify',
                            style: buttondec),
                        onPressed: (){},)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: boxdecoration.buildBoxDecoration(),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Delete goal',
                        style: descTextStyle,),
                      Text('delete goal'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
                            shadowColor: Colors.blueGrey,
                            title: const Text('Delete Goal?'),
                            content: const Text('Are you sure you want to delete this goal? Note that funds will be transfered to \'save now\' wallet'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  AuthenticationRepository.instance.deleteGoal(goalData);
                                  Navigator.pop(context, 'OK');
                                  Get.to(() => HomePage());
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }


}