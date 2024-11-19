import 'package:cookingapp/Store/Graphs/graphsPage.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/Search/searchPage.dart';
import 'package:cookingapp/home/detailFoodPage.dart';
import 'package:cookingapp/home/services/homeApi.dart';
import 'package:cookingapp/home/widgets/CardFoodWidget.dart';
import 'package:cookingapp/home/widgets/CardRestaurantWidget.dart';
import 'package:cookingapp/home/widgets/importwidget.dart';
import 'package:cookingapp/models/restaurant.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  final List<String> items = [
    'taobao',
    '1688',
  ];
  String selectedValue = 'taobao';
  String selectedLanguage = 'ไทย';

  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistRestaurants();
    });

    // เพิ่ม Listener เพื่อตรวจจับการเลื่อน
    scrollController.addListener(() {
      double offset = scrollController.offset;
      double newOpacity = (offset / 150).clamp(0.0, 1.0);

      if (newOpacity != appBarOpacity) {
        setState(() {
          appBarOpacity = newOpacity;
        });
      }
    });
  }

  //ดึงข้อมูล api Restaurants
  Future<void> getlistRestaurants() async {
    try {
      LoadingDialog.open(context);
      final _restaurants = await HomeApi.getRestaurants();
      if (!mounted) return;

      setState(() {
        restaurants = _restaurants;
      });
      //inspect(categories);
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
            backgroundColor: red1.withOpacity(appBarOpacity),
            elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
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
            title: Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SearchPage();
                      }));
                    },
                    child: Container(
                      height: size.height * 0.045,
                      width: size.width * 0.70,
                      padding: EdgeInsets.all(size.height * 0.005),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: size.width * 0.001),
                        borderRadius: BorderRadius.circular(15),
                        color: Color.lerp(Colors.transparent, Colors.white, appBarOpacity),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * 0.33,
                              // child: TextFormField(
                              //   decoration: InputDecoration(
                              //     border: InputBorder.none,
                              //     hintText: 'ค้นหาสินค้า',
                              //     hintStyle: TextStyle(),
                              //     contentPadding: EdgeInsets.only(left: size.width * 0.02, bottom: size.height * 0.01),
                              //   ),
                              // ),
                              child: Text(
                                'ค้นหาสินค้า',
                                style: TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            // Image.asset(
                            //   'assets/icons/cam.png',
                            //   color: red1,
                            // ),
                            // SizedBox(
                            //   height: size.height * 0.05,
                            //   width: size.width * 0.225,
                            // child: DropdownButtonHideUnderline(
                            //   child: DecoratedBox(
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(color: Colors.white, width: 2),
                            //     ),
                            //     child: DropdownButton2<String>(
                            //       isExpanded: true,
                            //       hint: Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Text(
                            //           'เลือกสินค้า',
                            //           style: TextStyle(
                            //             fontSize: 11,
                            //             color: red1,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //       items: items
                            //           .map((String item) => DropdownMenuItem<String>(
                            //                 value: item,
                            //                 child: Text(
                            //                   item,
                            //                   style: TextStyle(fontSize: 14, color: red1),
                            //                 ),
                            //               ))
                            //           .toList(),
                            //       value: selectedValue,
                            //       onChanged: (String? value) {
                            //         setState(() {
                            //           selectedValue = value!;
                            //         });
                            //         // getlistCategories(name: selectedValue);
                            //       },
                            //       buttonStyleData: ButtonStyleData(
                            //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                            //         width: size.width * 0.1,
                            //       ),
                            //       menuItemStyleData: MenuItemStyleData(
                            //         height: size.height * 0.1,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //),
                            // SizedBox(
                            //   width: size.width * 0.001,
                            // ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: red1,
                                ),
                                child: Center(
                                  child: Text(
                                    'ค้นหา',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.003),
                    child: GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx,
                            details.globalPosition.dy + 25,
                            MediaQuery.of(context).size.width - details.globalPosition.dx - 10,
                            0,
                          ),
                          items: <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'ไทย',
                              child: SizedBox(
                                width: size.width * 0.099,
                                child: Row(
                                  children: [
                                    // Image.asset('assets/icons/thai.png',
                                    //     height: 20),
                                    SizedBox(width: size.width * 0.01),
                                    Text(
                                      'ไทย',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'English',
                              child: Row(
                                children: [
                                  // Image.asset('assets/icons/usa.png', height: 20), ธงสหรัฐ
                                  // SizedBox(width: size.width * 0.01),
                                  Text(
                                    'English',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: '汉语',
                              child: Row(
                                children: [
                                  // Image.asset('assets/icons/china.png', height: 20), ธงจีน
                                  // SizedBox(width: size.width * 0.01),
                                  Text(
                                    '汉语',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          elevation: 8.0,
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          }
                        });
                      },
                      child: Image.asset('assets/icons/thai.png', height: size.height * 0.032),
                    ),
                  ),
                  // GestureDetector(child: Icon(Icons.settings))
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/79E865FC-C28A-4CA9-B7C6-BA428BF5E7FD.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   //bottom: MediaQuery.of(context).size.height * (-30 / 800),
                    //   bottom: -20,
                    //   left: 0,
                    //   right: 0,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         ...List.generate(
                    //           importwidget.length,
                    //           (index) => GestureDetector(
                    //             onTap: () {
                    //               if (index == 0) {
                    //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //                   return LineChartSample1();
                    //                 }));
                    //               }
                    //               if (index == 1) {
                    //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //                   return LineChartSample1();
                    //                 }));
                    //               }
                    //             },
                    //             child: Importwidget(
                    //               size: size,
                    //               title: importwidget[index]['name'],
                    //               imagePath: importwidget[index]['images'],
                    //               id: importwidget[index]['id'],
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.021),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ค้นหาสิ่งที่คุณชอบ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.38,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: brown),
                            color: Color.fromARGB(174, 241, 220, 155),
                          ),
                          child: Center(child: Text('หมวดหมู่ทั้งหมด', style: TextStyle(fontWeight: FontWeight.bold, color: brown, fontSize: 15))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 25,
                      ),
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            itemManu[index]['imageAssetPath'],
                            width: size.width * 0.2,
                            height: size.width * 0.18,
                          ),
                          Text(
                            itemManu[index]['name'],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      itemCount: itemManu.length,
                    ),
                    // Row(
                    //   children: List.generate(
                    //       itemManu.length,
                    //       (index) => Column(
                    //             children: [
                    //               Image.asset(
                    //                 itemManu[index]['imageAssetPath'],
                    //                 width: size.width * 0.2,
                    //               ),
                    //               Text(
                    //                 itemManu[index]['name'],
                    //                 style: TextStyle(fontSize: 12),
                    //               ),
                    //             ],
                    //           )),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              //       child: Text(
              //         'บริการของเรา',
              //         style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //     // GestureDetector(
              //     //     onTap: () {
              //     //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     //         return LineChartSample2();
              //     //       }));
              //     //     },
              //     //     child: Image.asset(
              //     //       'assets/icons/cam.png',
              //     //       scale: 2,
              //     //     )),
              //     // GestureDetector(
              //     //     onTap: () {
              //     //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     //         return LineChartSample11();
              //     //       }));
              //     //     },
              //     //     child: Image.asset(
              //     //       'assets/icons/cam.png',
              //     //       scale: 2,
              //     //     )),
              //     // GestureDetector(
              //     //     onTap: () {
              //     //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     //         return LineChartSample1();
              //     //       }));
              //     //     },
              //     //     child: Image.asset(
              //     //       'assets/icons/cam.png',
              //     //       scale: 2,
              //     //     )),
              //   ],
              // ),
              // SizedBox(
              //   height: size.height * 0.015,
              // ),
              // SizedBox(
              //   height: size.height * 0.26,
              //   child: ListView(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //         child: CardFoodWidget(size: size),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //         child: CardFoodWidget(size: size),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //         child: CardFoodWidget(size: size),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //   child: Container(
              //     height: size.height * 0.05,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: greymess,
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             children: [
              //               Icon(
              //                 Icons.notifications,
              //                 size: 30,
              //                 color: Colors.amber,
              //               ),
              //               Text('อาจมีความล่าช้า ต้องรอนานมากขึ้น'),
              //             ],
              //           ),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //             size: 20,
              //             color: Colors.grey,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.04,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //   child: Container(
              //     height: size.height * 0.08,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color: Color.fromARGB(255, 247, 198, 126),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'คุณมีคูปองส่วนลดอาหาร 80 ใบ',
              //             style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 116, 12, 12), fontSize: 16),
              //           ),
              //           Row(
              //             children: [
              //               VerticalDivider(
              //                 thickness: 2,
              //                 color: Colors.orange,
              //               ),
              //               Container(
              //                 height: size.height * 0.06,
              //                 width: size.width * 0.25,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                   color: Colors.orange,
              //                 ),
              //                 child: Center(child: Text('ดู', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18))),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ร้านอาหาร', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 205, 248, 255)),
                      child: Center(child: Icon(Icons.arrow_forward)),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),

              restaurants.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: SizedBox(
                        height: size.height * 0.30,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            restaurants.length,
                            (index) => CardRestaurantWidget(
                                size: size,
                                name: restaurants[index].name ?? ' - ',
                                address: restaurants[index].address ?? ' - ',
                                image: 'https://s359.kapook.com/rq/580/435/50/pagebuilder/29e40ab6-f3b1-42f8-a0fb-31b2475c0db4.jpg',
                                km: restaurants[index].description ?? ' - ',
                                rate: restaurants[index].open_hours ?? ' - ',
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailFoodPage(
                                                restaurant_id: restaurants[index].id,
                                              )));
                                }),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //   child: SizedBox(
              //     height: size.height * 0.30,
              //     child: ListView(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       children: List.generate(
              //         8,
              //         (index) => Padding(
              //           padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //           child: GestureDetector(
              //             onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => DetailFoodPage()));
              //             },
              //             child: Container(
              //               height: size.height * 0.30,
              //               width: size.width * 0.41,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 //color: Colors.amber
              //               ),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     height: size.height * 0.15,
              //                     width: size.width * 0.41,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       image: DecorationImage(
              //                         fit: BoxFit.fill,
              //                         image: AssetImage("assets/images/ramen-noodles.jpg"),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: size.height * 0.01,
              //                   ),
              //                   Text('โปรโมชั่น'),
              //                   Text(
              //                     'Spicy Ramen Noodles',
              //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   Text(
              //                     '45 นาที - 3 กม.',
              //                     style: TextStyle(fontSize: 15),
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Container(
              //                         height: size.height * 0.03,
              //                         width: size.width * 0.22,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(5),
              //                           color: Color.fromARGB(255, 241, 214, 132),
              //                         ),
              //                         child: Center(child: Text('ร้านใช้โค้ดได้')),
              //                       ),
              //                       SizedBox(
              //                         width: size.width * 0.01,
              //                       ),
              //                       Container(
              //                         height: size.height * 0.03,
              //                         width: size.width * 0.14,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(5),
              //                           color: Color.fromARGB(255, 241, 214, 132),
              //                         ),
              //                         child: Center(child: Text('ลด 30%')),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('เมนูแนะนำสำหรับคุณ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
              ),
              Column(
                children: List.generate(
                  8,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: size.height * 0.01),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/beaf-steak.jpg"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Beef Steak',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text('4.7 - อาหาร'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: brown,
                                    ),
                                    Text(
                                      '฿10 - ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      '30 นาทีขึ้นไป',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3.0),
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.countertops_outlined,
                                            color: brown,
                                          ),
                                          Text('ลดพิเศษสำหรับสมาชิก'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(3.0),
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.countertops_outlined,
                                            color: brown,
                                          ),
                                          Text('ลด ฿100'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> itemManu = [
    {
      'name': 'อาหารตามสั่ง',
      'imageAssetPath': 'assets/images/1.png',
    },
    {
      'name': 'พิซซ่า',
      'imageAssetPath': 'assets/images/2.png',
    },
    {
      'name': 'อาหารทะเล',
      'imageAssetPath': 'assets/images/3.png',
    },
    {
      'name': 'ราเมง',
      'imageAssetPath': 'assets/images/4.png',
    },
    {
      'name': 'เมนูเส้น',
      'imageAssetPath': 'assets/images/5.png',
    },
    {
      'name': 'อาหารญี่ปุ่น',
      'imageAssetPath': 'assets/images/japan.png',
    },
    {
      'name': 'ผลไม้',
      'imageAssetPath': 'assets/images/7.png',
    },
    {
      'name': 'อาหารสุขภาพ',
      'imageAssetPath': 'assets/images/8.png',
    },
  ];
}
