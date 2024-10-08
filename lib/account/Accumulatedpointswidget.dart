import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Accumulatedpointswidget extends StatelessWidget {
  final Map<String, dynamic> accumulatedpoints;
  final VoidCallback onTap;

  const Accumulatedpointswidget({
    super.key,
    required this.accumulatedpoints,
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
                  child: accumulatedpoints['status'] == true
                      ? Column(
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
                                        text: accumulatedpoints['user'],
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
                            SizedBox(height: size.height * 0.012),
                            Text(
                              'ได้รับคะแนน',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.04),
                          child: Text(
                            'คะแนนหมดอายุ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${accumulatedpoints['status'] == true ? '+' : '-'} ${accumulatedpoints['point']} ',
                            style: TextStyle(
                              fontSize: 15,
                              color: accumulatedpoints['status'] == true
                                  ? Color(0xff00ac47) // สีเขียวถ้า true
                                  : red1, // สีแดงถ้า false
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SukhumvitSet'
                            ),
                          ),
                          TextSpan(
                            text: 'คะแนน',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SukhumvitSet'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.005), // เว้นบรรทัด
                  Row(
                    mainAxisSize:
                        MainAxisSize.min, // ทำให้ Row ใช้พื้นที่ตามเนื้อหาภายใน
                    children: [
                      Text(
                        ' ${accumulatedpoints['time']}',
                        style: TextStyle(
                            fontSize: 13,
                            color: headingtext,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: size.width * 0.01),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
