import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';

class Walletpage extends StatefulWidget {
  int userId;
  Walletpage({super.key, required this.userId});

  @override
  State<Walletpage> createState() => _WalletpageState();
  
}

class _WalletpageState extends State<Walletpage> {
  int _selectedIndex = 1; // Track the selected index

  @override
  void initState() {
    super.initState();
    // Log the userId to see its value
    log('Walletpage initialized with userId: ${widget.userId}');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to different pages based on the selected index
     switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(userId: widget.userId )));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => Walletpage(userId: widget.userId )));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => LottoPage(userId: widget.userId,)));
      break;
    case 3:
      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(userId: widget.userId,)));
      break;
    case 4:
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId,)));
      break;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Wallet',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: SingleChildScrollView(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(213, 96, 97, 1),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            'เติมเงิน',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(213, 96, 97, 1),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text('ถอนเงิน',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text('ประวัติการทำรายการ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(177, 36, 24, 1))),
                ],
              ),
              const SizedBox(height: 8),
              Column(children: [
                SizedBox(
                    width: double.infinity, // ทำให้การ์ดกว้างเต็มจอ
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(10), // มุมโค้งของสี่เหลี่ยม
                        border: Border.all(
                          color: const Color.fromRGBO(
                              177, 36, 24, 1), // สีของเส้นขอบ
                          width: 2, // ความหนาของเส้นขอบ
                        ),
                      ),
                      child: const Padding(
                          padding:
                              EdgeInsets.all(16.0), // กำหนด padding ภายในกล่อง
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align content to the start
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .end, // Align date to the right
                                children: [
                                  Text(
                                    '7 กรกฎาคม 2567',
                                    style: TextStyle(
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'เงินเข้า',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '+ 100',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 255, 26),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey, // Color of the divider
                                thickness: 1.0, // Thickness of the divider
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .end, // Align date to the right
                                children: [
                                  Text(
                                    '3 กรกฎาคม 2567',
                                    style: TextStyle(
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'เงินออก',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '- 100',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey, // Color of the divider
                                thickness: 1.0, // Thickness of the divider
                              ),
                              SizedBox(height: 8),
                            ],
                          )),
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
