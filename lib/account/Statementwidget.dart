import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Statementwidget extends StatelessWidget {
  final Map<String, dynamic> statement;
  final VoidCallback onTap;

  const Statementwidget({
    super.key,
    required this.statement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: size.height * 0.085,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.015, left: size.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'PO NO.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: statement[
                                      'po'],
                                  style: TextStyle(
                                    color: red1,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: size.height *
                              0.012), // ระยะห่างระหว่าง row และ 'ผ่าน'
                      Text(
                        'ชำระส่วน${statement['by']}',
                        style: TextStyle(
                            fontSize: 13,
                            color: headingtext,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // ข้อความทางขวา (จำนวนเงิน)
              Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // จัดข้อความชิดขวาใน Column
                  mainAxisAlignment:
                      MainAxisAlignment.center, // จัดให้อยู่ตรงกลางใน Row
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.02),
                      child: Text(
                        ' ${statement['amount']} บาท',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: size.height * 0.005), // เว้นบรรทัด
                    Row(
                      mainAxisSize: MainAxisSize
                          .min, // ทำให้ Row ใช้พื้นที่ตามเนื้อหาภายใน
                      children: [
                        Text(
                          ' ${statement['time']}',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.01), // ระยะห่างเล็กน้อย
                        Icon(Icons.arrow_drop_down,
                            color: Colors.grey), // ไอคอนลูกศรลง
                      ],
                    ),
                  ])
            ],
          )),
    );
  }
}