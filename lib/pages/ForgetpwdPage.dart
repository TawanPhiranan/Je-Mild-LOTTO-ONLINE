import 'package:flutter/material.dart';

class Forgetpwdpage extends StatefulWidget {
  const Forgetpwdpage({super.key});

  @override
  State<Forgetpwdpage> createState() => _ForgetpwdpageState();
}

class _ForgetpwdpageState extends State<Forgetpwdpage> {
  var emailCtl = TextEditingController();
  var passwordCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Forget Password',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
         leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), // เปลี่ยนไอคอนและสีของปุ่ม "กลับ"
          onPressed: () {
            Navigator.of(context).pop(); // กลับไปยังหน้าก่อนหน้า
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
                  "*กรุณากรอกอีเมลเพื่อส่งรหัส OTP",
                  style: TextStyle(
                      fontSize: 26,
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
                      'อีเมล',
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    TextField(
                        controller: emailCtl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)))),
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
                      onPressed: () {} ,
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(213, 96, 97, 1),
                      ),
                      child: const Text(
                        'ส่งรหัส OTP',
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
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'รหัส OTP',
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {} ,
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(213, 96, 97, 1),
                      ),
                      child: const Text(
                        'ยืนยัน',
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
}