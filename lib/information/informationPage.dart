import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background2,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: brown,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text('ศูนย์ช่วยเหลือ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: size.height * 0.2,
              color: Color.fromARGB(255, 255, 128, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ให้เราช่วยแก้ปัญหาให้คุณ',
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'ทีมงานของเราพร้อมให้การช่วยเหลืออย่างสุด \nความสามารถ เพื่อให้คุณได้รับการดูแล \nและแก้ไขปัญหาอย่างดีที่สุด',
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.35, child: Image.asset('assets/images/Frame 1099.png'))
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: size.height * 0.17,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 211, 131, 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ระบุปัญหาที่คุณพบ',
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'อธิบายปัญหาอย่างละเอียด',
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: size.width * 0.85,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                              leading: Image.asset(
                                'assets/icons/Frame 1098 (2).png',
                                //width: size.width * 0.04,
                                height: size.height * 0.025,
                                fit: BoxFit.fill,
                                // color: Colors.grey,
                              ),
                              title: Text(
                                'ปัญหาที่คุณรายงาน',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              subtitle: Text(
                                'ดำเนินการตรวจสอบ',
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right,
                                size: 40,
                                color: red1,
                              ),
                              onTap: () async {},
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                              leading: Image.asset(
                                'assets/icons/Frame 1098 (3).png',
                                //width: size.width * 0.04,
                                height: size.height * 0.025,
                                fit: BoxFit.fill,
                                // color: Colors.grey,
                              ),
                              title: Text(
                                'คำถามที่พบบ่อย',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              subtitle: Text(
                                'ปัญหาที่พบบ่อย',
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right,
                                size: 40,
                                color: red1,
                              ),
                              onTap: () async {},
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'ปัญหาที่พบล่าสุด',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.all(4),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          leading: Image.asset(
                            'assets/images/beardolls.jpg',
                            //width: size.width * 0.04,
                            height: size.height * 0.025,
                            fit: BoxFit.fill,
                            // color: Colors.grey,
                          ),
                          title: Text(
                            'ปัญหาที่คุณรายงาน',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          subtitle: Text(
                            'ปัญหาที่พบบ่อย',
                          ),
                          // trailing: Icon(
                          //   Icons.keyboard_arrow_right,
                          //   size: 40,
                          //   color: red1,
                          // ),
                          onTap: () async {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
