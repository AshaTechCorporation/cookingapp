import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/FoodDetailPage.dart';
import 'package:cookingapp/home/Reserve/reservePage.dart';
import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:cookingapp/models/restaurant.dart';
import 'package:flutter/material.dart';

class DetailFoodNewPage extends StatefulWidget {
  DetailFoodNewPage({super.key, required this.food});
  Menus food;

  @override
  State<DetailFoodNewPage> createState() => _DetailFoodNewPageState();
}

class _DetailFoodNewPageState extends State<DetailFoodNewPage> {
  final ScrollController scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  Restaurant? restaurant;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await getRestaurant();
    });
  }

  //ดึงข้อมูล api Restaurants
  // Future<void> getRestaurant() async {
  //   try {
  //     LoadingDialog.open(context);
  //     final _restaurant = await HomeApi.getRestaurant(id: widget.restaurant_id);
  //     if (!mounted) return;
  //     setState(() {
  //       restaurant = _restaurant;
  //     });
  //     //inspect(categories);
  //     LoadingDialog.close(context);
  //   } on Exception catch (e) {
  //     if (!mounted) return;
  //     LoadingDialog.close(context);
  //     print(e);
  //   }
  // }

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
                  // Container(
                  //   margin: EdgeInsets.only(right: 10),
                  //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(14),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.person_add),
                  //       SizedBox(width: 4),
                  //       Text(
                  //         "จำนวนจอง 15",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                      child: Image.network(
                        widget.food.photo_url ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    //bottom: MediaQuery.of(context).size.height * (-30 / 800),
                    bottom: -330,
                    left: 15,
                    right: 0,
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.92,
                          padding: EdgeInsetsDirectional.symmetric(vertical: 8),
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
                                      flex: 12,
                                      child: Text(
                                        widget.food.name ?? '',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        double.parse(widget.food.price ?? '0').toStringAsFixed(0),
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                ),
                                child: Wrap(
                                  children: [
                                    Text(
                                      widget.food.description ?? ' - ',
                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ราคาอาหาร',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '18 ตุลาคม 2567 - 19 ตุลาคม 2567',
                                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
                                        ),
                                        Text(
                                          '50',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '20 ตุลาคม 2567 - 21 ตุลาคม 2567',
                                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
                                        ),
                                        Text(
                                          '65',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '22 ตุลาคม 2567 - 24 ตุลาคม 2567',
                                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
                                        ),
                                        Text(
                                          '80',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: size.width * 0.02,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Row(
                              //         children: [
                              //           Container(
                              //             width: 40.0,
                              //             height: 40.0,
                              //             decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 225, 251, 255)),
                              //             child: Icon(
                              //               Icons.map,
                              //               color: red1,
                              //             ),
                              //           ),
                              //           Padding(
                              //             padding: EdgeInsets.symmetric(
                              //               horizontal: size.width * 0.01,
                              //             ),
                              //             child: Column(
                              //               children: [
                              //                 Text(
                              //                   '6 กม.(30 นาทีขึ้นไป)',
                              //                   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                              //                 ),
                              //                 Row(
                              //                   children: [
                              //                     Text(
                              //                       'จัดส่งตอนนี้',
                              //                       style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                              //                     ),
                              //                     VerticalDivider(
                              //                       thickness: 2,
                              //                     ),
                              //                     Text(
                              //                       'ฟรี ฿17',
                              //                       style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //       Icon(
                              //         Icons.keyboard_arrow_right,
                              //         size: 20,
                              //       )
                              //     ],
                              //   ),
                              // ),
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: size.height * 0.073,
          decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservePage(
                              food: widget.food,
                            )));
              },
              child: Text(
                'จองอาหาร',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
