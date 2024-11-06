import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/FoodList/DetailListFood/detailFoodListPage.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  int selectTab = 0;

  List<String> statusFood = [
    'ทั้งหมด',
    'ดำเนินการ',
    'พร้อมรับ',
    'เสร็จสิ้น',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    statusFood.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTab = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        height: size.height * 0.04,
                        // width: size.width * 0.22,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectTab == index ? red1 : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            statusFood[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: selectTab == index ? red1 : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            selectTab == 0
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailFoodListPage(
                              status: 'กำลังดำเนินการ',
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.symmetric(vertical: 4),
                          height: size.height * 0.18,
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'เลขที่ 202411010001',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      'กำลังดำเนินการ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: red1, fontSize: 15),
                                    ),
                                  ],
                                ),
                                Text(
                                  'ร้าน ตามสั่ง',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  'วันที่สั่ง: 31/10/24 16:30',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                ),
                                // Text(
                                //   'หมายเหตุ: ..........',
                                //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ยอดรวม:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      '฿ 1,000',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                ),
                                Divider(),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Container(
                                //       width: size.width * 0.35,
                                //       height: size.height * 0.05,
                                //       decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                                //       child: Center(
                                //         child: TextButton(
                                //           onPressed: () async {},
                                //           child: Text(
                                //             'ร้องเรียน',
                                //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Container(
                                //       width: size.width * 0.35,
                                //       height: size.height * 0.05,
                                //       decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
                                //       child: Center(
                                //         child: TextButton(
                                //           onPressed: () async {},
                                //           child: Text(
                                //             'ยกเลิก',
                                //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailFoodListPage(
                              status: 'พร้อมรับ',
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.symmetric(vertical: 4),
                          height: size.height * 0.18,
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'เลขที่ 202411010002',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      'กำลังดำเนินการ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: red1, fontSize: 15),
                                    ),
                                  ],
                                ),
                                Text(
                                  'ร้าน ข้าวแกง',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  'วันที่สั่ง: 31/10/24 16:12',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                ),
                                // Text(
                                //   'หมายเหตุ: ..........',
                                //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ยอดรวม:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      '฿ 1,000',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                ),
                                Divider(),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Container(
                                //       width: size.width * 0.35,
                                //       height: size.height * 0.05,
                                //       decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                                //       child: Center(
                                //         child: TextButton(
                                //           onPressed: () async {},
                                //           child: Text(
                                //             'ร้องเรียน',
                                //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Container(
                                //       width: size.width * 0.35,
                                //       height: size.height * 0.05,
                                //       decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
                                //       child: Center(
                                //         child: TextButton(
                                //           onPressed: () async {},
                                //           child: Text(
                                //             'รับอาหาร',
                                //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : selectTab == 1
                    ? Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailFoodListPage(
                                  status: 'กำลังดำเนินการ',
                                );
                              }));
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
                              height: size.height * 0.18,
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'เลขที่ 202411010001',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        ),
                                        Text(
                                          'กำลังดำเนินการ',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: red1, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'ร้าน ตามสั่ง',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      'วันที่สั่ง: 31/10/24 16:30',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    ),
                                    // Text(
                                    //   'หมายเหตุ: ..........',
                                    //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ยอดรวม:',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        ),
                                        Text(
                                          '฿ 1,000',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Container(
                                    //       width: size.width * 0.35,
                                    //       height: size.height * 0.05,
                                    //       decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                                    //       child: Center(
                                    //         child: TextButton(
                                    //           onPressed: () async {},
                                    //           child: Text(
                                    //             'ร้องเรียน',
                                    //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       width: size.width * 0.35,
                                    //       height: size.height * 0.05,
                                    //       decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
                                    //       child: Center(
                                    //         child: TextButton(
                                    //           onPressed: () async {},
                                    //           child: Text(
                                    //             'ยกเลิก',
                                    //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : selectTab == 2
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return DetailFoodListPage(
                                      status: 'พร้อมรับ',
                                    );
                                  }));
                                },
                                child: Container(
                                  margin: EdgeInsetsDirectional.symmetric(vertical: 4),
                                  height: size.height * 0.18,
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
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'เลขที่ 202411010002',
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                            ),
                                            Text(
                                              'กำลังดำเนินการ',
                                              style: TextStyle(fontWeight: FontWeight.bold, color: red1, fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'ร้าน ข้าวแกง',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        ),
                                        Text(
                                          'วันที่สั่ง: 31/10/24 16:12',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        ),
                                        // Text(
                                        //   'หมายเหตุ: ..........',
                                        //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                        // ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ยอดรวม:',
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                            ),
                                            Text(
                                              '฿ 1,000',
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Container(
                                        //       width: size.width * 0.35,
                                        //       height: size.height * 0.05,
                                        //       decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                                        //       child: Center(
                                        //         child: TextButton(
                                        //           onPressed: () async {},
                                        //           child: Text(
                                        //             'ร้องเรียน',
                                        //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     Container(
                                        //       width: size.width * 0.35,
                                        //       height: size.height * 0.05,
                                        //       decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
                                        //       child: Center(
                                        //         child: TextButton(
                                        //           onPressed: () async {},
                                        //           child: Text(
                                        //             'รับอาหาร',
                                        //             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [],
                          )
          ],
        ),
      ),
    );
  }
}
