// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  int idx = 0;
  ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
TextEditingController fullnameCtl =  TextEditingController();
  TextEditingController phoneCtl =  TextEditingController();
  TextEditingController emailCtl =  TextEditingController();
  TextEditingController imageCtl =  TextEditingController();

class _ProfilePageState extends State<ProfilePage> {
late Future<void> loadData;
String url ='';

    @override
    void initState(){
    super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลส่วนตัว'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
  log(value);
  if (value == 'delete') {
	showDialog(
	  context: context,
	  builder: (context) => SimpleDialog(
		children: [
		  const Padding(
			padding: EdgeInsets.all(16.0),
			child: Text(
			  'ยืนยันการยกเลิกสมาชิก?',
			  style: TextStyle(
				  fontSize: 14, fontWeight: FontWeight.bold),
			),
		  ),
		  Row(
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: [
			  TextButton(
				  onPressed: () {
					Navigator.pop(context);
				  },
				  child: const Text('ปิด')),
			  FilledButton(
				  onPressed: () {} , child: const Text('ยืนยัน'))
			],
		  ),
		],
	  ),
	);
  }
},
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('ยกเลิกสมาชิก'),

              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: loadData ,
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(),);
        }
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              // SizedBox(width: 200, child: Image.network(customer.image),),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ชื่อ-นามสกุล'),
                    TextField(
                      controller: fullnameCtl ,
                    )
                  ],
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('หมายเลขโทรศัพท์'),
                    TextField(
                      controller: phoneCtl ,
                    )
                  ],
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('อีเมล'),
                    TextField(
                      controller: emailCtl ,
                    )
                  ],
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('รูปภาพ'),
                    TextField(
                      controller: imageCtl ,
                    )
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Center(
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('บันทึกข้อมูล'),
                      ),
                  ),
               )               
            ],),
          ),
        );
        },),
    );
  }
}
