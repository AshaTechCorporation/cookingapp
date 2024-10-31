import 'package:cookingapp/constants.dart';
import 'package:cookingapp/track/allhistorypage.dart';
import 'package:cookingapp/track/palceanorderpage.dart';
import 'package:cookingapp/track/transportpage.dart';
import 'package:flutter/material.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (tabController == null) {
      return Scaffold(
        backgroundColor: background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
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
        title: Text(
          'ติดตามสถานะ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // toolbarHeight: size.height * 0.1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Column(
            children: [
              Container(
                width: size.width * 0.95,
                height: size.height * 0.04,
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(13), border: Border.all(color: greyuserinfo, width: 0.5)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ค้นหาเลข Order',
                          hintStyle: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: size.height * 0.018, left: size.width * 0.03),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: size.height * 0.037,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: red1,
                          ),
                          child: Center(
                            child: Text(
                              'ค้นหา',
                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: EdgeInsets.only(bottom: size.height * 0.01),
              //     child: Row(
              //       children: [
              //         buildTabItem(0, 'ฝากส่ง'),
              //         buildTabItem(1, 'ขนส่ง'),
              //         // Container(
              //         //   height: size.height * 0.03,
              //         //   width: size.width * 0.0015,
              //         //   color: greyuserinfo,
              //         // ),
              //         buildTabItem(2, 'ประวัติทั้งหมด'),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Palceanorderpage(),
          // Transporttrackpage(),
          // Allhistorypage(),
        ],
      ),
    );
  }

  Widget buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          tabController?.animateTo(index);
          //print(selectedIndex);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.008),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: greymess),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : headingtext,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
