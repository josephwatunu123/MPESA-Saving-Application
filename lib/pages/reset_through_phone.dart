import 'package:flutter/material.dart';
import 'package:save_app/components/header_widget.dart';
import 'package:save_app/pages/otp_screen.dart';

class ResetPassPhone extends StatelessWidget{

  const ResetPassPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Container(
                        width: 250.0,
                        height: 250.0,
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(50.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black, width: 2.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/forgotpass.jpg')),
                        )),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text("Enter your Phone Number",style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text('Mobile No'),
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.black87),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.lightGreen))),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(width: double.infinity,child: ElevatedButton
                          (onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute( builder: (context)=> OTPScreen(),
                            ),
                          );
                        }
                          ,child: const Text("Next"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0),
                            fixedSize: Size(150, 70),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Colors.black87,
                            elevation: 15,
                            side: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),)
                      ],
                    )
                )
              ],
            )
        ));
  }
}