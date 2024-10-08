import 'package:cookingapp/account/promotionpage.dart';
import 'package:cookingapp/account/widgets/AboutQuestionWidget.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'ช่วยเหลือ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.002,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: isExpanded ? 0 : 240,
              width: size.width,
              color: background,
              child: Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => Promotionpage(),
                  //       ),
                  //     );
                  //   },
                  //   // child: PictureSliderWidget(size: size),
                  // ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      aboutQuestion.length,
                      (index) => AboutQuestionWidget(
                        size: size,
                        title: aboutQuestion[index],
                        press: () {
                          if (index == 0) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Question(),
                            //   ),
                            // );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                height: isExpanded ? size.height - kToolbarHeight - MediaQuery.of(context).padding.top - 20 : 500,
                width: size.width * 0.99,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.015),
                            child: Text(
                              'ข้อความ',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'SukhumvitSet'),
                            ),
                          ),
                          if (isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.all(size.height * 0.01), margin: EdgeInsets.all(size.height * 0.01), child: Image.asset('assets/icons/redcart.png')),
                            ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(
                          //   'assets/icons/Frame 61.png',
                          //   width: 30,
                          //   height: 30,
                          // ),
                          SizedBox(width: size.width * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pinkmess,
                                ),
                                width: size.width * 0.55,
                                height: size.height * 0.07,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 7, top: 8),
                                    child: Text(
                                      'สวัสดีครับร้านสมหญิง ยินดีให้บริการครับ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pinkmess,
                                ),
                                width: size.width * 0.66,
                                height: size.height * 0.08,
                                child: Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.02, right: size.width * 0.02),
                                  child: Text(
                                    'ท่านสามารถเลือกคำถามจากปุ่มตัวเลือก หรือพิมพ์คำถามในช่องแชทได้เลยครับ',
                                    style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.085,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              height: size.height * 0.07,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'การสั่งอาหารมีจำนวนขั้นต่ำใหม',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: size.height * 0.01),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              // height: size.height * 0.0,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                  bottom: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'เมื่อทำอาหารเสร็จเรียบร้อยแล้ว เราสามารถไปรับช้ากว่ากำหนด สัก 30 นาทีได้ใหมครับ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: size.height * 0.01),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              height: size.height * 0.07,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'ค่าอาหารเป็นราคาที่ รวมค่าบริการด้วยเรียบร้อยแล้วใช่ใหมครับ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Image.asset(
            //     'assets/icons/plus.png',
            //     width: size.width * 0.08,
            //     height: size.height * 0.08,
            //     fit: BoxFit.fill,
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'พิมข้อความเพื่อพูดคุย',
                      hintStyle: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Image.asset(
            //     'assets/icons/vecterup.png',
            //     width: size.width * 0.08,
            //     height: size.height * 0.08,
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
