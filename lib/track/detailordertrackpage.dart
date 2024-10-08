import 'package:cookingapp/constants.dart';
import 'package:cookingapp/widgets/paymentwidget.dart';
import 'package:cookingapp/widgets/warningwidget.dart';
import 'package:flutter/material.dart';

class Detailordertrackpage extends StatelessWidget {
  const Detailordertrackpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Center(
                  child: Text(
                    'คำสั่งซื้อนี้กำลังอยู่ในขั้นตอนการติดต่อกับผู้ขาย',
                    style: TextStyle(fontSize: 13, color: red1),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.21,
                  decoration: BoxDecoration(color: white),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.009),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Image.asset('assets/icons/redpin.png'),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'รหัสนำเข้า AA',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: red1,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Container(
                              height: size.height * 0.035,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'เพิ่มรหัสนำเข้าลูกข่าย',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.007,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.08),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ที่อยู่สำหรับกการจัดส่ง',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.08),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  'xxxx xxxx',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  '0976688742',
                                  style: TextStyle(
                                      color: headingtext,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.08),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '111/222 xxxx',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.009,
                        ),
                        Container(
                          color: Colors.grey,
                          width: size.width * 0.95,
                          height: size.height * 0.0007,
                        ),
                        SizedBox(
                          height: size.height * 0.009,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          child: Row(
                            children: [
                              // Image.asset(
                              //   'assets/icons/redtruck.png',
                              //   height: size.height * 0.028,
                              // ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'รูปแบบการขนส่ง',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.077),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ขนส่งทางรถ'),
                              Text(
                                'ชำระแยกครั้ง',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: red1,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'รายการสั่งซื้อสินค้า',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: white,
                  height: size.height * 0.3,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: size.height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ำ...',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    'สีขาวมล',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    '¥ 4.88 (฿ 00)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: headingtext),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '1688严选店',
                                    style: TextStyle(
                                        fontSize: 12, color: headingtext),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.028,
                                  ),
                                  Text(
                                    'จำนวน 50',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: size.height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ำ...',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    'สีขาวมล',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    '¥ 4.88 (฿ 00)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: headingtext),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '1688严选店',
                                    style: TextStyle(
                                        fontSize: 12, color: headingtext),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.028,
                                  ),
                                  Text(
                                    'จำนวน 50',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Container(
                        color: Colors.grey,
                        width: size.width * 0.95,
                        height: size.height * 0.0007,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'หมายเหตุจากผู้ซื้อ:',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              'ไม่มี',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Container(
                        color: Colors.grey,
                        width: size.width * 0.95,
                        height: size.height * 0.0007,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ยอดรวมค่าสินค้าทั้งหมด (100 ชิ้น)::',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              '(¥ 488)',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Text(
                              '฿ 2,345.53',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: red1,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'บริการเสริม',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.155,
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Image.asset(
                            //   'assets/icons/checktookred.png',
                            //   height: size.height * 0.02,
                            // ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'ตีลังไม้',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '¥ 500',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              '(฿ 2,000)',
                              style: TextStyle(
                                  color: headingtext,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีขาวมวล',
                                  style: TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีแดงอิฐ',
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Container(
                          color: Colors.grey,
                          height: size.height * 0.001,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          child: Row(
                            children: [
                              Text(
                                'ยอดรวมค่าบริการเสริมทั้งหมด:',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                '¥ 500',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: red1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '(~฿ 2,447.94)',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: red1,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ค่าขนส่งในจีน',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: white,
                  height: size.height * 0.13,
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.015),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ค่าขนส่งในจีน - จีน',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text(
                              '฿ 0',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.004,
                        ),
                        Row(
                          children: [
                            Text(
                              'รอสรุปยอดขนส่ง',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: headingtext),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          color: headingtext,
                          height: size.height * 0.0006,
                          width: size.width * 0.98,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ยอดค่าขนส่งในจีนทั้งหมด',
                              style: TextStyle(
                                  color: headingtext,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text(
                              'รอสรุปยอด',
                              style: TextStyle(
                                  color: headingtext,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                PaymentStepsWidget(size: size),
                SizedBox(
                  height: size.height * 0.01,
                ),
                warningwidget(size: size)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context)
                            .pop(); // ปิด dialog หลังจาก 2 วินาที
                      });
                      return AlertDialog(
                        title: Text('ยืนยันเรียบร้อยแล้ว'),
                        content: Text('คำสั่งซื้อของคุณได้รับการยืนยันแล้ว'),
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ยันยันคำสั่งซื้อ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}