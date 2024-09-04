import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/models/response/Order_response.dart';
import 'package:mini_project/models/response/admin_draws_get_res.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:http/http.dart' as http;

class OrderPage extends StatefulWidget {
  int userId;
  OrderPage({super.key, required this.userId});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _selectedIndex = 3; // Track the selected index
  int _Index = 0;
  List<AdminDrawGetResponse> draws = [];
  List<String> oorder= [];
  late Future<void> loadData;
  int money = 0; 
  List<String> winningOrders = [];

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();

    // Log the userId to see its value
    log('OrderPage initialized with userId: ${widget.userId}');
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
        title: const Text(
          'Order',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 39, 24),
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
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: Column(
                  children: [
                    // ใช้เงื่อนไขเพื่อแสดงเนื้อหาตามตัวแปร _Index
                    if (_Index == 0) ...[
                      SizedBox(
                        width: 390,
                        height: 240,
                        child: Card(
                          color: Color.fromRGBO(213, 96, 97, 1),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Card(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 70),
                                    child: Text(
                                      draws[4].winningNumber,
                                      style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 2",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 70,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[3].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 3",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 50,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[2].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 4",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 25,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[1].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 10,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[0].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่ม
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                             onPressed: Order, //() {
                            //   setState(() {
                            //     _Index = 0; // เปลี่ยนเป็นมุมมองที่ต้องการ
                            //   });
                            // },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "คำสั่งซื้อ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // เปลี่ยนสีปุ่มตามเงื่อนไข
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              backgroundColor: _Index == 0
                                  ? Color.fromRGBO(
                                      202, 72, 74, 1) // สีเมื่อถูกเลือก
                                  : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _Index = 1; // เปลี่ยนเป็นมุมมองที่ต้องการ
                              });
                            },

                            // ignore: sort_child_properties_last
                            child: const Text(
                              "ผลรางวัล",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // เปลี่ยนสีปุ่มตามเงื่อนไข
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              backgroundColor: _Index == 1
                                  ? Color.fromRGBO(
                                      202, 72, 74, 1) // สีเมื่อถูกเลือก
                                  : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

    Padding(
  padding: const EdgeInsets.all(5.0),
  child: Row(
    children: [
      Expanded(
        child: Column(
          children: oorder
              .map((lottoNumber) => SizedBox(
                    height: 170,
                    child: Card(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/flying-money.png',
                                            width: 30,
                                          ),
                                          const Text(
                                            'สลากกินแบ่ง Je’ Mild ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 30.0),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/logoMild.jpeg',
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 160,
                                            height: 50,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15.0),
                                              child: Card(
                                                color: const Color.fromRGBO(254, 248, 195, 1.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    lottoNumber, // Use number['lottoNumber'] here
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Row(
                                              children: [
                                                const Column(
                                                  children: [
                                                    Text(
                                                      '120',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'บาท',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5.0),
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/images/signature.png',
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                          const Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 50,
                              height: 170,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15), // ขอบมุมขวาบน
                                    bottomRight: Radius.circular(15), // ขอบมุมขวาล่าง
                                  ),
                                ),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'เจ๊มายพารวย',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(), // Convert Iterable to List
        ),
      ),
    ],
  ),
),
                    ] else if (_Index == 1) ...[
                       SizedBox(
                        width: 390,
                        height: 240,
                        child: Card(
                          color: Color.fromRGBO(213, 96, 97, 1),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Card(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 70),
                                    child: Text(
                                      draws[4].winningNumber,
                                      style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 2",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 70,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[3].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 3",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 50,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[2].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 4",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 25,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[1].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 185,
                            height: 118,
                            child: Card(
                              color: Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "รางวัลที่ 5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "รางวัลละ 10,000 บาท",
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
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          draws[0].winningNumber,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่ม
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         ElevatedButton(
                          onPressed: () async {
                            await Order; // Call the Order function
                            setState(() {
                              _Index = 0; // Update the state to navigate or change the view
                            });
                          },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "คำสั่งซื้อ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // เปลี่ยนสีปุ่มตามเงื่อนไข
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              backgroundColor: _Index == 0
                                  ? Color.fromRGBO(
                                      202, 72, 74, 1) // สีเมื่อถูกเลือก
                                  : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed:() async {
                            await drawmoney(); 
                            setState(() {
                              _Index = 1;
                            });
                          },

                            // ignore: sort_child_properties_last
                            child: const Text(
                              "ผลรางวัล",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // เปลี่ยนสีปุ่มตามเงื่อนไข
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              backgroundColor: _Index == 1
                                  ? Color.fromRGBO(
                                      202, 72, 74, 1) // สีเมื่อถูกเลือก
                                  : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 198,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: -5.0,
                                      left: -5.0,
                                      right: -5.0,
                                      bottom: -27.0,
                                      child: Card(
                                        color: const Color.fromRGBO(
                                            254, 248, 195, 1.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 45,
                                                left: 5,
                                                child: const Text(
                                                  'คุณถูกรางวัล 1 ใบ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 30,
                                                left: 5,
                                                child: const Text(
                                                  'รับเงินรางวัล  บาท',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 18.5,
                                                right: 10,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        200),
                                                          ),
                                                          child: Container(
                                                            width: 800,
                                                            height: 200,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    63,
                                                                    60,
                                                                    61),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                const SizedBox(
                                                                    height: 20,
                                                                    width: 70),
                                                                const Text(
                                                                  'คุณต้องการขึ้นเงินรางวัลใช่หรือไม่',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                const SizedBox(
                                                                    height: 30),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        backgroundColor: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            98,
                                                                            96,
                                                                            95),
                                                                        foregroundColor:
                                                                            Colors.white,
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                28),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          const Text(
                                                                        'ไม่',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18),
                                                                      ),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        //ข้อความเมื่อกดคำว่าใช่
                                                                        // ScaffoldMessenger.of(
                                                                        //         context)
                                                                        // //     .showSnackBar(
                                                                        //   SnackBar(
                                                                        //       content:
                                                                        //           Text('การขึ้นเงินรางวัลเสร็จสิ้น')),
                                                                        // );
                                                                      },
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        backgroundColor: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            98,
                                                                            96,
                                                                            95),
                                                                        foregroundColor:
                                                                            Colors.white,
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                28),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          const Text(
                                                                        'ใช่',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    222,
                                                                    219,
                                                                    34)),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'ขึ้นเงินรางวัล',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 18, 17, 17),
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      top: -10,
                                      left: -10,
                                      right: -10,
                                      bottom: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Stack(
                                          children: [
                                            Card(
                                              color: const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/flying-money.png',
                                                                    width: 30,
                                                                  ),
                                                                  const Text(
                                                                    'สลากกินแบ่ง Je’ Mild ',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            30.0),
                                                                    child:
                                                                        ClipOval(
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/logoMild.jpeg',
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            60,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 160,
                                                                    height: 50,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15.0),
                                                                      child:
                                                                          Card(
                                                                        color: const Color
                                                                            .fromRGBO(
                                                                            254,
                                                                            248,
                                                                            195,
                                                                            1.0),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                           "",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 19,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        const Column(
                                                                          children: [
                                                                            Text(
                                                                              '120',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'บาท',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                5),
                                                                        Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5.0),
                                                                              child: ClipOval(
                                                                                child: Image.asset(
                                                                                  'assets/images/signature.png',
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
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
                                                  Align(
                                                    alignment: Alignment
                                                        .topRight, // ปรับตำแหน่งให้ติดด้านบน
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 170,
                                                      child: Card(
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    15), // ขอบมุมขวาบน
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15), // ขอบมุมขวาล่าง
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: RotatedBox(
                                                            quarterTurns: 3,
                                                            child: Text(
                                                              'เจ๊มายพารวย',
                                                              style: TextStyle(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    222,
                                                                    3,
                                                                    3),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 10),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void Logout() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Logopage(),
        ));
  }
Future<List<Map<String, dynamic>>> drawmoney() async {
  await loadDataAsync();
  await Order();

  List<String> purchasedLottoNumbers = oorder; 
  List<Map<String, dynamic>> results = [];
  
  for (var draw in draws) {
    if (purchasedLottoNumbers.contains(draw.winningNumber)) {
      int money = 0;
      switch (draw.prizeType) {
        case 1:
          money = 100000;
          break;
        case 2:
          money = 70000;
          break;
        case 3:
          money = 50000;
          break;
        case 4:
          money = 25000;
          break;
        case 5:
          money = 10000;
          break;
        default:
          money = 0;
          break;
      }
      results.add({
        'winningNumber': draw.winningNumber,
        'prizeType': draw.prizeType,
        'money': money,
      });
      print('Winning number: ${draw.winningNumber}, Prize Type: ${draw.prizeType}, Money set to: $money');
    }
  }
  return results;
}

Future<void> Order() async {
  try {
    final response = await http.get(Uri.parse("http://172.20.10.6:3000/order/PurchasedLotto/${widget.userId}"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      log('Received data: $data'); 
      log(widget.userId.toString());

      setState(() {
        oorder = data.map((item) => item['lottoNumber'] as String).toList();
      });

    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    var response = await http.get(Uri.parse('$url/admin/drawsNow'));

    draws = adminDrawGetResponseFromJson(response.body);
  }
}
