import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class warningwidget extends StatelessWidget {
  const warningwidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.95,
      height: size.height * 0.33,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xfffdedee)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                // Image.asset('assets/icons/hello.png'),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'ข้อจำกัดการรับผิดชอบ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: oldred),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              'TEG Cargo เป็นเพียงผู้ช่วยในการสั่งซื้อสินค้ากับร้านค้าจีนตามราย การสินค้าที่ลูกค้าเปิดออเดอร์สั่งซื้อมาเท่านั้นในกรณีที่สินค้ามีปัญหา เช่น ด้านคุณภาพสินค้า สินค้าผิดสเปก หรือปัญหาใน ด้านอื่นๆ ทาง TEG Cargo จะช่วยประสานงานกับทางร้านค้าจีนเพื่อเจรจาให้ ร้านค้า จีนรับผิดชอบต่อความเสียหายต่างๆที่เกิดขึ้น เนื่องจาก TEG Cargo เป็นเพียงผู้ช่วยสั่งซื้อสินค้าเท่านั้น และไม่สามารถรับผิดชอบต่อความ เสียหายต่างๆ ที่เกิดขึ้นจากร้านค้าจีนได้',
              style: TextStyle(color: oldred, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
