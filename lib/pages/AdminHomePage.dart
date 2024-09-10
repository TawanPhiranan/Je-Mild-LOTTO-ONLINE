import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/models/response/admin_draws_get_res.dart';
import 'package:mini_project/pages/AdminLottoDraw.dart';
import 'package:mini_project/pages/AdminProfile.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:http/http.dart' as http;

class Adiminhomepage extends StatefulWidget {
  int userId;
  Adiminhomepage({super.key, required this.userId});

  @override
  State<Adiminhomepage> createState() => _AdiminhomepageState();
}

class _AdiminhomepageState extends State<Adiminhomepage> {
  int _selectedIndex = 0;
  List<AdminDrawGetResponse> draws = [];
  late Future<void> loadData;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to different pages based on the selected index
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Adiminhomepage(userId: widget.userId)));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Adminprofile(
                      userId: widget.userId,
                    )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('Adiminhomepage initialized with userId: ${widget.userId}');

    // คำนวณความสูงของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
          title: const Text(
            'Je’ Mild',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          automaticallyImplyLeading: false, // ปิดปุ่มกลับอัตโนมัติ
          actions: [
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: const Color.fromARGB(255, 199, 199, 199),
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
          currentIndex: _selectedIndex, // Set the current index
          onTap: _onItemTapped, // Handle tap
          type: BottomNavigationBarType.fixed,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(177, 36, 24, 1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 2,
                  child: Container(
                    height:
                        screenHeight * 0.13, // ปรับความสูงของรูปภาพที่ต้องการ
                    width: double.infinity, // ใช้ความกว้างทั้งหมดของ Container
                    child: Image.asset(
                      'assets/images/jemildd.png',
                      fit: BoxFit
                          .contain, // ใช้ BoxFit เพื่อปรับขนาดรูปภาพให้พอดีกับ Container
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: loadData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 20), // เพิ่มระยะห่าง
                                Text('Loading...'), // ข้อความเพิ่มเติม
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 360,
                              height: 500,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(213, 96, 97, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      // รางวัลที่ 1
                                      Text(
                                        draws[0].drawDate,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "รางวัลที่ 1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "รางวัลละ 100,000 บาท",
                                        style: TextStyle(
                                          color: Color.fromRGBO(75, 9, 9, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Card(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 78,
                                          ),
                                          child: Text(
                                            draws[4].winningNumber,
                                            style: TextStyle(
                                              fontSize: 44,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      // เว้นระยะห่าง
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // รางวัลที่ 2
                                          Column(
                                            children: [
                                              Text(
                                                "รางวัลที่ 2",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "รางวัลละ 70,000 บาท",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      75, 9, 9, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20,
                                                  ),
                                                  child: Text(
                                                    draws[3].winningNumber,
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // รางวัลที่ 3
                                          Column(
                                            children: [
                                              Text(
                                                "รางวัลที่ 3",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "รางวัลละ 50,000 บาท",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      75, 9, 9, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20,
                                                  ),
                                                  child: Text(
                                                    draws[2].winningNumber,
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // รางวัลที่ 4
                                          Column(
                                            children: [
                                              Text(
                                                "รางวัลที่ 4",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "รางวัลละ 25,000 บาท",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      75, 9, 9, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20,
                                                  ),
                                                  child: Text(
                                                    draws[1].winningNumber,
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // รางวัลที่ 5
                                          Column(
                                            children: [
                                              Text(
                                                "รางวัลที่ 5",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "รางวัลละ 10,000 บาท",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      75, 9, 9, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20,
                                                  ),
                                                  child: Text(
                                                    draws[0].winningNumber,
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      FilledButton(
                                        onPressed: LottoDarw,
                                        style: FilledButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              177, 36, 24, 1),
                                          fixedSize: const Size(170, 100),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ออกรางวัล',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      FilledButton(
                                        onPressed: () {
                                          confirmReset(
                                              context); // เรียกฟังก์ชัน confirmReset เมื่อกดปุ่ม
                                        },
                                        style: FilledButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              108, 108, 108, 1),
                                          fixedSize: const Size(170, 100),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'รีเซ็ตระบบ',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void LottoDarw() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Adminlottodraw(userId: widget.userId),
      ),
    );
  }

  void confirmReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ยืนยันการลบ'),
        content: const Text('คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูล?'),
        actions: [
          // ปุ่มยกเลิก
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // ปิดหน้าต่างเมื่อกดปุ่มยกเลิก
            },
            child: const Text('ยกเลิก'),
          ),
          // ปุ่มตกลง
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // ปิดหน้าต่างก่อนเริ่มการลบ
              reset(context); // เรียกใช้ฟังก์ชัน reset เมื่อยืนยันการลบ
            },
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  void reset(BuildContext context) async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    try {
      // ส่งคำขอ HTTP DELETE
      await http.delete(
        Uri.parse('$url/reset/delete'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      // แสดงข้อความสำเร็จเมื่อการลบสำเร็จ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ลบข้อมูลสำเร็จ')),
      );
    } catch (e) {
      // จัดการข้อผิดพลาด
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
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

  Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    var response = await http.get(Uri.parse('$url/admin/drawsNow'));
    draws = adminDrawGetResponseFromJson(response.body);
  }
}
