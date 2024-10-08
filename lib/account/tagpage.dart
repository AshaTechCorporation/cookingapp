import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: size.height * 0.001,
          ),
        ),
        title: Text(
          'บทความ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(0, "TAG 1"),
                _buildTabItem(1, "TAG 2"),
                _buildTabItem(2, "TAG 3"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTagContent(size),
                _buildTagContent(size),
                _buildTagContent(size),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.07,
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/images/redstar.png'),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'ติดตามบทความใหม่ๆ ได้ที่นี่',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                // Image.asset('assets/images/redstar.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = _tabController.index == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.29,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.01),
        decoration: BoxDecoration(
            color: isSelected ? red1 : Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            //border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : greyuserinfo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTagContent(Size size) {
    return ListView(
      padding: EdgeInsets.all(size.height * 0.009),
      children: [
        _buildCard(
          size,
          // 'assets/images/tag1.png',
          'อาหารจานเด็ด',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          // 'assets/images/tag2.png',
          'รายการอาหารที่กำลังเป็นที่นิยมตอนนี้',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          // 'assets/images/tag3.png',
          'การสั่งอาหารผ่านแอพ กับข้าว ที่ทำให้การซื้ออาหารสะดวกรวดเร็ว',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          // 'assets/images/tag1.png',
          '3 สิ่งที่ควรรู้ก่อนเริ่มต้นใช้งานแอพกับข้าว',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          // 'assets/images/tag2.png',
          'รู้ไว้ก่อนอาหารที่มีความเสี่ยงต่อโรคอ้วน และ เบาหวาน',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          // 'assets/images/tag3.png',
          'รวมร้านอาหารใกล้ฉันที่น่าสนใจ',
          '24 กรกฎาคม 2567',
        ),
      ],
    );
  }

  Widget _buildCard(Size size,  String title, String date) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   flex: 3,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          //     child: Image.asset(
          //       imagePath,
          //       height: size.height * 0.11,
          //       width: size.height * 0.1,
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.012),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}