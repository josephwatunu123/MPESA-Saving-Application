import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_app/authentication/authentication.dart';
import 'package:save_app/firebase_options.dart';
import 'package:save_app/pages/login_page.dart';
import 'package:save_app/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform )
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(GetMaterialApp( // Wrap your MaterialApp with GetMaterialApp
    key: UniqueKey(), // Specify a key for GetMaterialApp
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
