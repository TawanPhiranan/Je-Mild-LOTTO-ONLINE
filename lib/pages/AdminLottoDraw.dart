import 'package:flutter/material.dart';
import 'package:mini_project/pages/AdminAllRandom.dart';
import 'package:mini_project/pages/AdminRandomNumber.dart';

class Adminlottodraw extends StatefulWidget {
  const Adminlottodraw({super.key});

  @override
  State<Adminlottodraw> createState() => _AdminlottodrawState();
}

class _AdminlottodrawState extends State<Adminlottodraw> {
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

  void AllRandom() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Adminallrandom(),
      ),
    );
  }

  void RandomNumber() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Adminrandomnumber(),
      ),
    );
  }
}
