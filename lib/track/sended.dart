import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Sended extends StatelessWidget {
  const Sended({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'จัดส่งสินค้าแล้ว',
            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.95,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(13), border: Border.all(color: greyuserinfo, width: 0.5)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'ค้นหาเลข Tracking, Order, Container ',
                              hintStyle: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: size.height * 0.018, left: size.width * 0.03),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: size.height * 0.037,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: red1,
                              ),
                              child: Center(
                                child: Text(
                                  'ค้นหา',
                                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: Colors.grey,
                    height: size.height * 0.0003,
                    // width: size.width * 0.9,
                  )
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Sendcomplete(),
                  //   ),
                  // );
                },
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: size.height * 0.02,
                        right: size.width * 0.02,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/icons/carback.png',
                            width: size.width * 0.28,
                            height: size.height * 0.1,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.95,
                        height: size.height * 0.23,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 0.5)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Container(
                              width: size.width * 0.85,
                              height: size.height * 0.045,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order no. A423456',
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/waitsum.png',
                                      height: size.height * 0.037,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Image.asset(
                                      'assets/icons/processpurchase.png',
                                      height: size.height * 0.037,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Image.asset('assets/icons/confirmorder.png', height: size.height * 0.037),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Image.asset('assets/icons/readytosend.png', height: size.height * 0.037),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Image.asset('assets/icons/sended.png', height: size.height * 0.037),
                                    SizedBox(
                                      width: size.width * 0.25,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.01),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'จัดส่งสินค้าสำเร็จ',
                                                style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.01),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'เลขที่คำสั่งซื้อ',
                                                style: TextStyle(fontSize: 12, color: greyuserinfo, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.01),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '0987654',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: greyuserinfo,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                              child: Row(
                                children: [
                                  Text(
                                    'ประเภท สินค้าสั่งซื้อ ',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Spacer(),
                                  Text(
                                    'สั่งซื้อเมื่อ 28 ก.ค.  67',
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/byredcar.png',
                                    height: size.height * 0.03,
                                    color: red1,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    'ขนส่งทางรถ',
                                    style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    'รายละเอียด',
                                    style: TextStyle(color: red1, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Image.asset('assets/icons/rightarrow.png'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
