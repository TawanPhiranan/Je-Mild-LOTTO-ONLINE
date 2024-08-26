import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/models/response/edit_userId_get_res.dart';

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
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert,
                color: Colors.white), // เปลี่ยนสีไอคอน
            onSelected: (value) {
              log(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'logOut',
                child: Text('ออกจากระบบ'),
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
            //ดึงค่าข้อมูล
            fullnameCtl.text = edituser.username;
            phoneCtl.text = edituser.phone;
            emailCtl.text = edituser.email;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding รอบ ๆ TextField
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'จัดการโปรไฟล์',
                        style: TextStyle(
                          fontSize: 18.0, // ขนาดของข้อความ
                          fontWeight: FontWeight.bold, // น้ำหนักของข้อความ
                          color: Color.fromRGBO(177, 36, 24, 1), // สีของข้อความ
                          decoration:
                              TextDecoration.underline, // ขีดเส้นใต้ข้อความ
                          decorationColor: Color.fromRGBO(177, 36, 24,
                              1), // สีของเส้นใต้ (หากต้องการสีที่แตกต่าง)
                        ),
                      ),
                    ),
                    const Text('เบอร์โทรศัพท์'),
                    TextField(
                      controller: phoneCtl,
                    ),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
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
                    TextField(
                      controller: fullnameCtl,
                    ),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 10),
                    const Text('อีเมล'),
                    TextField(
                      controller: emailCtl,
                    ),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
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
                      color: Colors.grey, // สีของเส้นขีดคั่น
                      thickness: 1.0, // ความหนาของเส้นขีดคั่น
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'จัดการรหัสผ่าน',
                      style: TextStyle(
                        fontSize: 18.0, // ขนาดของข้อความ
                        fontWeight: FontWeight.bold, // น้ำหนักของข้อความ
                        color: Color.fromRGBO(177, 36, 24, 1), // สีของข้อความ
                        decoration:
                            TextDecoration.underline, // ขีดเส้นใต้ข้อความ
                        decorationColor: Color.fromRGBO(177, 36, 24,
                            1), // สีของเส้นใต้ (หากต้องการสีที่แตกต่าง)
                        // ความหนาของเส้นใต้
                      ),
                    ),
                    const Text('รหัสผ่านเดิม'),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    const Text('รหัสผ่านใหม่'),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    const Text('ยืนยันรหัสผ่าน'),
                    const SizedBox(
                        height: 8.0), // เพิ่มช่องว่างระหว่าง Text และ TextField
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, // Enables the background color
                          fillColor: Color.fromRGBO(217, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded corners
                            borderSide: BorderSide.none,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: Center(
                          child: FilledButton(
                              onPressed: () {},
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

  //จัดการโปรไฟล์
  void update() async {
    var json = {
      "username": fullnameCtl.text,
      "phone": phoneCtl.text,
      "email": emailCtl.text,
    };
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    try {
      var res = await http.put(Uri.parse('$url/edit/${widget.userId}'),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonEncode(json));
      log(res.body);
      var result = jsonDecode(res.body);
      // Need to know json's property by reading from API Tester
      log(result['message']);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('สำเร็จ'),
          content: const Text('บันทึกข้อมูลเรียบร้อย'),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ปิด'))
          ],
        ),
      );
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ผิดพลาด'),
          content: Text('บันทึกข้อมูลไม่สำเร็จ ' + err.toString()),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ปิด'))
          ],
        ),
      );
    }
  }

  Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    var data = await http.put(Uri.parse('$url/edit/${widget.userId}'));
    edituser = editUserIdGetResponseFromJson(data.body);
  }
}
