import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project/models/request/users_login_post_req.dart';
import 'package:mini_project/models/response/users_login_post_res.dart';
import 'package:mini_project/pages/AdminHomePage.dart';
import 'package:mini_project/pages/ForgetpwdPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/config/config.dart';
import 'package:mini_project/config/internal_config.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var phoneCtl = TextEditingController();
  var passwordCtl = TextEditingController();
  String text = '';
  int number = 0;
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
          'Log in',
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
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
                child: Text(
                  "Je' Mild",
                  style: TextStyle(
                      fontSize: 55,
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
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    TextField(
                        controller: phoneCtl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
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
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: forgetpwd,
                        child: const Text(
                          'ลืมรหัสผ่าน?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline, // ขีดเส้นใต้
                            decorationColor: Colors.blue, // สีของเส้น
                            decorationThickness: 2, // ความหนาของเส้น
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: login,
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
                        ),
                        child: const Text(
                          'เข้าสู่ระบบ',
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
      ),
    );
  }

  void forgetpwd() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Forgetpwdpage(),
        ));
  }

  void login() async {
    if (phoneCtl.text.isEmpty || passwordCtl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ข้อมูลไม่ถูกต้อง',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.bold)),
            content: Text('กรุณากรอกเบอร์โทรและรหัสผ่านให้ครบถ้วน'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text('ตกลง',style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );
      return;
    }

    log(phoneCtl.text);
    log(passwordCtl.text);
    try {
      var data = UsersLoginPostRequest(
          phone: phoneCtl.text, password: passwordCtl.text);
      var value = await http.post(Uri.parse('$API_ENDPOINT/login'),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: usersLoginPostRequestToJson(data));

      UsersLoginPostResponse users = usersLoginPostResponseFromJson(value.body);

      setState(() {
        text = '';
      });

      if (users.user.typeId == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(userId: users.user.userId),
            ));
      } else if (users.user.typeId == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Adiminhomepage(userId: users.user.userId),
            ));
      }
    } catch (eeee) {
      log(eeee.toString() + 'eiei');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ข้อมูลไม่ถูกต้อง',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.bold)),
            content: Text('เบอร์โทรหรือรหัสผ่านไม่ถูกต้อง'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ตกลง',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );

      setState(() {
        text = 'phone no or password incorrect';
      });
    }
  }
}
