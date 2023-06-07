import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes/screens/login&regist/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // LocalNotificationService().initNotification();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: WelcomePage(),

    );
  }
}