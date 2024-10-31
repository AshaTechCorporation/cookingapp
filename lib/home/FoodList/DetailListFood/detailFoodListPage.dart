import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class DetailFoodListPage extends StatefulWidget {
  const DetailFoodListPage({super.key, required this.status});
  final String status;

  @override
  State<DetailFoodListPage> createState() => _DetailFoodListPageState();
}

class _DetailFoodListPageState extends State<DetailFoodListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
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
        title: Text('รายดารสั่งซื้อ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
              padding: EdgeInsets.all(16),
              height: size.height * 0.1,
              width: size.width * 0.92,
              decoration: BoxDecoration(
                color: widget.status == 'พร้อมรับ' ? Color.fromARGB(172, 114, 237, 118) : red2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.status,
                    style: TextStyle(
                      color: widget.status == 'พร้อมรับ' ? Colors.green : red1,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    widget.status == 'พร้อมรับ' ? 'รายการอาหารของคุณพร้อมรับแล้ว' : 'รายการอาหารของคุณกำลังทำ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
              padding: EdgeInsets.all(16),
              height: size.height * 0.12,
              width: size.width * 0.92,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ร้าน ข้าวแกง',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    'ห่างจากคุณ 0.75 k.m',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
              padding: EdgeInsets.all(16),
              height: size.height * 0.3,
              width: size.width * 0.92,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'รายการอาหารที่สั่ง',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                              width: size.width * 0.2,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('กระเพราหมูสับ'),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text('จำนวน 1'),
                              ],
                            )
                          ],
                        ),
                        Text('80'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'หมายเหตุเพิ่มเติม: ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'หมายเหตุ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ยอดรวมค่าอาหารทั้งหมด: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '฿ 80',
                        style: TextStyle(
                          fontSize: 12,
                          color: red1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: widget.status != 'พร้อมรับ'
          ? SizedBox.shrink()
          : BottomAppBar(
              height: size.height * 0.11,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: TextButton(
                        onPressed: () async {},
                        child: Text(
                          'ร้องเรียน',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: TextButton(
                        onPressed: () async {},
                        child: Text(
                          'รับอาหาร',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
