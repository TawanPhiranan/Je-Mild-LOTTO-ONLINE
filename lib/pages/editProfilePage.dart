import 'dart:developer';

import 'package:flutter/material.dart';

class EditProfilepage extends StatefulWidget {
  const EditProfilepage({super.key});

  @override
  State<EditProfilepage> createState() => _EditProfilepageState();
}

class _EditProfilepageState extends State<EditProfilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('EDIT',
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
      ),
      body: SingleChildScrollView(
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
                    decoration: TextDecoration.underline, // ขีดเส้นใต้ข้อความ
                    decorationColor: Color.fromRGBO(177, 36, 24,
                        1), // สีของเส้นใต้ (หากต้องการสีที่แตกต่าง)
                    // ความหนาของเส้นใต้
                  ),
                ),
              ),
              const Text('เบอร์โทรศัพท์'),
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
                        onPressed: () {},
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
                  decoration: TextDecoration.underline, // ขีดเส้นใต้ข้อความ
                  decorationColor: Color.fromRGBO(
                      177, 36, 24, 1), // สีของเส้นใต้ (หากต้องการสีที่แตกต่าง)
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ), // ไอคอนสำหรับแท็บ "Home"
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_rounded), // ไอคอนสำหรับแท็บ "Home"
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.casino), // ไอคอนสำหรับแท็บ "Home"
              label: 'Lotto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt), // ไอคอนสำหรับแท็บ "Home"
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), // ไอคอนสำหรับแท็บ "Home"
              label: 'Profile',
            ),
          ],
          unselectedItemColor:
              const Color.fromARGB(255, 199, 199, 199), // สีของไอคอนที่ไม่เลือก
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
          type: BottomNavigationBarType.fixed),
    );
  }
}
