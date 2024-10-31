import 'package:cookingapp/Store/Graphs/DetailFoodGraphs.dart';
import 'package:cookingapp/Store/Graphs/graphsPage.dart';
import 'package:cookingapp/Store/Graphs/test3.dart';
import 'package:cookingapp/Store/Graphs/testGraphs.dart';
import 'package:cookingapp/Store/home/addItem/createItem.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/detailFoodPage.dart';
import 'package:cookingapp/home/services/homeApi.dart';
import 'package:cookingapp/home/widgets/CardFoodWidget.dart';
import 'package:cookingapp/home/widgets/CardRestaurantWidget.dart';
import 'package:cookingapp/home/widgets/importwidget.dart';
import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/models/restaurant.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HomePageStore extends StatefulWidget {
  const HomePageStore({super.key});

  @override
  State<HomePageStore> createState() => _HomePageStoreState();
}

class _HomePageStoreState extends State<HomePageStore> {
  final ScrollController scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  String selectedLanguage = 'ไทย';
  int selectTab = 0;

  List<Restaurant> restaurants = [];

  void selectTabBar({required int index}) {
    setState(() {
      selectTab = index;
    });
  }

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
      // extendBodyBehindAppBar: true,
      // backgroundColor: background,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(size.height * 0.072),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(30),
      //     ),
      //     child: AppBar(
      //       automaticallyImplyLeading: false,
      //       backgroundColor: red1.withOpacity(appBarOpacity),
      //       elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
      //       title: Padding(
      //         padding: EdgeInsets.only(top: size.height * 0.01),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               height: size.height * 0.045,
      //               width: size.width * 0.83,
      //               padding: EdgeInsets.all(size.height * 0.005),
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: Colors.grey, width: size.width * 0.001),
      //                 borderRadius: BorderRadius.circular(15),
      //                 color: Color.lerp(Colors.white, Colors.grey, appBarOpacity),
      //               ),
      //               child: IntrinsicHeight(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     SizedBox(
      //                       width: size.width * 0.33,
      //                       child: TextFormField(
      //                         decoration: InputDecoration(
      //                           border: InputBorder.none,
      //                           hintText: 'ค้นหาสินค้า',
      //                           hintStyle: TextStyle(),
      //                           contentPadding: EdgeInsets.only(left: size.width * 0.02, bottom: size.height * 0.01),
      //                         ),
      //                       ),
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {},
      //                       child: Container(
      //                         height: size.height * 0.05,
      //                         width: size.width * 0.164,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(10),
      //                           color: red1,
      //                         ),
      //                         child: Center(
      //                           child: Text(
      //                             'ค้นหา',
      //                             style: TextStyle(color: Colors.white),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: EdgeInsets.symmetric(horizontal: size.width * 0.003),
      //               child: GestureDetector(
      //                 onTapDown: (TapDownDetails details) {
      //                   showMenu(
      //                     context: context,
      //                     position: RelativeRect.fromLTRB(
      //                       details.globalPosition.dx,
      //                       details.globalPosition.dy + 25,
      //                       MediaQuery.of(context).size.width - details.globalPosition.dx - 10,
      //                       0,
      //                     ),
      //                     items: <PopupMenuEntry<String>>[
      //                       PopupMenuItem<String>(
      //                         value: 'ไทย',
      //                         child: SizedBox(
      //                           width: size.width * 0.099,
      //                           child: Row(
      //                             children: [
      //                               // Image.asset('assets/icons/thai.png',
      //                               //     height: 20),
      //                               SizedBox(width: size.width * 0.01),
      //                               Text(
      //                                 'ไทย',
      //                                 style: TextStyle(fontSize: 13),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                       PopupMenuItem<String>(
      //                         value: 'English',
      //                         child: Row(
      //                           children: [
      //                             // Image.asset('assets/icons/usa.png', height: 20), ธงสหรัฐ
      //                             // SizedBox(width: size.width * 0.01),
      //                             Text(
      //                               'English',
      //                               style: TextStyle(fontSize: 13),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       PopupMenuItem<String>(
      //                         value: '汉语',
      //                         child: Row(
      //                           children: [
      //                             // Image.asset('assets/icons/china.png', height: 20), ธงจีน
      //                             // SizedBox(width: size.width * 0.01),
      //                             Text(
      //                               '汉语',
      //                               style: TextStyle(fontSize: 13),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                     elevation: 8.0,
      //                   ).then((value) {
      //                     if (value != null) {
      //                       setState(() {
      //                         selectedLanguage = value;
      //                       });
      //                     }
      //                   });
      //                 },
      //                 child: Image.asset('assets/icons/thai.png', height: size.height * 0.032),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // appBar: AppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/79E865FC-C28A-4CA9-B7C6-BA428BF5E7FD.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    left: 18,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectTabBar(index: 0);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.44,
                            decoration: BoxDecoration(
                              color: selectTab == 0 ? red1 : Colors.white,
                              border: Border.all(
                                color: selectTab == 0 ? Colors.transparent : red1,
                              ),
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
                            child: Center(
                              child: Text(
                                'เปิดขายอาหาร',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectTab == 1 ? red1 : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            selectTabBar(index: 1);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.44,
                            decoration: BoxDecoration(
                              color: selectTab == 1 ? red1 : Colors.white,
                              border: Border.all(
                                color: selectTab == 1 ? Colors.transparent : red1,
                              ),
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
                            child: Center(
                              child: Text(
                                'ปิดขายอาหาร',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectTab == 0 ? red1 : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            selectTab == 0
                ? foods.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Wrap(
                          children: List.generate(
                            foods.length,
                            (index) {
                              return foods[index].isLiked == false
                                  ? SizedBox.shrink()
                                  : CardRestaurantWidget2(
                                      size: size,
                                      name: foods[index].name,
                                      address: '',
                                      image: foods[index].image,
                                      km: foods[index].reviews.toString(),
                                      rate: foods[index].rate.toString(),
                                      press: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return CreateItemPage(
                                            foods: foods[index],
                                          );
                                        }));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => DetailFoodPage(
                                        //               restaurant_id: restaurants[index].id,
                                        //             )));
                                      });
                            },
                          ),
                        ),
                      )
                    : SizedBox()
                : foods.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Wrap(
                          children: List.generate(
                            foods.length,
                            (index) {
                              return foods[index].isLiked == true
                                  ? SizedBox.shrink()
                                  : CardRestaurantWidget2(
                                      size: size,
                                      name: foods[index].name,
                                      address: '',
                                      image: foods[index].image,
                                      km: foods[index].reviews.toString(),
                                      rate: foods[index].rate.toString(),
                                      press: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return CreateItemPage(
                                            foods: foods[index],
                                          );
                                        }));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => DetailFoodPage(
                                        //               restaurant_id: restaurants[index].id,
                                        //             )));
                                      });
                            },
                          ),
                        ),
                      )
                    : SizedBox(),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red1,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: brown),
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateItemPage();
          }));
        },
        tooltip: 'เพิ่มรายการ',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
