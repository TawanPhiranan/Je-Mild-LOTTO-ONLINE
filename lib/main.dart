import 'package:flutter/material.dart';
import 'package:mini_project/pages/AdminHomePage.dart';
import 'package:mini_project/pages/AdminAllRandom.dart';
import 'package:mini_project/pages/AdminEditPassword.dart';
import 'package:mini_project/pages/AdminLottoDraw.dart';
import 'package:mini_project/pages/AdminProfile.dart';
import 'package:mini_project/pages/AdminRandomNumber.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/editProfilePage.dart';
import 'package:mini_project/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: OrderPage(userId: 23), 
    );
  }
}
