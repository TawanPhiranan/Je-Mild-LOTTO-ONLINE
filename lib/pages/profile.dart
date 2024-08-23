// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/pages/editProfilePage.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final int idx; // Define the idx field

  ProfilePage({super.key, required this.idx}); // Add required idx parameter

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
                            onPressed: () {},
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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _editProfileImage();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[800],
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'น้องมาย แจกจริง',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'น้องมาย@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'ชื่อ-นามสกุล',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'น้องมาย แจกจริง',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'เบอร์โทรศัพท์',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '0123456789',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _editPage,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(213, 96, 97, 1),
                          ),
                        ),
                        child: const Text(
                          'จัดการโปรไฟล์',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _deleteAccount,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                        ),
                        child: const Text(
                          'ลบบัญชีผู้ใช้',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfilepage(),
      ),
    );
  }

  void _editProfileImage() {}

  void _deleteAccount() async {
    // var value = await Configuration.getConfig();
    // var url = value['apiEndpoint'];
    // try {
    //   var response = await http.delete(
    //     Uri.parse('$url/customers/${widget.idx}'),
    //     headers: {"Content-Type": "application/json; charset=utf-8"},
    //   );
    //   if (response.statusCode == 200) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text('สำเร็จ'),
    //         content: const Text('ลบข้อมูลเรียบร้อย'),
    //         actions: [
    //           FilledButton(
    //             onPressed: () {
    //               Navigator.popUntil(context, (route) => route.isFirst);
    //             },
    //             child: const Text('ปิด'),
    //           ),
    //         ],
    //       ),
    //     );
    //   } else {
    //     throw Exception('Failed to delete account');
    //   }
    // } catch (err) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: const Text('ผิดพลาด'),
    //       content: Text('ลบข้อมูลไม่สำเร็จ $err'),
    //       actions: [
    //         FilledButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('ปิด'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
