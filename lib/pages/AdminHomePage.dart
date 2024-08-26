import 'package:flutter/material.dart';
import 'package:mini_project/pages/AdminLottoDraw.dart';
import 'package:mini_project/pages/LogoPage.dart';

class Adiminhomepage extends StatefulWidget {
  int userId;
  Adiminhomepage({super.key, required this.userId});

  @override
  State<Adiminhomepage> createState() => _AdiminhomepageState();
}

class _AdiminhomepageState extends State<Adiminhomepage> {
  @override
  Widget build(BuildContext context) {
    // คำนวณความสูงของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Je’ Mild',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
                  height: screenHeight * 0.13, // ปรับความสูงของรูปภาพที่ต้องการ
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
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            // รางวัลที่ 1
                            Text(
                              "1 สิงหาคม 2567",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "รางวัลที่ 1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
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
                                  vertical: 8,
                                  horizontal: 78,
                                ),
                                child: Text(
                                  "407041",
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // เว้นระยะห่าง
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "596170",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
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
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "903093",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "903093",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
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
                                        color: Color.fromRGBO(75, 9, 9, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "040499",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
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
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            FilledButton(
                              onPressed: LottoDarw,
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(177, 36, 24, 1),
                                fixedSize: const Size(180, 110),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              onPressed: reset,
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(108, 108, 108, 1),
                                fixedSize: const Size(180, 110),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  void LottoDarw() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Adminlottodraw(),
      ),
    );
  }
  void reset() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Logopage(),
      ),
    );
  }
}
