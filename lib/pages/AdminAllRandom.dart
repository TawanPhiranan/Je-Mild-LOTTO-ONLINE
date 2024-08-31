import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Adminallrandom extends StatefulWidget {
  final dynamic dataRandom;
  Adminallrandom({super.key, required this.dataRandom});

  @override
  State<Adminallrandom> createState() => _AdminallrandomState();
}

class _AdminallrandomState extends State<Adminallrandom> {
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
      body: ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: winningNumbers.length,
          itemBuilder: (context, index) {
            return Padding(
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
                        const SizedBox(
                            height: 10), // Space between text and line
                        Container(
                          height: 2,
                          color: const Color.fromRGBO(177, 36, 24, 1),
                          width: double.infinity,
                        ),
                        const Text(
                          'สุ่มเลขทั้งหมด',
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 70),
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
                      height:
                          15), // Space between button and scrollable content
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
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
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
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
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
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
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
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
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
                      onPressed: () {},
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
            );
          }),
    );
  }
}
