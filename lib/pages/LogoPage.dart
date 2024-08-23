import 'package:flutter/material.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/register.dart';

class Logopage extends StatefulWidget {
  const Logopage({super.key});

  @override
  State<Logopage> createState() => _LogopageState();
}

class _LogopageState extends State<Logopage> {
  @override
  Widget build(BuildContext context) {
    // คำนวณความสูงของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * 0.7, // สีแดงครอบ 70% ของหน้าจอ
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(177, 36, 24, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
              Positioned(
                bottom: 50, // ตำแหน่งของรูปภาพอยู่ที่ด้านล่างสุดของ Container
                left: 0,
                right: 2,
                child: Container(
                  height: screenHeight * 0.2, // ปรับความสูงของรูปภาพที่ต้องการ
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
              child: Padding(
                padding: const EdgeInsets.all(20.0), // เพิ่มระยะห่างทั้งหมด
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // จัดแนวปุ่มจากด้านบน
                  children: [
                    SizedBox(
                        height: 30), // ระยะห่างระหว่างด้านบนของหน้าจอกับปุ่มแรก
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        onPressed: () => login(),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 211, 39, 24),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // ระยะห่างระหว่างปุ่ม
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () => register(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(177, 36, 24, 1),
                          backgroundColor: Color.fromARGB(0, 206, 199, 198),
                          side: BorderSide(
                            color: Color.fromRGBO(177, 36, 24, 1),
                            width: 2.0,
                          ),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'สมัครสมาชิก',
                          style: TextStyle(fontSize: 20.0),
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
    );
  }

  login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Loginpage(),
      ),
    );
  }

  register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }
}
