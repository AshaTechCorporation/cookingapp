import 'package:cookingapp/account/Addnewaddresspage.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'ที่อยู่ของฉัน',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.05,
              width: double.infinity,
              color: background,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    'ที่อยู่',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: headingtext),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.179,
              width: double.infinity,
              color: white,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            'ค่าเริ่มต้น',
                            style: TextStyle(
                                color: Color(0xff4077c2),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Row(
                      children: [
                        Text(
                          'Girati Sukapat',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          '097 123 4567',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.075,
                          width: size.width * 0.6,
                          child: Text(
                              '111/222 หมู่บ้าน กขค ถนน กขคม แขวง กขคม แขวง กขค, กรุงเทพมหานคครม 10222',style: TextStyle(
                                color: headingtext
                              ),),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 9, bottom: 25),
                              child: InkWell(
                                onTap: () {
                                  print('object');
                                },
                                child: Text(
                                  'แก้ไข',
                                  style: TextStyle(
                                    color: red1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: arrowcolor,
              height: size.height *0.001,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Addnewaddresspage()));
              },
              child: Container(
                height: size.height * 0.04,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'เพิ่มที่อยู่ใหม่',
                      style:
                          TextStyle(color: red1, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
