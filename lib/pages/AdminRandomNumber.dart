import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mini_project/config/internal_config.dart';
import 'package:mini_project/models/request/admin_draws_post_req.dart';
import 'package:mini_project/pages/AdminHomePage.dart';

class Adminrandomnumber extends StatefulWidget {
  int userId;
  final dynamic dataRandom;
  Adminrandomnumber(
      {super.key, required this.dataRandom, required this.userId});

  @override
  State<Adminrandomnumber> createState() => _AdminrandomnumberState();
}

class _AdminrandomnumberState extends State<Adminrandomnumber> {
  @override
  Widget build(BuildContext context) {
    log('${widget.dataRandom}');
    final List<String> winningNumbers = List<String>.from(
        widget.dataRandom['winningNumbers'].map((number) => number.toString()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text(
          'Random All Number',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                  const Text(
                    'สุ่มเลขที่ขายออก',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Space between sections
            SizedBox(
              width: double.infinity,
              height: 185,
              child: Card(
                color: const Color.fromRGBO(213, 96, 97, 1),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "รางวัลที่ 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Card(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                          child: Text(
                            winningNumbers[0],
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
            const SizedBox(
                height: 15), // Space between button and scrollable content
            SizedBox(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 100,
                            child: Card(
                              color: const Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
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
                                    SizedBox(height: 8),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          winningNumbers[1],
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
                            height: 100,
                            child: Card(
                              color: const Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
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
                                    SizedBox(height: 8),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          winningNumbers[2],
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
                      const SizedBox(height: 20), // Space between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 185,
                            height: 100,
                            child: Card(
                              color: const Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
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
                                    SizedBox(height: 8),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          winningNumbers[3],
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
                            height: 100,
                            child: Card(
                              color: const Color.fromRGBO(213, 96, 97, 1),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
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
                                    SizedBox(height: 8),
                                    Card(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          winningNumbers[4],
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
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between rows
            SizedBox(
              width: 350,
              height: 50,
              child: OutlinedButton(
                onPressed: inputnumber,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(108, 108, 108, 1),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'ยืนยันผลการออกรางวัล',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void inputnumber() async {
    // กำหนดหมายเลขที่ต้องการส่ง
    List<String> winningNumbers = List<String>.from(
        widget.dataRandom['winningNumbers'].map((number) => number.toString()));

    try {
      // สร้าง request body
      var data = AdminDrawsPostRequest(winningNumbers: winningNumbers);

      // ส่ง POST request ไปยัง API
      var response = await http.post(
        Uri.parse("$API_ENDPOINT/admin/lottoWin"),
        headers: {"Content-Type": "application/json"},
        body: adminDrawsPostRequestToJson(data),
      );

      // ตรวจสอบสถานะการตอบกลับ
      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        log("Inserted successfully:");
        log("Affected rows: ${responseData['affected_rows_AdminDraws']}");
        log("Last insert ID: ${responseData['last_idx_AdminDraws']}");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'บันทึกสำเร็จ',
              ),
              content: Text('ข้อมูลถูกบันทึกเรียบร้อยแล้ว'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Adiminhomepage(userId: widget.userId),
                        ));
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            );
          },
        );
      } else {
        String errorMessage;
        if (response.statusCode == 409) {
          errorMessage = "ข้อมูลซ้ำ: กรุณาลองอีกครั้ง";
        } else if (response.statusCode == 400) {
          errorMessage = 'ข้อมูลไม่ถูกต้อง: กรุณาลองอีกครั้ง';
        } else {
          errorMessage = 'เกิดข้อผิดพลาด: กรุณาลองอีกครั้ง';
        }
        log("Insert Error ${response.statusCode}: $errorMessage");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('บันทึกไม่สำเร็จ'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิด dialog
                  },
                  child: const Text('ตกลง'),
                )
              ],
            );
          },
        );
      }
    } catch (e) {
      log("Insert Error $e");
      // แสดงป๊อปอัพเมื่อเกิดข้อผิดพลาดจาก catch
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('บันทึกไม่สำเร็จ'),
            content: Text('เกิดข้อผิดพลาด: กรุณาลองอีกครั้ง'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด dialog
                },
                child: const Text('ตกลง'),
              )
            ],
          );
        },
      );
    }
  }
}
