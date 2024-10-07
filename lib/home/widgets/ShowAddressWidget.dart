import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowAddressWidget extends StatelessWidget {
  const ShowAddressWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.93,
      height: size.height * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ที่อยู่รับพัสดุ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: headingtext,
            ),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          SizedBox(
            height: size.height * 0.19,
            width: size.width * 0.93,
            // color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'คลังกวางโจว :',
                        style: TextStyle(
                            color: red1,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        children: <TextSpan>[
                      TextSpan(
                        text:
                            ' TEG CARGO仓 广东省广州市白云区唐阁上村中街28号3栋105A仓 邮编510450',
                        style:
                            TextStyle(color: headingtext, fontSize: 15),
                      )
                    ])),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RichText(
                    text: TextSpan(
                        text: 'เบอร์โทรศัพท์ :',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        children: <TextSpan>[
                      TextSpan(
                        text: ' 18520290139啊苏',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                      )
                    ])),
                SizedBox(
                  height: size.height * 0.018,
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.042,
                    width: size.width * 0.3,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: red1,
                          side: BorderSide(
                              color: red1, width: size.width * 0.004),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                              text: 'ที่อยู่ที่ต้องการคัดลอก'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
                        );
                      },
                      child: Text(
                        'คัดลอกที่อยู่',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            height: size.height * 0.19,
            width: size.width * 0.93,
            // color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'คลังอี้อู :',
                        style: TextStyle(
                            color: red1,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        children: <TextSpan>[
                      TextSpan(
                        text:
                            ' TEG CARGO仓 浙江省义乌市稠城街道江北下朱货运市场一栋231-232号 邮编322023',
                        style:
                            TextStyle(color: headingtext, fontSize: 15),
                      )
                    ])),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RichText(
                    text: TextSpan(
                        text: 'เบอร์โทรศัพท์ :',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        children: <TextSpan>[
                      TextSpan(
                        text: ' 18520290139',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                      )
                    ])),
                SizedBox(
                  height: size.height * 0.018,
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.042,
                    width: size.width * 0.3,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: red1,
                          side: BorderSide(
                              color: red1, width: size.width * 0.004),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      onPressed: () {
                        // Clipboard.setData(
                        //   ClipboardData(
                        //       text: 'ที่อยู่ที่ต้องการคัดลอก'),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //       content:
                        //           Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
                        // );
                      },
                      child: Text(
                        'คัดลอกที่อยู่',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
