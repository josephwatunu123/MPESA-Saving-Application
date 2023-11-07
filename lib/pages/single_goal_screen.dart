import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class viewGoal extends StatelessWidget{
  static const descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    fontSize: 18,

  );
  static const buttondec = TextStyle(
    color: Colors.black,

  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 290.0,
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
                          'Goal Name',
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
              padding: EdgeInsets.all(15),
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
                      Text('500'),
                      Text('5000'),
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
              decoration: BoxDecoration(
                border: Border( bottom: BorderSide(
                  color: Colors.green,
                  width: 1.5
                ))
              ),
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
                        onPressed: (){},)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border( bottom: BorderSide(
                      color: Colors.green,
                      width: 1.5
                  ))
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Add from Save now',
                        style: descTextStyle,),
                      Text('move money from save now'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Transfer',
                            style: buttondec),
                        onPressed: (){},)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border( bottom: BorderSide(
                      color: Colors.green,
                      width: 1.5
                  ))
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Withdraw',
                        style: descTextStyle,),
                      Text('Move money from goal to MPESA'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text('Withdraw',
                            style: buttondec),
                        onPressed: (){},)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border( bottom: BorderSide(
                      color: Colors.green,
                      width: 1.5
                  ))
              ),
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
              decoration: BoxDecoration(
                  border: Border( bottom: BorderSide(
                      color: Colors.green,
                      width: 1.5
                  ))
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Delete goal',
                        style: descTextStyle,),
                      Text('delete goal and move money to save now'),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed:(){

                        },
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