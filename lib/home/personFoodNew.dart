import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/extension/ApiExeption.dart';
import 'package:cookingapp/home/detailFood/DetailFoodNew.dart';
import 'package:cookingapp/home/firstPage.dart';
import 'package:cookingapp/home/services/homeApi.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class PersonFoodNewPage extends StatefulWidget {
  const PersonFoodNewPage({super.key});

  @override
  State<PersonFoodNewPage> createState() => _PersonFoodNewPageState();
}

class _PersonFoodNewPageState extends State<PersonFoodNewPage> {
  List<Menus> menus = [];
  double? lat;
  double? long;
  String? token;
  bool slide = true;
  List<File> files = [];
  List<Widget> widgets = [];
  final List<VideoPlayerController> listvideo = [];
  // late VideoPlayerController _controllervideo;
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollControllerTab = ScrollController();

  double appBarOpacity = 0.1;
  double appBarOpacityTab = 0.2;

  Future<File> createFileFromAsset(String asset) async {
    ByteData data = await rootBundle.load(asset);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final fileName = asset.split('/').last;
    File tempFile = File('$tempPath/$fileName');
    await tempFile.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    return tempFile;
  }

  @override
  void initState() {
    super.initState();
    _init();
    loadToken();
    loadAbility();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLocation();
      Future.delayed(Duration(seconds: 1), () async {
        await getlistRestaurants(lat: lat!, long: long!);

        // for (var file in files) {
        //   _controllervideo = VideoPlayerController.file(file)
        //     ..initialize().then((_) {
        //       setState(() {});
        //     });
        //   _controllervideo
        //     ..setLooping(true)
        //     ..setVolume(0)
        //     ..play();
        // }
      });
    });

    // for (var i = 0; i < banners.length; i++) {
    //   _controllervideo = VideoPlayerController.asset(
    //     banners[i],
    //   )..initialize().then((_) => setState(() {}));
    //   _controllervideo.addListener(() {
    //     setState(() {});
    //   });
    //   _controllervideo.setLooping(true);
    //   // _controllervideo.initialize().then((_) => setState(() {}));
    //   _controllervideo.seekTo(Duration.zero);
    //   _controllervideo.setVolume(0);
    //   _controllervideo.play();
    //   listvideo.add(_controllervideo);
    // }
    // _initializeVideoControllers();

    // เพิ่ม Listener เพื่อตรวจจับการเลื่อน
    scrollController.addListener(() {
      double offset = scrollController.offset;
      double newOpacity = (offset / 150).clamp(0.0, 1.0);

      // if (newOpacity != appBarOpacity) {
      print(offset);
      setState(() {
        appBarOpacity = offset;
      });
      // }
    });
    scrollControllerTab.addListener(() {
      double offset = scrollControllerTab.offset;
      print(offset);
      setState(() {
        appBarOpacityTab = offset;
      });
    });
  }

  void _initializeVideoControllers() {
    for (var url in banners) {
      final controller = VideoPlayerController.asset(url)
        ..initialize().then((_) {
          setState(() {}); // เพื่อรีเฟรชหน้าจอเมื่อ video โหลดเสร็จ
        });
      controller
        ..setLooping(true)
        ..setVolume(0)
        ..play();
      listvideo.add(controller);
    }
  }

  _init() async {
    var fs = await Future.wait(
      [
        createFileFromAsset('assets/images/v1.mp4'),
        createFileFromAsset('assets/images/v2.mp4'),
        createFileFromAsset('assets/images/v3.mp4'),
      ],
    );

    files.addAll(fs);

    for (var i = 0; i < files.length; i++) {
      widgets.add(VideoScreen(
        files[i],
      ));
    }

    setState(() {});
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token2 = prefs.getString('token');
    setState(() {
      token = token2;
    });
  }

  Future<void> loadAbility() async {
    final prefs = await SharedPreferences.getInstance();
    final ability = prefs.getBool('ability');
    setState(() {
      slide = ability ?? true;
    });
  }

  List<String> banners = [
    'assets/images/v1.mp4',
    'assets/images/v2.mp4',
    'assets/images/v3.mp4',
  ];

  @override
  void dispose() {
    // for (var controller in listvideo) {
    //   controller.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(microseconds: 1),
            // child: files.isEmpty
            //     ? Image.asset(
            //         'assets/images/Screenshot 2567-11-05 at 16.32.13.png',
            //         fit: BoxFit.cover,
            //       )
            //     : VideoCarousel(
            //         files: files,
            //         height: size.height,
            //       ),
            child: files.isEmpty
                ? SizedBox.shrink()
                : CarouselSlider(
                    // itemCount: banners.length,
                    // itemBuilder: (context, index, realIndex) {
                    //   List<Widget> widgets = [];
                    //   for (var i = 0; i < files.length; i++) {
                    //     widgets.add(VideoScreen(
                    //       files[i],
                    //     ));
                    //   }
                    //   return VideoPlayer(
                    //     _controllervideo,
                    //   );
                    //   // return Image.asset(
                    //   //   banners[index],
                    //   //   fit: BoxFit.cover,
                    //   // );
                    // },
                    items: widgets,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.vertical,
                        height: size.height,
                        autoPlay: true,
                        autoPlayInterval: Duration(
                          seconds: 8,
                        )),
                  ),
          ),
          Container(
            color: Color.fromARGB(133, 0, 0, 0),
            child: Row(
              children: [
                slide == true
                    ? SizedBox.shrink()
                    : Container(
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
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Switch(
                              value: slide,
                              onChanged: (v) async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setBool('ability', v);
                                setState(() {
                                  slide = v;
                                });
                              },
                              activeColor: red1,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            appBarOpacityTab <= 0.0 ? SizedBox(height: size.height * 0.25) : SizedBox(height: size.height * 0.05),
                            Expanded(
                              flex: 4,
                              child: ListView(
                                controller: scrollControllerTab,
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
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: red1,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: red1),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset(
                                                itemManu[index]['imageAssetPath'],
                                                width: size.width * 0.25,
                                                height: size.width * 0.13,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            itemManu[index]['name'],
                                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white),
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
                                if (token == null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return LoginPage();
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
                              child: AnimatedContainer(
                                height: size.height * 0.05,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: token == null ? Colors.green : red1,
                                ),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.slowMiddle,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      token == null ? 'เข้าสู่ระบบ' : 'ออกจากระบบ',
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
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                Expanded(
                  child: Stack(
                    children: [
                      // AnimatedPositioned(
                      //   duration: Duration(microseconds: 1),
                      //   // child: files.isEmpty
                      //   //     ? Image.asset(
                      //   //         'assets/images/Screenshot 2567-11-05 at 16.32.13.png',
                      //   //         fit: BoxFit.cover,
                      //   //       )
                      //   //     : VideoCarousel(
                      //   //         files: files,
                      //   //         height: size.height,
                      //   //       ),
                      //   child: files.isEmpty
                      //       ? SizedBox.shrink()
                      //       : CarouselSlider(
                      //           // itemCount: banners.length,
                      //           // itemBuilder: (context, index, realIndex) {
                      //           //   List<Widget> widgets = [];
                      //           //   for (var i = 0; i < files.length; i++) {
                      //           //     widgets.add(VideoScreen(
                      //           //       files[i],
                      //           //     ));
                      //           //   }
                      //           //   return VideoPlayer(
                      //           //     _controllervideo,
                      //           //   );
                      //           //   // return Image.asset(
                      //           //   //   banners[index],
                      //           //   //   fit: BoxFit.cover,
                      //           //   // );
                      //           // },
                      //           items: widgets,
                      //           options: CarouselOptions(
                      //               viewportFraction: 1,
                      //               enlargeCenterPage: true,
                      //               scrollDirection: Axis.vertical,
                      //               height: size.height,
                      //               autoPlay: true,
                      //               autoPlayInterval: Duration(
                      //                 seconds: 8,
                      //               )),
                      //         ),
                      // ),

                      Container(
                        // color: Color.fromARGB(133, 0, 0, 0),
                        child: CustomScrollView(
                          controller: scrollController,
                          slivers: [
                            // เพิ่มช่องว่างที่ด้านบน
                            SliverPadding(
                              padding: appBarOpacity <= 0.0 ? EdgeInsets.only(top: 300) : EdgeInsets.only(top: 0), // กำหนดความสูงของช่องว่าง
                            ),

                            // สร้างรายการ
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
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
                                          border: Border.all(color: red1),
                                          image: DecorationImage(
                                            // colorFilter: ColorFilter.mode(Colors.black.withAlpha(100), BlendMode.dstOut),
                                            colorFilter: ColorFilter.matrix(<double>[
                                              1, 0, 0, 0, 0, // Red
                                              0, 1, 0, 0, 0, // Green
                                              0, 0, 1, 0, 0, // Blue
                                              2, 0, 0, 0, 0, // Alpha
                                            ]),
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              menus[index].photo_url ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: slide == false ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // height: size.height * 0.03,
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color.fromARGB(217, 241, 214, 132),
                                                  ),
                                                  child: Column(
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
                                  );
                                },
                                childCount: menus.length, // จำนวนไอเทมในลิสต์
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(1), topRight: Radius.circular(1)),
                      //     // color: Color.fromARGB(255, 229, 230, 240),
                      //     color: Colors.transparent,
                      //   ),
                      //   child: menus.isNotEmpty
                      //       ? SingleChildScrollView(
                      //           child: Column(
                      //             children: List.generate(
                      //               menus.length,
                      //               (index) => Padding(
                      //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 15),
                      //                 child: GestureDetector(
                      //                   onTap: () {
                      //                     Navigator.push(
                      //                         context,
                      //                         MaterialPageRoute(
                      //                             builder: (context) => DetailFoodNewPage(
                      //                                   food: menus[index],
                      //                                 )));
                      //                   },
                      //                   child: Container(
                      //                     height: size.height * 0.2,
                      //                     width: double.infinity,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius: BorderRadius.circular(10),
                      //                       image: DecorationImage(
                      //                         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstOut),
                      //                         fit: BoxFit.fill,
                      //                         image: NetworkImage(
                      //                           menus[index].photo_url ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     child: Column(
                      //                       mainAxisAlignment: MainAxisAlignment.end,
                      //                       crossAxisAlignment: slide == false ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      //                       children: [
                      //                         Column(
                      //                           children: [
                      //                             Container(
                      //                               // height: size.height * 0.03,
                      //                               padding: EdgeInsets.all(2),
                      //                               decoration: BoxDecoration(
                      //                                 borderRadius: BorderRadius.circular(5),
                      //                                 color: Color.fromARGB(217, 241, 214, 132),
                      //                               ),
                      //                               child: Column(
                      //                                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     menus[index].name ?? '',
                      //                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: red1),
                      //                                     overflow: TextOverflow.ellipsis,
                      //                                   ),
                      //                                   Text(
                      //                                     '${menus[index].distance ?? ' - '}',
                      //                                     style: TextStyle(fontWeight: FontWeight.bold, color: red1),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       : SizedBox(),
                      // ),
                    ],
                  ),
                ),
                slide == false
                    ? SizedBox.shrink()
                    : Container(
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
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Switch(
                              value: slide,
                              onChanged: (v) async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setBool('ability', v);
                                setState(() {
                                  slide = v;
                                });
                              },
                              activeColor: red1,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            appBarOpacityTab <= 0.0 ? SizedBox(height: size.height * 0.25) : SizedBox(height: size.height * 0.05),
                            Expanded(
                              flex: 4,
                              child: ListView(
                                controller: scrollControllerTab,
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
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: red1,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: red1),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset(
                                                itemManu[index]['imageAssetPath'],
                                                width: size.width * 0.25,
                                                height: size.width * 0.13,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            itemManu[index]['name'],
                                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white),
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
                                if (token == null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return LoginPage();
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
                              child: AnimatedContainer(
                                height: size.height * 0.05,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: token == null ? Colors.green : red1,
                                ),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.slowMiddle,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      token == null ? 'เข้าสู่ระบบ' : 'ออกจากระบบ',
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
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
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

class VideoScreen extends StatefulWidget {
  final File file;
  final bool run;
  final Function(File file)? onTap;

  const VideoScreen(
    this.file, {
    super.key,
    this.run = false,
    this.onTap,
  });

  @override
  State<VideoScreen> createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setLooping(true)
          ..setVolume(0)
          ..seekTo(Duration.zero)
          ..play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized ? VideoPlayer(_controller) : Container();
  }

  Future stop() async {
    if (mounted) await _controller.pause();
  }

  @override
  void dispose() async {
    super.dispose();
    await stop();
    await _controller.dispose();
  }
}
