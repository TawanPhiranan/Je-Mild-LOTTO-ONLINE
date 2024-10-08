import 'package:flutter/material.dart';
import 'package:mini_project/pages/AdminHomePage.dart';
import 'package:mini_project/pages/AdminLottoDraw.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: ThemeData(useMaterial3: f),
      title: 'Flutter Demo',
      home: Logopage()
    );
  }
}
