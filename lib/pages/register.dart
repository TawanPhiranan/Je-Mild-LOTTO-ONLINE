// import 'dart:convert';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/config/internal_config.dart';
import 'package:mini_project/models/request/user_Register_post_req.dart';
import 'package:mini_project/pages/Loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/pages/LogoPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var fullnameCtl = TextEditingController();
  var phoneCtl = TextEditingController();
  var emailCtl = TextEditingController();
  var passwordCtl = TextEditingController();
  var confirmpassCtl = TextEditingController();

  String url = '';
  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (config) {
        url = config['apiEndpoint'];
        // log(config ['apiEndpoint']);
      },
    ).catchError((err) {
      log(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Sing Up',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Je'Mild",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(177, 36, 24, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'เบอร์โทรศัพท์',
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                      controller: phoneCtl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)))),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 10, 10),
              child: Text(
                "เบอร์โทร ชื่อ-นามสกุล ที่สมัครต้องตรงกันกับบัญชี wallet",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(177, 36, 24, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ชื่อ-นามสกุล',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                      controller: fullnameCtl,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'อีเมล',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                      controller: emailCtl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'รหัสผ่าน',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                      controller: passwordCtl,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ยืนยันรหัสผ่าน',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                      controller: confirmpassCtl,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)))),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: register,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
                      ),
                      child: const Text(
                        'ลงทะเบียน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void register() {
    if (fullnameCtl.text.isEmpty ||
        phoneCtl.text.isEmpty ||
        emailCtl.text.isEmpty ||
        passwordCtl.text.isEmpty ||
        confirmpassCtl.text.isEmpty) {
      log("ข้อมูลไม่ครบ");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('กรุณากรอกข้อมูลให้ครบ'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด dialog
                },
                child: const Text('ตกลง'),
              ),
            ],
          );
        },
      );
      return;
    }

    var data = UserResgisterPostRequest(
      username: fullnameCtl.text,
      phone: phoneCtl.text,
      email: emailCtl.text,
      password: passwordCtl.text,
      confirmPassword: confirmpassCtl.text,
    );

    http
        .post(Uri.parse("$API_ENDPOINT/register"),
            headers: {"Content-Type": "application/json"},
            body: userResgisterPostRequestToJson(data))
        .then((response) {
      if (response.statusCode == 201) {
        // ลงทะเบียนสำเร็จ
        log("Insert OK");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('สมัครสมาชิกสำเร็จ'),
              content: Text('คุณได้ลงทะเบียนเรียบร้อยแล้ว'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Logopage(),
                        ));
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            );
          },
        );
      } else {
        // ตรวจสอบสถานะการตอบกลับ
        String errorMessage;
        if (response.statusCode == 409) {
          errorMessage =
              "อีเมล หรือ เบอร์โทรศัพท์ ถูกใช้แล้ว : กรุณาลองอีกครั้ง";
        } else if (response.statusCode == 400) {
          errorMessage = 'ยืนยันรหัสผ่านไม่ถูกต้อง : กรุณาลองอีกครั้ง';
        } else {
          errorMessage = 'เกิดข้อผิดพลาด : กรุณาลองอีกครั้ง';
        }
        log("Insert Error ${response.statusCode}: $errorMessage");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('สมัครสมาชิกไม่สำเร็จ'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิด dialog
                  },
                  child: const Text('ตกลง'),
                )
              ],
            );
          },
        );
      }
    }).catchError((error) {
      log("Insert Error $error");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('สมัครสมาชิกไม่สำเร็จ'),
            content: Text('เกิดข้อผิดพลาด: กรุณาลองอีกครั้ง'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด dialog
                },
                child: const Text('ตกลง'),
              )
            ],
          );
        },
      );
    });
  }
}
