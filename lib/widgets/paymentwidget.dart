import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class PaymentStepsWidget extends StatelessWidget {
  final Size size;

  const PaymentStepsWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: size.height * 0.40,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'อัตราแลกเปลี่ยน ณ วันที่ 00 ส.ค. 00 (00:00:00)',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4.8851 หยวนจีนต่อบาทไทย',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: skyorange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ราคาสินค้าอาจคลาดเคลื่อนกับเว็บไซต์ต้นทาง',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        ),
                        Text(
                          'ระบบจะแสดงราคาสินค้าที่ต้องชำระหลังออเดอร์ตรวจสอบแล้ว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'ขั้นตอนการชำระ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _buildIconWithLine(
                                  size, ),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, ),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.005),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: _buildStepText(
                                    'รอเจ้าหน้าที่ตรวจสอบหลังจากทำการสั่งซื้อ',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.044),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งในจีน และค่าสินค้าแก่ Supplier',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.042),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งจากจีนถึงไทย และการจัดส่งในไทย',
                                  ),
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
            );
  }

  Widget _buildIconWithLine(Size size, ) {
    return Center(
      // child: Image.asset(
      //   imagePath,
      //   width: size.width * 0.08,
      //   height: size.height * 0.04,
      //   color: Colors.orange,
      // ),
    );
  }

  Widget _buildDividerLine(Size size) {
    return Container(
      width: 2,
      height: size.height * 0.02,
      color: Colors.orange,
    );
  }

  Widget _buildStepText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
