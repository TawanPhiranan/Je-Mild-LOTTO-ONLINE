// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/models/request/user_buy_post_req.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:http/http.dart' as http;

class LottoPage extends StatefulWidget {
  int userId;
  LottoPage({super.key, required this.userId});

  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  int _selectedIndex = 2; // Track the selected index
  List<String> _randomNumbers = [];
  late Future<void> loadData;
  String? selectedLottoNumber;
  int failed = 0;

  @override
  void initState() {
    super.initState();
    fetchRandomNumbers();
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
    log('LottoPage initialized with userId: ${widget.userId}');
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
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(217, 217, 217, 1),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: FilledButton(
                              onPressed: Search,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(217, 217, 217, 1)),
                              ),
                              child: const Text(
                                'ค้นหา',
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
            //เเนะนำ Lotto
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
                    onPressed: fetchRandomNumbers,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(177, 36, 24, 1)),
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
            //วนลูปเเสดง 10 รายการ

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _randomNumbers.length,
              itemBuilder: (context, index) {
                final lottoNumber = _randomNumbers[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      //ใบ Lotto
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/images/flying-money.png',
                                                    width: 30),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30.0),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: Card(
                                                      color:
                                                          const Color.fromRGBO(
                                                              254,
                                                              248,
                                                              195,
                                                              1.0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          lottoNumber,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 19,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                Row(
                                                  children: [
                                                    // Column สำหรับแสดงราคาและหน่วยเงิน
                                                    const Column(
                                                      children: [
                                                        const Text(
                                                          '120',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'บาท',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            20), // เปลี่ยนจาก height เป็น width เพื่อให้ระยะห่างในแนวนอน
                                                    // Column สำหรับแสดงรูปภาพ
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20.0),
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
                                          topRight: Radius.circular(
                                              15), // ขอบมุมขวาบน
                                          bottomRight: Radius.circular(
                                              15), // ขอบมุมขวาล่าง
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
                        ),
                      ),
                      //ตะกร้า
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: FilledButton(
                          onPressed: () => selectLottoNumber(lottoNumber),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(213, 96, 97, 1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(32.5), // ทำให้ปุ่มกลม
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void Search() {}

// เมธอดสำหรับเรียก API และสุ่มตัวเลข
  Future<void> fetchRandomNumbers() async {
    try {
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];
      final response = await http.get(Uri.parse('$url/order/random'));
      log(response.body);

      if (response.statusCode == 200) {
        // แปลง JSON เป็น Dart Map
        final Map<String, dynamic> data = jsonDecode(response.body);
        // ดึง List ของ numbers
        final List<dynamic> numbers = data['winningNumbers'];
        setState(() {
          // แปลง List ของ numbers เป็น List ของ String
          _randomNumbers = numbers.map((item) => item.toString()).toList();
        });
      } else {
        setState(() {
          _randomNumbers = ['Error: ${response.statusCode}'];
        });
      }
    } catch (e) {
      setState(() {
        _randomNumbers = ['Error: $e'];
      });
    }
  }

  void selectLottoNumber(String lottoNumber) {
  // เก็บ context ปัจจุบันไว้
  final currentContext = context;

  showDialog(
    context: currentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'ยืนยันการซื้อเลขนี้',
          style: TextStyle(
              color: Color.fromRGBO(0, 115, 85, 1),
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          'คุณต้องการที่จะซื้อ Lotto $lottoNumber ใช่หรือไม่?',
          style: TextStyle(fontSize: 18),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ไม่ใช่', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('ใช่', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.of(context).pop();
              setState(() {
                selectedLottoNumber = lottoNumber;
                log('Selected lotto number: $lottoNumber');
              });

              int result = await BuyLotto();

              if (currentContext.mounted) {
                if (result == 201) {
                  showDialog(
                    context: currentContext,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('การซื้อสำเร็จ'),
                        content: Text(
                            'คุณได้ทำการซื้อเลข $lottoNumber เรียบร้อยแล้ว'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('ตกลง'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (result == 400) {
                  showDialog(
                    context: currentContext,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('การไม่ซื้อสำเร็จ'),
                        content: Text(
                            'คุณได้ทำการซื้อเลข $lottoNumber ไปแล้ว ไม่สามารถซื้อซ้ำได้อีก T_T'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('ตกลง'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (result == 300) {
                  showDialog(
                    context: currentContext,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('การไม่ซื้อสำเร็จ'),
                        content: Text('ยอดเงินของคุณไม่พอ'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('ตกลง'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // คุณสามารถจัดการกรณีอื่น ๆ ที่นี่
                }
              }
            },
          ),
        ],
      );
    },
  );
}


// เมธอดสำหรับซื้อ Lotto
  BuyLotto() async {
    try {
      if (selectedLottoNumber == null || selectedLottoNumber!.isEmpty) {
        print('No lotto number selected');
        return;
      }

      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];

      var data = UserBuyPostRequest(lottoNumber: selectedLottoNumber!).toJson();
      print('Sending data: ${jsonEncode(data)}'); // ตรวจสอบข้อมูลที่ส่ง

      final response = await http.post(
        Uri.parse('$url/order/lottoBuy/${widget.userId}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      print(
          'Response status: ${response.statusCode}'); // ตรวจสอบสถานะการตอบกลับ
      print('Response body: ${response.body}'); // ตรวจสอบเนื้อหาการตอบกลับ

      if (response.statusCode == 201) {
        print('Lotto purchased successfully');
        return response.statusCode; // การซื้อสำเร็จ
      } else if (response.statusCode == 400) {
        return response.statusCode; // ซื้อล็อตโต้ซ้ำ
      } else if (response.statusCode == 300) {
        return response.statusCode; // เงินไม่พอ
      } else {
        return response.statusCode; // กรณีอื่น ๆ
      }
    } catch (e) {
      print('Error: $e');
      failed = 3; // เกิดข้อผิดพลาด
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
