// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class LottoPage extends StatefulWidget {
  const LottoPage({super.key});

  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  void _logout() {
    Navigator.pop(context);  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Lotto',
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
                            onPressed: _logout,
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
        child: Column(
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 390,  
                  height: 250, 
                  child: Card(
                    color: const Color.fromRGBO(213, 96, 97, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            '1 สิงหาคม 2567',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'กรอกเลขลอตเตอรี่ที่ต้องการสั่งซื้อ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return SizedBox(
                                width: 50,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(217, 217, 217, 1),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: FilledButton(
                              onPressed: () {},  
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(217, 217, 217, 1)), 
                              ),
                              child: const Text('ค้นหา',
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontSize: 20, 
                                ), 
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'แนะนำ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {},  
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(177, 36, 24, 1)), 
                    ),
                     child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sync, 
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'สุ่ม',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
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
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset('assets/images/flying-money.png', width: 30),
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
                                                  child: const Center(
                                                    child: Text(
                                                      '4  0  7  0  4  1',
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
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'บาท',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 20.0),
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
                                            const Padding(
                                              padding: EdgeInsets.only(left: 5.0),
                                              child: Text(
                                                '1 สิงหาคม 2567',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(0, 91, 228, 1),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
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
                            Align(
                              alignment: Alignment.centerRight, 
                              child: SizedBox(
                                width: 50,
                                height: 170, 
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Center(
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
                    ),
                  ),
                  const SizedBox(width: 10), 
                  SizedBox(
                    height: 65,
                    width: 65,
                    child: FilledButton(
                      onPressed: () {},  
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(213, 96, 97, 1)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_basket, 
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            'สั่งซื้อ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
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
        ),
      ),
    );
  }
}
