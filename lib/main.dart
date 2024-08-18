import 'package:flutter/material.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/changePwdPage.dart';
import 'package:mini_project/pages/editProfilePage.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(useMaterial3: f),
      title: 'Flutter Demo',
      home: Loginpage(),
    );
  }
}
