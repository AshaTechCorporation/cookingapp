import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailFoodPage extends StatefulWidget {
  const DetailFoodPage({super.key});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  final ScrollController scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.072),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            //backgroundColor: Colors.red.withOpacity(appBarOpacity),
            backgroundColor: Colors.transparent,
            elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(width: 4),
                        Text(
                          "ลดสูงสุด 15",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Center(child: Icon(Icons.share)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/french-toast.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    //bottom: MediaQuery.of(context).size.height * (-30 / 800),
                    bottom: -330,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: size.height * 0.44,
                            width: size.width * 0.90,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.width * 0.02),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: Text(
                                          'French Toast This fabulous French toast',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '4.6(722) - เรตติ้งและรีวิว',
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 205, 248, 255)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.01,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '6 กม.(30 นาทีขึ้นไป)',
                                                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'จัดส่งตอนนี้',
                                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                                    ),
                                                    VerticalDivider(
                                                      thickness: 2,
                                                    ),
                                                    Text(
                                                      'ฟรี ฿17',
                                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.tag,
                                        size: 25,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        'ร้านใช้โค้ดได้',
                                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.tag,
                                            size: 25,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            'ส่วนลดรายการที่ร่วมโปรโมชั่น',
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: SizedBox(
                                    height: size.height * 0.1,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: ClampingScrollPhysics(),
                                      children: [
                                        Container(
                                          height: size.height * 0.09,
                                          width: size.width * 0.90,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color.fromARGB(255, 227, 244, 248),
                                          ),
                                          child: Center(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.02,
                                            ),
                                            child: Row(
                                              children: [
                                                Text('ปิดเร็วๆ นี้ - สั่งก่อน 21:30 น.'),
                                              ],
                                            ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ข้อเสนอวันนี้', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 205, 248, 255)),
                    child: Center(child: Icon(Icons.arrow_forward)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.45,
            ),
          ],
        ),
      ),
    );
  }
}
