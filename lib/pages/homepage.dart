import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/controllers/newgoal_controllers.dart';
import 'package:save_app/pages/newsaving_page.dart';

import '../components/SavingCardWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Home page'),
    );
  }
}
void _showOptionsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              ListTile(
                title: Text('New Saving Goal'),
                onTap: () {
                  Get.to(()=> NewSaving());
                  Navigator.pop(context); // Close the modal
                },
              ),
              ListTile(
                title: Text('Save Now'),
                onTap: () {
                  // Handle 'Save Now' action
                  Navigator.pop(context); // Close the modal
                },
              ),
              ListTile(
                title: Text('New Group'),
                onTap: () {
                  // Handle 'New Group' action
                  Navigator.pop(context); // Close the modal
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SavingCardWidget(),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: const Icon(Icons.add),
            onPressed: () {
              _showOptionsModal(context);
            },
          ),
        )
    );
  }
}