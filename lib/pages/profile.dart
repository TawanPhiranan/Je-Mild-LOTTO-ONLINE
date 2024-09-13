// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/config/internal_config.dart';
import 'package:mini_project/models/response/edit_userId_get_res.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:mini_project/pages/editProfilePage.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  int userId;
  ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

  late EditUserIdGetResponse user;
  late Future<void> loadData;
  String url = '';

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(userId: widget.userId)));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Walletpage(userId: widget.userId)));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LottoPage(
                      userId: widget.userId,
                    )));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderPage(
                      userId: widget.userId,
                    )));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      userId: widget.userId,
                    )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('ProfilePage initialized with userId: ${widget.userId}');
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: 'Lotto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // ไอคอนสำหรับแท็บ "Home"
            label: 'Profile',
          ),
        ],
        unselectedItemColor: const Color.fromARGB(255, 199, 199, 199),
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      body: FutureBuilder(
        future: loadData,
        builder: (context, snapshot) {
          // Loading...
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: const Stack(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          //  Image.asset('assets/imag')
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.email,
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
                            user.username,
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
                            user.phone,
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('ยืนยันการลบ'),
                                    content: const Text(
                                        'คุณแน่ใจว่าต้องการลบบัญชีผู้ใช้หรือไม่?'),
                                    actions: [
                                      TextButton(
                                        child: const Text('ยกเลิก'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('ลบ'),
                                        onPressed: () {
                                          _deleteAccount();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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
          );
        },
      ),
    );
  }

  //ดึงข้อมูลออกมาโชว์ โดยใช้เส้นเดียวกับ Edit
  Future<void> loadDataAsync() async {
    try {
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];
      var response = await http.get(Uri.parse('$url/users/${widget.userId}'));
      if (response.statusCode == 200) {
        // ถ้าการเรียก API สำเร็จ
        user = editUserIdGetResponseFromJson(response.body);
        log(user.email);
      } else {
        // ถ้า API ส่งสถานะที่ไม่ใช่ 200
        log('Error: ${response.statusCode}');
      }
    } catch (e) {
      // จัดการข้อผิดพลาดเมื่อเกิดปัญหาในการเรียก API
      log('Error: $e');
    }
  }

  void _editPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilepage(userId: widget.userId),
      ),
    );
  }

  void _editProfileImage() {}

  void _deleteAccount() async {
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];
    try {
      http.delete(
        Uri.parse('$url/delete/${widget.userId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('สำเร็จ'),
          content: const Text('ลบข้อมูลเรียบร้อย'),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
                child: const Text('ปิด'))
          ],
        ),
      );
      log(widget.userId.toString() + "KK");
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ผิดพลาด'),
          content: Text('ลบข้อมูลไม่สำเร็จ $err'),
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

  void Logout() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Logopage(),
        ));
  }
}
