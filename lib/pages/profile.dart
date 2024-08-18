// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert,color: Colors.white,),
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
                          editProfileImage(); 
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
              SizedBox(height: 10),
              Text(
                'น้องมาย แจกจริง',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'น้องมาย@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child:  Text(
                        'ชื่อ-นามสกุล',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30), 
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
              SizedBox(height: 30),
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
                  SizedBox(width: 30), 
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
              SizedBox(height: 70),
              Center(
                child: Column(
                  children: [
                     SizedBox(
                      width: double.infinity, 
                      child: FilledButton(
                        onPressed: EditPage,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(177, 36, 24, 1),
                          ),
                        ),
                        child: const Text('จัดการโปรไฟล์',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20 , 
                          ), 
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity, 
                      child: FilledButton(
                        onPressed: deleteAccount,  
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey), 
                        ),
                        child: const Text('ลบบัญชีผู้ใช้',
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
  EditPage(){}
  deleteAccount(){}
  editProfileImage(){}
}
