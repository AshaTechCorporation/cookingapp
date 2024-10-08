import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Withdrownhiswidget extends StatelessWidget {
  final Map<String, dynamic> withdrownhis;
  final VoidCallback onTap;

  const Withdrownhiswidget({
    super.key,
    required this.withdrownhis,
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
                    top: size.height * 0.015,
                    left: size.width * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            withdrownhis['date'],
                            style: TextStyle(
                                color: red1,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              width: size.width *
                                  0.02), // เว้นระยะห่างระหว่างวันที่กับเวลา
                          Text(
                            withdrownhis['time'],
                            style: TextStyle(
                                fontSize: 13,
                                color: headingtext,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: size.height *
                              0.005), // ระยะห่างระหว่าง row และ 'ผ่าน'
                      Text(
                        'ผ่าน ${withdrownhis['by']}',
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
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07),
                child: Align(
                  alignment: Alignment.centerRight, // จัดให้อยู่ตรงกลางขวา
                  child: Text(
                    '${withdrownhis['amount']} ฿',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
