import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepositMoney extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200.0,
                height: 150.0,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(50.0),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
              ),

            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){

              },
              child:Text('Enter Amount'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(200, 70),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.lightGreen,
                elevation: 20,
              ),


            )
          ],
        ),
      ),
    );
  }

}