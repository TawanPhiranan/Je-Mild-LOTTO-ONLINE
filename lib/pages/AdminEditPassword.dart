import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/pages/AdminProfile.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/pages/LogoPage.dart';

class Admineditpassword extends StatefulWidget {
  int userId;
  Admineditpassword({super.key, required this.userId});

  @override
  State<Admineditpassword> createState() => _AdmineditpasswordState();
}

class _AdmineditpasswordState extends State<Admineditpassword> {
  TextEditingController currentPasswordCtl = TextEditingController();
  TextEditingController newPasswordCtl = TextEditingController();
  TextEditingController confirmPasswordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Edit Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'Logout') {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'คุณต้องการออกจากระบบใช่หรือไม่?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('ไม่'),
                          ),
                          FilledButton(
                            onPressed: Logout,
                            child: const Text('ใช่'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('ออกจากระบบ'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the entire body
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Add space above the header text
              Text(
                'จัดการรหัสผ่าน',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(177, 36, 24, 1),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(177, 36, 24, 1),
                ),
              ),
              const SizedBox(height: 20), // Additional space after the header
              const Text('รหัสผ่านเดิม'),
              const SizedBox(height: 8.0),
              TextField(
                controller: currentPasswordCtl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Text('รหัสผ่านใหม่'),
              const SizedBox(height: 8.0),
              TextField(
                controller: newPasswordCtl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Text('ยืนยันรหัสผ่าน'),
              const SizedBox(height: 8.0),
              TextField(
                controller: confirmPasswordCtl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: Center(
                  child: FilledButton(
                    onPressed: _changePassword,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(213, 96, 97, 1),
                    ),
                    child: const Text('บันทึก'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword() async {
    if (currentPasswordCtl.text.isEmpty ||
        newPasswordCtl.text.isEmpty ||
        confirmPasswordCtl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ข้อมูลไม่ครบถ้วน'),
          content: const Text(
              'ไม่สามารถเปลี่ยนรหัสใหม่ได้ โปรดกรอกข้อมูลให้ครบถ้วนก่อน'),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ปิด'),
            ),
          ],
        ),
      );
      return; // ออกจากฟังก์ชันถ้าข้อมูลไม่ครบ
    }

    // ตรวจสอบว่ารหัสผ่านใหม่และการยืนยันรหัสผ่านตรงกันหรือไม่
    if (newPasswordCtl.text != confirmPasswordCtl.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('รหัสผ่านไม่ตรงกัน'),
          content: const Text('รหัสผ่านใหม่และการยืนยันรหัสผ่านไม่ตรงกัน'),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ปิด'),
            ),
          ],
        ),
      );
      return; // ออกจากฟังก์ชันถ้ารหัสผ่านไม่ตรงกัน
    }

    var json = {
      "currentPassword": currentPasswordCtl.text,
      "newPassword": newPasswordCtl.text,
      "confirmPassword": confirmPasswordCtl.text,
    };
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    try {
      var res = await http.put(
        Uri.parse('$url/resetpassword/${widget.userId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode(json),
      );

      if (res.statusCode == 200) {
        log(res.body);
        var result = jsonDecode(res.body);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('สำเร็จ'),
            content: const Text('เปลี่ยนรหัสผ่านเรียบร้อย'),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Adminprofile(userId: widget.userId),
                    ),
                  );
                },
                child: const Text('ปิด'),
              ),
            ],
          ),
        );
      } else {
        throw Exception('Failed to update password: ${res.statusCode}');
      }
    } catch (err) {
      log('Error: $err');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ผิดพลาด'),
          content: Text('เปลี่ยนรหัสผ่านไม่สำเร็จ: ' + err.toString()),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ปิด'),
            ),
          ],
        ),
      );
    }
  }

  void Logout() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Logopage(),
        ));
  }
}
