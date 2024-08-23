import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/pages/HomePage.dart';

class Walletpage extends StatefulWidget {
  const Walletpage({super.key});

  @override
  State<Walletpage> createState() => _WalletpageState();
  
}

class _WalletpageState extends State<Walletpage> {
  int _selectedIndex = 1; // Track the selected index
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

      switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Walletpage()));
        break;
      // case 2:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => LottoPage()));
      //   break;
      // case 3:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
      //   break;
      // case 4:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
      //   break;
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
              Container(
                width: 390,
                height: 200,
                decoration: BoxDecoration(
                  color:
                      const Color.fromRGBO(213, 96, 97, 1), // Background color
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      spreadRadius: 3, // How much the shadow spreads
                      blurRadius: 7, // How blurry the shadow is
                      offset: const Offset(0, 3), // Shadow offset
                    ),
                  ], // Rounded corners
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
