import 'package:cookingapp/Store/Graphs/graphsPage.dart';
import 'package:cookingapp/Store/accountStore.dart/accountStorePage.dart';
import 'package:cookingapp/Store/home/HomePageStore.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class FirstPageStore extends StatefulWidget {
  const FirstPageStore({super.key});

  @override
  State<FirstPageStore> createState() => _FirstPageStoreState();
}

class _FirstPageStoreState extends State<FirstPageStore> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePageStore();

  void onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        currentPage = HomePageStore();
      } else if (selectedIndex == 1) {
        // currentPage = ProductPage();
      } else if (selectedIndex == 2) {
        currentPage = LineChartSample1();
      } else if (selectedIndex == 3) {
        // currentPage = CartPage();
      } else if (selectedIndex == 4) {
        currentPage = AccountStorePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardVisible
          ? null
          : Transform.translate(
              offset: Offset(0, 22),
              child: GestureDetector(
                onTap: () {
                  onItemSelect(2);
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: red1),
                  child: Center(
                    child: Icon(
                      Icons.auto_graph,
                      size: 50,
                      color: Colors.white,
                    ),
                    // child: Image.asset(
                    //   'assets/icons/truck.png',
                    //   // width: 10,
                    //   height: 35,
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20, // Adjust the width as needed
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  onItemSelect(0);
                },
                child: selectedIndex == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Frame 61.png',
                            width: 24,
                            height: 27,
                            color: red1,
                          ),
                          Text(
                            'หน้าหลัก',
                            style: TextStyle(fontSize: 14, color: red1),
                          )
                        ],
                      )
                    : Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/greymain.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'หน้าหลัก',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
              ),
              SizedBox(
                width: 50, // Adjust the width as needed
                height: 30,
              ),
              // SizedBox(
              //   width: 1,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     onItemSelect(1);
              //   },
              //   child: selectedIndex == 1
              //       ? Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               'assets/icons/redgroup.png',
              //               width: 30,
              //               height: 30,
              //               color: red1,
              //             ),
              //             Text(
              //               'ร้านค้า',
              //               style: TextStyle(fontSize: 14, color: red1),
              //             )
              //           ],
              //         )
              //       : Center(
              //           child: Column(
              //             children: [
              //               Image.asset(
              //                 'assets/icons/group.png',
              //                 width: 30,
              //                 height: 30,
              //               ),
              //               Text(
              //                 'ร้านค้า',
              //                 style: TextStyle(fontSize: 14),
              //               )
              //             ],
              //           ),
              //         ),
              // ),

              // SizedBox(
              //   width: 5,
              // ),
              // GestureDetector(
              //     onTap: () {
              //       onItemSelect(3);
              //     },
              //     child: selectedIndex == 3
              //         ? Column(
              //             children: [
              //               Image.asset(
              //                 'assets/icons/redcart.png',
              //                 width: 20, // Adjust the width as needed
              //                 height: 20, // Adjust the height as needed
              //                 color: red1,
              //               ),
              //               // Text(
              //               //   'รถเข็น',
              //               //   style: TextStyle(color: red1),
              //               // )
              //             ],
              //           )
              //         : Column(
              //             children: [
              //               Image.asset(
              //                 'assets/icons/shipping.png',
              //                 width: 20, // Adjust the width as needed
              //                 height: 20, // Adjust the height as needed
              //               ),
              //               // Text(
              //               //   'รถเข็น',
              //               //   style: TextStyle(),
              //               // )
              //             ],
              //           )),

              // SizedBox(
              //   width: 5,
              // ),
              // GestureDetector(
              //     onTap: () {
              //       onItemSelect(3);
              //     },
              //     child: selectedIndex == 3
              //         ? Column(
              //             children: [
              //               Image.asset(
              //                 'assets/icons/redcart.png',
              //                 width: 30, // Adjust the width as needed
              //                 height: 30, // Adjust the height as needed
              //                 color: red1,
              //               ),
              //               Text(
              //                 'รถเข็น',
              //                 style: TextStyle(color: red1, fontSize: 14),
              //               )
              //             ],
              //           )
              //         : Column(
              //             children: [
              //               Image.asset(
              //                 'assets/icons/addtocart.png',
              //                 width: 30, // Adjust the width as needed
              //                 height: 30, // Adjust the height as needed
              //               ),
              //               Text(
              //                 'รถเข็น',
              //                 style: TextStyle(fontSize: 14),
              //               )
              //             ],
              //           )),
              // SizedBox(
              //   width: 1,
              // ),
              SizedBox(
                width: 100, // Adjust the width as needed
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    onItemSelect(4);
                  },
                  child: selectedIndex == 4
                      ? Column(
                          children: [
                            Image.asset(
                              'assets/icons/reduser.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                              color: red1,
                            ),
                            Text(
                              'บัญชี',
                              style: TextStyle(color: red1, fontSize: 14),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/icons/user.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            Text(
                              'บัญชี',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        )),
              SizedBox(
                width: 30, // Adjust the width as needed
                height: 30,
              ),
              // SizedBox(
              //   width: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
