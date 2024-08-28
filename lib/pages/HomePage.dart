import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/models/response/users_login_post_res.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  //รับ userID
  int userId;
  Homepage({super.key, required this.userId});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // Track the selected index

  late UsersLoginPostResponse users;
  
  @override
  void initState() {
    super.initState();
    // Log the userId to see its value
    log('Homepage initialized with userId: ${widget.userId}');
  }
  // UsersLoginPostResponse users = usersLoginPostResponseFromJson(value.body);
  

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Je’ Mild',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
        unselectedItemColor: const Color.fromARGB(255, 199, 199, 199),
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle tap
        type: BottomNavigationBarType.fixed,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              children: [
                SizedBox(
                  width: 390,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(213, 96, 97, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        //เเสงเเละเงา
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ยอดเงินคงเหลือ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Icon(
                                Icons.wallet_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.monetization_on_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                              Text(
                                "0.00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "บาท",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "น้องมาย แจกจริง",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //กรอบ 2
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FilledButton(
                            onPressed: Lotto,
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(245, 210, 99, 1),
                              fixedSize: const Size(175, 110),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.casino,
                                  color: Color.fromRGBO(77, 77, 77, 1),
                                  size: 65,
                                ),
                                Text(
                                  'Lotto',
                                  style: TextStyle(
                                      color: Color.fromRGBO(77, 77, 77, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                            onPressed: CheckPage,
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(245, 210, 99, 1),
                              fixedSize: const Size(175, 110),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16), // ปรับความโค้งของมุม
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.card_giftcard_rounded,
                                  color: Color.fromRGBO(77, 77, 77, 1),
                                  size: 65,
                                ),
                                Text(
                                  'เช็คผลรางวัล',
                                  style: TextStyle(
                                      color: Color.fromRGBO(77, 77, 77, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //กรอบ 3
                const SizedBox(height: 10),
                SizedBox(
                  width: 390,
                  height: 530,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(213, 96, 97, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //รางวัลที่ 1
                          Text(
                            "1 สิงหาคม 2567",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "รางวัลที่ 1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "รางวัลละ 100,000 บาท",
                            style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Card(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 78),
                              child: Text(
                                "407041",
                                style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // เว้นระยะห่าง
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //รางวัลที่ 2
                              Column(
                                children: [
                                  Text(
                                    "รางวัลที่ 2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "รางวัลละ 70,000 บาท",
                                    style: TextStyle(
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "596170",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //รางวัลที่ 3
                              Column(
                                children: [
                                  Text(
                                    "รางวัลที่ 3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "รางวัลละ 50,000 บาท",
                                    style: TextStyle(
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "903093",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //รางวัลที่ 4
                              Column(
                                children: [
                                  Text(
                                    "รางวัลที่ 4",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "รางวัลละ 25,000 บาท",
                                    style: TextStyle(
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "903093",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //รางวัลที่ 5
                              Column(
                                children: [
                                  Text(
                                    "รางวัลที่ 5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "รางวัลละ 10,000 บาท",
                                    style: TextStyle(
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "040499",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  void Logout() {
     Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Logopage(),
                )
     );
  }
  void Lotto() {
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LottoPage(userId: widget.userId),
        ));
  }
  void CheckPage() {
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(userId: widget.userId),
        ));
  }
}
