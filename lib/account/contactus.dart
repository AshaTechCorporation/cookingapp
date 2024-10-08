import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'เกี่ยวกับเรา',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Center(
            //     child: Image.asset(
            //   'assets/images/logofull.png',
            //   width: 268,
            //   height: 85,
            // )),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: 365,
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'เราคือ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'SukhumvitSet'),
                          children: <TextSpan>[
                        TextSpan(
                          text: ' TEG Cargo',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              fontFamily: 'SukhumvitSet'),
                        )
                      ])),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '   TEG  ชิปปิ้งจากจีนถึงไทย ส่งดีถูกใจ ใส่ใจถึงหน้าบ้าน เรามีบริการ ส่งของจากจีนครบจบทุกขั้นตอน ขนส่งด่วนที่สุด 4-7 วัน จากจีนถึงไทย ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว สามารถสั่งซื้อสินค้า ติดต่อ ประสานงาน ร้านค้า โรงงาน ติดตามสินค้า ชิปปิ้งจีน ราคาถูกพร้อม อำนวยความสะดวก มี  Application  แจ้งเตือนสถานะสินค้า 24 ชม.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '    TEG เป็นตัวแทนออกของ หรือ ชิปปิ้ง (Shipping) หมายถึง ผู้ทำหน้าที่ด้านพิธีการเอกสารผ่านธนาคาร พิธีการศุลกากร และบริษัทเรือเดินทะเลหรือบริษัทขนส่งทางบก เพื่อนำสินค้านำเข้าจาก ประเทศจีน รวมถึงการจัดหารถไปรับสินค้าจาก โกดังลูกค้าโดยมีบริการ เหมาตู้คอนเทนเนอร์(FCL) แชร์ตู้ร่วม(LCL)และบริการส่งตรงถึงหน้า บ้าน(Door to Door) โดยนอกจากนี้บริษัทฯของเรายังมีบริการ เสริมอื่นๆ เช่น บริการจัดหาไกด์ ล่ามติดต่อประสานงาน ร้านค้า โรงงาน พร้อมอำนวยความสะดวก',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '    ทางบริษัทฯยังเปิดรับ พาสเนอร์ร่วมธุรกิจ โดยให้บริการครบวงจร เช่น เอกสารรับสินค้าที่จีนเป็นของพาสเนอร์เองได้ การอัพเดตสถานะ เข้าโกดัง รวมถึงสรุปข้อมูลสินค้าเข้าโกดังแบบวันต่อวัน',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // Image.asset('assets/images/exitway.png')
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.88,
              child: Row(
                children: [
                  Text(
                    'ช่องทางการติดต่ออื่นๆ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.001,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContactContainer(
                      size: size,
                      color: red1,
                      // imagePath: '',
                      text: '061-9966663',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: red1,
                      // imagePath: '',
                      text: 'Sale@teglogistics.net',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: green,
                      // imagePath: '',
                      text: '18520290139',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: green,
                      // imagePath: '',
                      text: '@TEGCargo',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: blue,
                      // imagePath: '',
                      text: 'TEG CARGO',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildContactContainer({
  required Size size,
  required Color color,
  // required String imagePath,
  required String text,
}) {
  return Container(
    height: size.height * 0.05,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0),
        //   child: Image.asset(
        //     imagePath, // ใช้ Image.asset แทน Icon
        //     // color: Colors.white, // หากต้องการให้ภาพเป็นสีขาว
        //     width: 24,
        //     height: 24,
        //   ),
        // ),
        Spacer(),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(), // ทำให้ Text อยู่ตรงกลาง
      ],
    ),
  );
}