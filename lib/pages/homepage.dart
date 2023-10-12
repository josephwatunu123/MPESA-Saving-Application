import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      // theme of the widget
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // Inner UI of the application
      home: const MyHomePage(title: 'Home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // Sets the content to the
      // center of the application page
      body:  Center(
        // Sets the content of the Application
          child: Container(
           width: 200,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.black,width: 10)
            ),
          )),
    );
  }
}
