import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_project/config/config.dart';
import 'package:mini_project/models/response/showMoney_get_res.dart';
import 'package:mini_project/models/response/wallet_get%20_res.dart';
import 'package:mini_project/models/request/user_add_wthdraw_post_req.dart';
import 'package:mini_project/pages/LoginPage.dart';
import 'package:mini_project/pages/LogoPage.dart';
import 'package:mini_project/pages/LottoPage.dart';
import 'package:mini_project/pages/OrderPage.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/walletPage.dart';
import 'package:mini_project/pages/HomePage.dart';
import 'package:http/http.dart' as http;

class Walletpage extends StatefulWidget {
  int userId;
  Walletpage({super.key, required this.userId});

  @override
  State<Walletpage> createState() => _WalletpageState();
  
  String displayAmount(double amount) {
    if (amount > 0) {
      return '+ ${amount.toString()}'; // เงินเข้า
    } else if (amount < 0) {
      return '${amount.toString()}'; // เงินออก (แสดงค่าลบ)
    } else {
      return '0'; // ถ้าเป็นศูนย์
    }
  }

  String checkTransactionStatus(double amount) {
    if (amount >= 0) {
      return 'เงินเข้า'; // สถานะเงินเข้า
    } else {
      return 'เงินออก'; // สถานะเงินออก
    }
  }

}

class _WalletpageState extends State<Walletpage> {
  int _selectedIndex = 1; // Track the selected index
  late Future<void> loadData;
  List<ShowMoneyGetResponse> showMoney = [];
  List<WalletGetResponse> showTransaction = [];

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
    log('Walletpage initialized with userId: ${widget.userId}');
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(177, 36, 24, 1),
        title: const Text('Wallet',
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
      body: Center(
        child: FutureBuilder(
            future: loadData,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20), // เพิ่มระยะห่าง
                      Text('Loading...'), // ข้อความเพิ่มเติม
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 390,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(213, 96, 97, 1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              //เเสงเเละเงา
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ยอดเงินคงเหลือ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                    Icon(
                                      Icons.wallet_rounded,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.monetization_on_rounded,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                    Text(
                                      showMoney[0].total.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "บาท",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      showMoney[0].username,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: FilledButton(
                                  onPressed: () {
                                    showWithAdd(context);
                                  },
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(213, 96, 97, 1),
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  child: const Text(
                                    'เติมเงิน',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                  onPressed: () {
                                    showWithdrawDialog(context);
                                  },
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(213, 96, 97, 1),
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  child: const Text('ถอนเงิน',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
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
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(177, 36, 24, 1),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                  // เปลี่ยนจาก Expanded เป็น Container
                                  height: 400, // กำหนดความสูงให้กับ Container
                                  child: ListView.builder(
                                    itemCount: showTransaction.length,
                                    itemBuilder: (context, index) {
                                      final transaction =
                                          showTransaction[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                transaction.transactionDate,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      84, 84, 84, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                transaction.amount >= 0
                                                    ? 'เงินเข้า'
                                                    : 'เงินออก',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(56, 56, 56, 1),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${transaction.amount > 0 ? '+' : '-'}${transaction.amount.abs()}', // Use abs() for the display
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: transaction.amount > 0
                                                      ? Color.fromARGB(
                                                          255, 0, 255, 26)
                                                      : Color.fromARGB(
                                                          255,
                                                          255,
                                                          0,
                                                          0), // Green for income, red for expense
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                            thickness: 1.0,
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  //ใส่เงินที่ต้องการเติม
  void showWithAdd(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'เติมเงิน (ขั้นต่ำ 500 บ.)',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 136, 29),
                fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'ระบุจำนวนเงินที่จะเติม',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ยกเลิก',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:
                  Text('ตกลง', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () async {
                int? amount = int.tryParse(amountController.text);
                if (amount != null && amount > 0) {
                  try {
                    await AddMoney(amount);
                    Navigator.of(context).pop();

                    showConfirmationDialog(context, "เติมเงินสำเร็จ :)");
                  } catch (err) {
                    showErrorDialog(context, err.toString());
                  }
                } else {
                  showErrorDialog(context, "Invalid amount");
                }
              },
            ),
          ],
        );
      },
    );
  }

  //เติมเงิน
  Future<void> AddMoney(int amount) async {
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];

    var data = UserAddWithdrawPostRequest(amount: amount).toJson();
    print('Sending data: ${jsonEncode(data)}');

    try {
      var response = await http.post(
        Uri.parse('$url/wallet/add/${widget.userId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        log("ID: ${widget.userId} เติมเงินสำเร็จนะ");
      } else if (response.statusCode == 403) {
        throw Exception("ยอดเงินไม่ถึงขั้นต่ำที่กำหนด : กรุณาลองอีกครั้ง");
      } else {
        throw Exception("Error inserting into Wallet: ${response.body}");
      }
    } catch (err) {
      throw Exception("$err");
    }
  }

  //ใส่เงินที่จะถอน
  void showWithdrawDialog(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ถอนเงิน',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 17, 0),
                fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'ระบุจำนวนเงินที่จะถอน',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ยกเลิก',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:
                  Text('ตกลง', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () async {
                int? amount = int.tryParse(amountController.text);
                if (amount != null && amount > 0) {
                  await WithdrawMoney(amount);
                  Navigator.of(context).pop();

                  showConfirmationDialog(context, "ถอนเงินสำเร็จ :)");
                } else {
                  showErrorDialog(context, "จำนวนเงินไม่ถูกต้อง!!");
                }
              },
            ),
          ],
        );
      },
    );
  }

//ถอนเงิน
  Future<void> WithdrawMoney(int amount) async {
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];

    var data = UserAddWithdrawPostRequest(amount: amount).toJson();
    print('Sending data: ${jsonEncode(data)}');

    try {
      var response = await http.post(
        Uri.parse('$url/wallet/withdraw/${widget.userId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        log("ID: ${widget.userId} ถอนเงินสำเร็จนะ");
      } else if (response.statusCode == 400) {
        // แสดงข้อผิดพลาดถ้าเงินไม่พอถอน
        throw Exception("ขออภัยจำนวนเงินของคุณไม่เพียงพอที่จะถอน T_T");
      } else {
        throw Exception("Error inserting into Wallet: ${response.body}");
      }
    } catch (err) {
      // ขว้างข้อผิดพลาดไปให้ `showWithdrawDialog` จัดการ
      throw Exception("$err");
    }
  }

  void showConfirmationDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ทำรายการสำเร็จ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 160, 16))),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child:
                  Text('ตกลง', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  loadData = loadDataAsync();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error!!',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child:
                  Text('ตกลง', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  loadData = loadDataAsync();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void Logout() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Logopage(),
        ));
  }

  Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];
    var showMoneyResponse =
        await http.get(Uri.parse('$url/wallet/total/${widget.userId}'));
    var showTransactionResponse = await http
        .get(Uri.parse('$url/wallet/transaction?userID=${widget.userId}'));

    showMoney = showMoneyGetResponseFromJson(showMoneyResponse.body);
    showTransaction = walletGetResponseFromJson(showTransactionResponse.body);
    print('${showTransactionResponse.body}');
  }
}