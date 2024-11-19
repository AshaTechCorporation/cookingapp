import 'package:cookingapp/Store/accountStore.dart/editAccount/editAccountStorePage.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/AccountNew/TopUpCash/topUpCashPage.dart';
import 'package:cookingapp/home/personFoodNew.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountStoreNewPage extends StatefulWidget {
  const AccountStoreNewPage({super.key});

  @override
  State<AccountStoreNewPage> createState() => _AccountStoreNewPageState();
}

class _AccountStoreNewPageState extends State<AccountStoreNewPage> {
  Future<void> clearToken() async {
    final _prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs = _prefs;
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.23,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(169, 245, 205, 152),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Container(
                  //         width: size.width * 0.1,
                  //         height: size.width * 0.1,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(15),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.black.withOpacity(0.2),
                  //               spreadRadius: 1,
                  //               blurRadius: 1,
                  //               offset: Offset(0, 2),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Center(
                  //           child: Icon(
                  //             Icons.arrow_back_ios_new,
                  //             color: brown,
                  //             size: 20,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'ร้านกับข้าว',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: CircleAvatar(
                      backgroundColor: red1,
                      radius: 50,
                      child: ClipOval(
                        child: Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 56, 56, 56),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset('assets/images/beardolls.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * (-40 / 800),
                    // bottom: -40,
                    left: 15,
                    child: Row(
                      children: [
                        Container(
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Balance',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    Text(
                                      '฿ 1,000',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TopUpCashPage();
                                    }));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: red2,
                                    radius: 35,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        // color: Color.fromARGB(255, 56, 56, 56),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                        'assets/images/next_svgrepo.png',
                                        // color: red1,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.065,
            ),
            // Container(
            //   height: size.height * 0.1,
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.2),
            //         spreadRadius: 1,
            //         blurRadius: 1,
            //         offset: Offset(0, 2),
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Expanded(
            //           flex: 10,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 'รายการที่ชอบ',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //               ),
            //               Text(
            //                 '1',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           flex: 3,
            //           child: CircleAvatar(
            //             backgroundColor: red2,
            //             radius: 35,
            //             child: Container(
            //               height: 50,
            //               width: 50,
            //               decoration: BoxDecoration(
            //                 // color: Color.fromARGB(255, 56, 56, 56),
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               child: Image.asset(
            //                 'assets/images/next_svgrepo.com (1).png',
            //                 // color: red1,
            //                 fit: BoxFit.fill,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.015,
            // ),
            // Container(
            //   height: size.height * 0.1,
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.2),
            //         spreadRadius: 1,
            //         blurRadius: 1,
            //         offset: Offset(0, 2),
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.02),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Expanded(
            //           flex: 10,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 'รีวิวร้านค้า',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           flex: 3,
            //           child: CircleAvatar(
            //             backgroundColor: red2,
            //             radius: 35,
            //             child: Container(
            //               height: 50,
            //               width: 50,
            //               decoration: BoxDecoration(
            //                 // color: Color.fromARGB(255, 56, 56, 56),
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               child: Image.asset(
            //                 'assets/images/next_svgrepo.com (2).png',
            //                 // color: red1,
            //                 fit: BoxFit.fill,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: size.height * 0.015,
            // ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Column(
                  children: List.generate(
                      setting.length,
                      (index) => Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                                leading: Image.asset(
                                  setting[index]['image'],
                                  //width: size.width * 0.04,
                                  height: size.height * 0.025,
                                  fit: BoxFit.fill,
                                  // color: Colors.grey,
                                ),
                                title: Text(
                                  setting[index]['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                ),
                                onTap: () async {
                                  print(index);
                                  if (index == 0) {
                                  } else if (index == 1) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TopUpCashPage();
                                    }));
                                  } else if (index == 2) {
                                  } else if (index == 3) {
                                  } else if (index == 4) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return EditAccountStorePage();
                                    }));
                                  } else {
                                    final out = await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text('แจ้งเตือน'),
                                              content: Text('ยืนยันที่จะออกจากระบบ'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, false);
                                                  },
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, true);
                                                  },
                                                  child: Text('ตกลง'),
                                                ),
                                              ],
                                            ));
                                    if (out == true) {
                                      LoadingDialog.open(context);
                                      await LoginService.logout();
                                      await clearToken();
                                      LoadingDialog.close(context);
                                      Navigator.of(context, rootNavigator: true).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => PersonFoodNewPage(),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              Divider(),
                            ],
                          )),
                )),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> setting = [
    {
      "image": 'assets/icons/Frame 1098.png',
      "title": 'สถานที่ของคุณ',
    },
    {
      "image": 'assets/icons/Frame 1098 (1).png',
      "title": 'วิธีการชำระเงิน',
    },
    {
      "image": 'assets/icons/Frame 1098 (2).png',
      "title": 'ช่วยเหลือ',
    },
    {
      "image": 'assets/icons/Frame 1098 (3).png',
      "title": 'ความคิดเห็น',
    },
    {
      "image": 'assets/icons/Frame 1098 (4).png',
      "title": 'ตั้งค่า',
    },
    {
      "image": 'assets/images/Vector-2.png',
      "title": 'ออกจากระบบ',
    },
  ];
}
