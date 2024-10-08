import 'package:cookingapp/account/ReportFormPage.dart';
import 'package:cookingapp/account/accsettsing.dart';
import 'package:cookingapp/account/contactus.dart';
import 'package:cookingapp/account/guidepage.dart';
import 'package:cookingapp/account/itemfav.dart';
import 'package:cookingapp/account/messagepage.dart';
import 'package:cookingapp/account/reportpage.dart';
import 'package:cookingapp/account/tagpage.dart';
import 'package:cookingapp/account/transactionshistory.dart';
import 'package:cookingapp/account/widgets/topupwidget.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class MenuItem {
  final String imagePath;
  final String text;

  MenuItem({required this.imagePath, required this.text});
}

class _AccountPageState extends State<AccountPage> {
  bool isGuangzhouSelected = true;
  @override
  Widget build(BuildContext context) {
    final selectedInfo = isGuangzhouSelected ? guangzhouInfo : yiwuInfo;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFcd8032),
                    Color(0xFFecc49d),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'A123456',
                              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Name Surname',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: size.width * 0.45,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color1, color2],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              stops: [0.3, 0.7],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'สมาชิกทั่วไป',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              SizedBox(width: size.width * 0.04),
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 20,
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Point ',
                              style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '150 คะแนน ',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.2),
                              child: Text(
                                ' ',
                                style: TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'คงเหลือ 1025 บาท',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: List.generate(
                    //       fistpagewidget.length,
                    //       (index) => Topupwidget(
                    //           size: size,
                    //           title: topup[index],
                    //           press: () {
                    //             if (index == 0) {}
                    //             if (index == 1) {}
                    //           })),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                tiles: menuItems.map((item) {
                  int index = menuItems.indexOf(item);
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 0),
                    leading: Image.asset(
                      item.imagePath,
                      //width: size.width * 0.04,
                      height: size.height * 0.04,
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      item.text,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Itemfav()));
                      }
                      if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Transactionhistorypage()));
                      }
                      if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TagsPage()));
                      }
                      if (index == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Guidepage()));
                      }
                      if (index == 4) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblemPage()));
                      }
                      if (index == 5) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));
                      }
                      if (index == 6) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Contactus()));
                      }
                      if (index == 7) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Accsetting(
                                      title: item.text,
                                    )));
                      }
                      if (index == 8) {
                        Navigator.of(context, rootNavigator: true).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                  );
                }).toList(),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
