import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ตั้งค่าบัญชี',
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
        body: Container(
          color: background,
          child: Column(
            children: [
              Container(
                color: background,
                height: size.height * 0.06,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 25),
                  child: Text(
                    'ข้อมูลทางติดต่อ',
                    style: TextStyle(color: greyuserinfo,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.048,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Text(
                        'ชื่อผู้ใช้',
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Text(
                        'xxxx xxxxx',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.001,
                color: arrowcolor,
              ),
              Container(
                height: size.height * 0.048,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Text(
                        'หมายเลขโทรศัพท์',
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Text(
                        '******778',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.001,
                color: arrowcolor,
              ),
              Container(
                height: size.height * 0.048,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Text(
                        'อีเมล',
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Text(
                        'g******@gmail.com',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.001,
                color: arrowcolor,
              ),
              Container(
                height: size.height * 0.048,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Text(
                        'เปลี่ยนรหัสผ่าน',
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Text(
                        '************',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.001,
                color: arrowcolor,
              ),
              SizedBox(
                height: size.height * 0.089,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('แก้ไขข้อมูล'),
                          content: Text('คุณต้องการแก้ไขข้อมูลส่วนตัวใช่ไหม?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('ยกเลิก'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('เสร็จเรียบร้อย'),
                                      content: Text(
                                          'การแก้ไขข้อมูลเสร็จเรียบร้อยแล้ว'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('ตกลง'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('ตกลง'),
                            )
                          ],
                        );
                      });
                },
                child: Container(
                  width: size.width * 0.94,
                  height: size.height * 0.055,
                  decoration: BoxDecoration(
                      color: arrowcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'ยืนยัน',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
