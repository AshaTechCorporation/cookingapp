import 'package:cookingapp/account/widgets/Custonredchechkbox.dart';

import 'package:cookingapp/constants.dart';
import 'package:cookingapp/widgets/customdivider.dart';
import 'package:flutter/material.dart';

class Topuppage extends StatefulWidget {
  const Topuppage({super.key});

  @override
  State<Topuppage> createState() => _TopuppageState();
}

class _TopuppageState extends State<Topuppage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ช่องทางการเติมเงิน',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: white,
            height: size.height * 0.06,
            child: Row(
              children: [
                SizedBox(width: size.width * 0.055),
                Image.asset(
                  'assets/icons/qrcode.png',
                  height: size.height * 0.028,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'QR พร้อมเพย์',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.58,
                ),
                Customredchechkbox(
                  isSelected: isChecked,
                  onChanged: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              color: white,
              height: size.height * 0.06,
              child: Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Image.asset(
                    'assets/icons/mobilebank.png',
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    'โอนเงินผ่านแอป Mobile Banking',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Image.asset('assets/icons/rightarrow.png'),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          CustomDivider(
            heightFactor: 0.0005,
            widthFactor: double.infinity,
          ),
          Spacer(),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.95,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: red1),
            child: Center(
                child: Text(
              'ยืนยันช่องทางการเติมเงิน',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
