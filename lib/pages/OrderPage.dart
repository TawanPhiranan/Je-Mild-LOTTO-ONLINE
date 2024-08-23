import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // ตัวแปรเพื่อจัดการมุมมองที่แสดงและสถานะของปุ่ม
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 39, 24),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: Column(
            children: [
              // ใช้เงื่อนไขเพื่อแสดงเนื้อหาตามตัวแปร _selectedIndex
              if (_selectedIndex == 0) ...[
                const SizedBox(
                  width: 390,
                  height: 240,
                  child: Card(
                    color: Color.fromRGBO(213, 96, 97, 1),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "1 สิงหาคม 2567",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "รางวัลที่ 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
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
                                  vertical: 5, horizontal: 70),
                              child: Text(
                                "407041",
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
                const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 185,
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 70,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "848197",
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
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 50,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "903093",
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 185,
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 25,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "504956",
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
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 10,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "505561",
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
                const SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่ม
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; // เปลี่ยนเป็นมุมมองที่ต้องการ
                      });
                    },
                    // ignore: sort_child_properties_last
                    child:const Text(
                            "คำสั่งซื้อ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    // เปลี่ยนสีปุ่มตามเงื่อนไข
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: _selectedIndex == 0
                          ? Color.fromRGBO(202, 72, 74, 1) // สีเมื่อถูกเลือก
                          : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; // เปลี่ยนเป็นมุมมองที่ต้องการ
                      });
                    },
                    
                    // ignore: sort_child_properties_last
                    child: const Text(
                            "ผลรางวัล",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    // เปลี่ยนสีปุ่มตามเงื่อนไข
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: _selectedIndex == 1
                          ?Color.fromRGBO(202, 72, 74, 1) // สีเมื่อถูกเลือก
                          :Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                                padding: const EdgeInsets.only(
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
                                                    color: const Color.fromRGBO(
                                                        254, 248, 195, 1.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        '4  0  7  0  4  1',
                                                        style: TextStyle(
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Row(
                                                  children: [
                                                    const Column(
                                                      children: [
                                                        Text(
                                                          '120',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'บาท',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5.0),
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
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '1 สิงหาคม 2567',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 91, 228, 1),
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
                                const Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 50,
                                  height: 170,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(15), // ขอบมุมขวาบน
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
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(213, 96, 97, 1)),
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
              
              
              ] else if (_selectedIndex == 1) ...[
                // ตัวอย่างสำหรับมุมมองที่ 1
               const SizedBox(
                  width: 390,
                  height: 240,
                  child: Card(
                    color: Color.fromRGBO(213, 96, 97, 1),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "2 สิงหาคม 2567",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "รางวัลที่ 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
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
                                  vertical: 5, horizontal: 70),
                              child: Text(
                                "407041",
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
                const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 185,
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 70,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "848197",
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
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 50,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "903093",
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 185,
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 25,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "504956",
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
                    height: 118,
                    child: Card(
                      color: Color.fromRGBO(213, 96, 97, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Text(
                              "รางวัลละ 10,000 บาท",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 9, 9, 1),
                                fontSize: 14,
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
                                  "505561",
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
              const SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่ม
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; // เปลี่ยนเป็นมุมมองที่ต้องการ
                      });
                    },
                    // ignore: sort_child_properties_last
                    child:const Text(
                            "คำสั่งซื้อ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    // เปลี่ยนสีปุ่มตามเงื่อนไข
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: _selectedIndex == 0
                          ? Color.fromRGBO(202, 72, 74, 1) // สีเมื่อถูกเลือก
                          : Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; // เปลี่ยนเป็นมุมมองที่ต้องการ
                      });
                    },
                    
                    // ignore: sort_child_properties_last
                    child: const Text(
                            "ผลรางวัล",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    // เปลี่ยนสีปุ่มตามเงื่อนไข
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: _selectedIndex == 1
                          ?Color.fromRGBO(202, 72, 74, 1) // สีเมื่อถูกเลือก
                          :Color.fromRGBO(213, 96, 97, 1), // สีปกติ
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                                padding: const EdgeInsets.only(
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
                                                    color: const Color.fromRGBO(
                                                        254, 248, 195, 1.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        '4  0  7  0  4  1',
                                                        style: TextStyle(
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Row(
                                                  children: [
                                                    const Column(
                                                      children: [
                                                        Text(
                                                          '120',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'บาท',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5.0),
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
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '1 สิงหาคม 2567',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 91, 228, 1),
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
                                const Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 50,
                                  height: 170,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(15), // ขอบมุมขวาบน
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
                    
                   
                  ],
                ),
              ),
              
              
              ],
            
              
              const SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    );
  }
}
