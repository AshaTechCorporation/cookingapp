import 'dart:ffi';

import 'package:cookingapp/constants.dart';
import 'package:cookingapp/extension/ApiExeption.dart';
import 'package:cookingapp/home/detailFood/DetailFoodNew.dart';
import 'package:cookingapp/home/firstPage.dart';
import 'package:cookingapp/home/services/homeApi.dart';
import 'package:cookingapp/home/widgets/CardRestaurantWidget.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonFoodNewPage extends StatefulWidget {
  const PersonFoodNewPage({super.key});

  @override
  State<PersonFoodNewPage> createState() => _PersonFoodNewPageState();
}

class _PersonFoodNewPageState extends State<PersonFoodNewPage> {
  List<Menus> menus = [];
  double? lat;
  double? long;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLocation();
      Future.delayed(Duration(seconds: 1), () async {
        await getlistRestaurants(lat: lat!, long: long!);
      });
    });
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    // await getlistRestaurants(lat: position.latitude, long: position.longitude);
  }

  //ดึงข้อมูล api Restaurants
  Future<void> getlistRestaurants({required double lat, required double long}) async {
    try {
      LoadingDialog.open(context);
      final menus1 = await HomeApi.getManus(lat: lat, long: long);
      if (!mounted) return;

      setState(() {
        menus = menus1;
      });
      //inspect(categories);
      LoadingDialog.close(context);
    } on ClientException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    } on ApiException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

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
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: size.width * 0.25,
              height: size.height,
              padding: EdgeInsets.only(top: 24, right: 12, left: 12),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image.asset('assets/images/Newlogo.png'),
                  ),
                  Text(
                    'เข้าหน้าหลัก',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              await getlistRestaurants(lat: lat!, long: long!);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  itemManu[index]['imageAssetPath'],
                                  width: size.width * 0.25,
                                  height: size.width * 0.15,
                                ),
                                Text(
                                  itemManu[index]['name'],
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          itemCount: itemManu.length,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
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
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }
                    },
                    child: AnimatedContainer(
                      height: size.height * 0.05,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: red1,
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.slowMiddle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ออกจากระบบ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(1), topRight: Radius.circular(1)),
                  color: Color.fromARGB(255, 229, 230, 240),
                ),
                child: menus.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            menus.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailFoodNewPage(
                                                food: menus[index],
                                              )));
                                },
                                child: Container(
                                  height: size.height * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        menus[index].photo_url ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: size.height * 0.01,
                                      // ),
                                      // // Text('โปรโมชั่น'),
                                      // Text(
                                      //   menus[index].name ?? '',
                                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: red1),
                                      //   overflow: TextOverflow.ellipsis,
                                      // ),

                                      Column(
                                        children: [
                                          Container(
                                            // height: size.height * 0.03,
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Color.fromARGB(255, 241, 214, 132),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  menus[index].name ?? '',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: red1),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  '${menus[index].distance ?? ' - '}',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: red1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
            )
          ],
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
