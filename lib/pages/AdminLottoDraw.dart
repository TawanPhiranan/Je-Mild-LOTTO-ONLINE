import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/pages/AdminAllRandom.dart';
import 'package:mini_project/pages/AdminRandomNumber.dart';
import 'package:http/http.dart' as http;

class Adminlottodraw extends StatefulWidget {
  const Adminlottodraw({super.key});

  @override
  State<Adminlottodraw> createState() => _AdminlottodrawState();
}

class _AdminlottodrawState extends State<Adminlottodraw> {
  late Future<void> loadData;
  // late Future<void> sendRandomType;

  @override
  void initState() {
    super.initState();
    // loadData = loadDataAsync();
    // loadData = sendRandomType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Lotto Draw',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ออกรางวัล',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(177, 36, 24, 1),
                    ),
                  ),
                  const SizedBox(height: 10), // Space between text and line
                  Container(
                    height: 2,
                    color: const Color.fromRGBO(177, 36, 24, 1),
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            // Spacer to push the buttons to the bottom
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 70,
                      child: TextButton(
                        onPressed: AllRandom,
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(213, 96, 97, 1),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'สุ่มเลขทั้งหมด',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // Space between buttons
                    SizedBox(
                      width: 350,
                      height: 70,
                      child: OutlinedButton(
                        onPressed: RandomNumber,
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(108, 108, 108, 1),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'สุ่มเลขที่ขายออก',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
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
    );
  }

  Future<Map<String, dynamic>> sendRandomType(String type) async {
    try {
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];
      var response = await http.get(Uri.parse('$url/admin/random?type=$type'));

      if (response.statusCode == 200) {
        // ถ้าการเรียก API สำเร็จ
        final dataRandom = json.decode(response.body);
        print(dataRandom);
        return dataRandom; // ส่งกลับข้อมูลที่ได้รับ
      } else {
        // ถ้า API ส่งสถานะที่ไม่ใช่ 200
        log('Error: ${response.statusCode}');
        return {}; // ส่งกลับข้อมูลว่างเมื่อเกิดข้อผิดพลาด
      }
    } catch (e) {
      // จัดการข้อผิดพลาดเมื่อเกิดปัญหาในการเรียก API
      log('Error: $e');
      return {}; // ส่งกลับข้อมูลว่างเมื่อเกิดข้อผิดพลาด
    }
  }

  Future<void> AllRandom() async {
    const type = '1';
    final dataRandom =
        await sendRandomType(type); // รอให้ส่งข้อมูลเสร็จและเก็บผลลัพธ์

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Adminallrandom(dataRandom: dataRandom), // ใช้ dataRandom ที่ได้รับ
      ),
    );
  }

  Future<void> RandomNumber() async {
  const type = '2';
  try {
    final dataRandom = await sendRandomType(type);

    if (dataRandom.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("เลขที่ขายออกทั้งหมด"),
            content: Text("คำสั่งซื้อวันนี้น้อยเกินไป"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("ปิด"),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Adminrandomnumber(dataRandom: dataRandom),
        ),
      );
    }
  } catch (error) {
    // Handle error if sending the request fails
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("เกิดข้อผิดพลาด"),
          content: Text("ไม่สามารถดึงข้อมูลได้: $error"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("ปิด"),
            ),
          ],
        );
      },
    );
  }
}

}
