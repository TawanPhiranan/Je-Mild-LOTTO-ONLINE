import 'package:flutter/material.dart';
import 'package:mini_project/pages/AdminProfile.dart';

class Admineditpassword extends StatefulWidget {
  const Admineditpassword({super.key});

  @override
  State<Admineditpassword> createState() => _AdmineditpasswordState();
}

class _AdmineditpasswordState extends State<Admineditpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Edit Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the entire body
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Add space above the header text
              Text(
                'จัดการรหัสผ่าน',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(177, 36, 24, 1),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(177, 36, 24, 1),
                ),
              ),
              const SizedBox(height: 20), // Additional space after the header
              const Text('รหัสผ่านเดิม'),
              const SizedBox(height: 8.0),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Text('รหัสผ่านใหม่'),
              const SizedBox(height: 8.0),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Text('ยืนยันรหัสผ่าน'),
              const SizedBox(height: 8.0),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ลืมรหัสผ่าน?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Center(
                  child: FilledButton(
                    onPressed: _changePassword,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(213, 96, 97, 1),
                    ),
                    child: const Text('บันทึก'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Adminprofile(),
      ),
    );
  }
}
