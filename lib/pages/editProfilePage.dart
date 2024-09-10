import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/models/response/edit_userId_get_res.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';

class EditProfilepage extends StatefulWidget {
  int userId;
  EditProfilepage({super.key, required this.userId});

  @override
  State<EditProfilepage> createState() => _EditProfilepageState();
}

class _EditProfilepageState extends State<EditProfilepage> {
  late EditUserIdGetResponse edituser;
  late Future<void> loadData;
  String url = '';

  TextEditingController fullnameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();

  // TextEditingController สำหรับการเปลี่ยนรหัสผ่าน
  TextEditingController currentPasswordCtl = TextEditingController();
  TextEditingController newPasswordCtl = TextEditingController();
  TextEditingController confirmPasswordCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    log('EditProfilepage initialized with userId: ${widget.userId}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Edit',
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
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              log(value);
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
      body: FutureBuilder(
          future: loadData,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (edituser == null) {
              return const Center(child: Text('ไม่สามารถโหลดข้อมูลได้'));
            }
            // ดึงค่าข้อมูลมาแสดง
            fullnameCtl.text = edituser.username;
            phoneCtl.text = edituser.phone;
            emailCtl.text = edituser.email;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'จัดการโปรไฟล์',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(177, 36, 24, 1),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(177, 36, 24, 1),
                        ),
                      ),
                    ),
                    const Text('เบอร์โทรศัพท์'),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: phoneCtl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.phone,
                    ),
                    const Center(
                        child: Text(
                      '*เบอร์โทร ชื่อ-นามสกุลที่สมัครต้องตรงกันกับบัญชี wallet',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromRGBO(177, 36, 24, 1)),
                    )),
                    const SizedBox(height: 10),
                    const Text('ชื่อ - สกุล'),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: fullnameCtl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 10),
                    const Text('อีเมล'),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: emailCtl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: Center(
                          child: FilledButton(
                              onPressed: update,
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(213, 96, 97, 1)),
                              child: const Text('บันทึก'))),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'จัดการรหัสผ่าน',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(177, 36, 24, 1),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(177, 36, 24, 1),
                      ),
                    ),
                    const Text('รหัสผ่านเดิม'),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: currentPasswordCtl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
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
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
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
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: Center(
                          child: FilledButton(
                              onPressed: resetPassword,
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(213, 96, 97, 1)),
                              child: const Text('บันทึก'))),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // ฟังก์ชันจัดการโปรไฟล์
  void update() async {
    var json = {
      "username": fullnameCtl.text,
      "phone": phoneCtl.text,
      "email": emailCtl.text,
    };
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    try {
      var res = await http.put(
        Uri.parse('$url/edituser/${widget.userId}'),
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
            content: const Text('แก้ไขโปรไฟล์เรียบร้อย'),
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
      } else {
        throw Exception('Failed to update profile: ${res.statusCode}');
      }
    } catch (err) {
      log('Error: $err');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ผิดพลาด'),
          content: Text('แก้ไขโปรไฟล์ไม่สำเร็จ: ' + err.toString()),
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

  // ฟังก์ชันจัดการรหัสผ่าน
 void resetPassword() async {
  // ตรวจสอบว่ามีการกรอกข้อมูลครบถ้วนหรือไม่
  if (currentPasswordCtl.text.isEmpty ||
      newPasswordCtl.text.isEmpty ||
      confirmPasswordCtl.text.isEmpty) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ข้อมูลไม่ครบถ้วน'),
        content: const Text('ไม่สามารถเปลี่ยนรหัสใหม่ได้ โปรดกรอกข้อมูลให้ครบถ้วนก่อน'),
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
                Navigator.pop(context);
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


  // ฟังก์ชันออกจากระบบ
 Future<void> loadDataAsync() async {
  try {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    var response = await http.get(Uri.parse('$url/users/${widget.userId}'));
    if (response.statusCode == 200) {
      // ถ้าการเรียก API สำเร็จ
      edituser = editUserIdGetResponseFromJson(response.body);
      log(edituser.email);
    } else {
      // ถ้า API ส่งสถานะที่ไม่ใช่ 200
      log('Error: ${response.statusCode}');
    }
  } catch (e) {
    // จัดการข้อผิดพลาดเมื่อเกิดปัญหาในการเรียก API
    log('Error: $e');
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