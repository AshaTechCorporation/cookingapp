import 'package:cookingapp/account/Addresspage.dart';
import 'package:cookingapp/account/Userinfo.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:flutter/material.dart';

class Accsetting extends StatefulWidget {
  const Accsetting({super.key, required this.title});

  final String title;

  @override
  State<Accsetting> createState() => _AccsettingState();
}

class _AccsettingState extends State<Accsetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'ตั้งค่า',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
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
        color: background, // เปลี่ยนสีพื้นหลังของ body
        child: Column(
          children: [
            Container(
              color: background,
              height: size.height * 0.06,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 17),
                child: Text(
                  'ตั้งค่าบัญชีผู้ใช้',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: headingtext),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.001),
            Container(
              color: white,
              height: size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Userinfo()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ข้อมูลเกี่ยวกับบัญชี',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      Spacer(),
                      Image.asset('assets/icons/rightarrow.png')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            Container(
              height: size.height * 0.05,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addresspage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ที่อยู่ของฉัน',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      Spacer(),
                      Image.asset('assets/icons/rightarrow.png')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            Container(
              color: background,
              height: size.height * 0.055,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 17),
                child: Text(
                  'ช่วยเหลือ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: headingtext),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.001),
            Container(
              height: size.height * 0.05,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text(
                      'ข้อตกลงและเงื่อไขการให้บริการ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                    Spacer(),
                    Image.asset('assets/icons/rightarrow.png')
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            Container(
              height: size.height * 0.05,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text(
                      'เวอร์ชัน',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                    Spacer(),
                    Image.asset('assets/icons/rightarrow.png')
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            Container(
              height: size.height * 0.05,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'เกี่ยวกับเรา',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      Spacer(),
                      Image.asset('assets/icons/rightarrow.png')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            Container(
              height: size.height * 0.05,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text(
                      'คำร้องขอลบบัญชีผู้ใช้',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                    Spacer(),
                    Image.asset('assets/icons/rightarrow.png'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: size.height * 0.001,
            ),
            SizedBox(
              height: size.height * 0.32,
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: red1, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ยืนยันการออกจากระบบ'),
                              content: Text('คุณต้องการออกจากระบบใช่ไหม?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                        (route) => false);
                                  },
                                  child: Text('ตกลง'),
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      'ออกจากระบบ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
