import 'package:cookingapp/constants.dart';
import 'package:cookingapp/track/widgets/CardWarehouseWidget.dart';
import 'package:cookingapp/widgets/customdivider.dart';
import 'package:flutter/material.dart';

class Allhistorypage extends StatelessWidget {
  const Allhistorypage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWarehouseWidget(
              size: size,
              status: 1, // Status 1
              carback: 'assets/icons/carback.png',
              orderNo: 'Order no. A423456',
              iconPosition1: 'assets/icons/home_icon.png',
              iconPosition2: 'assets/icons/icon_grayb1.png',
              iconPosition3: 'assets/icons/icon_grayb2.png',
              iconPosition4: 'assets/icons/icon_grayb3.png',
              iconPosition5: 'assets/icons/correctgrey.png',
              press: () {
                print('Pressed status 1');
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CardWarehouseWidget(
              size: size,
              status: 2, // Status 2
              carback: 'assets/icons/carback.png',
              orderNo: 'Order no. A423457',
              iconPosition1: 'assets/icons/home_icon.png',
              iconPosition2: 'assets/icons/icon_red2.png',
              iconPosition3: 'assets/icons/icon_grayb2.png',
              iconPosition4: 'assets/icons/icon_grayb3.png',
              iconPosition5: 'assets/icons/correctgrey.png',
              press: () {
                print('Pressed status 2');
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CardWarehouseWidget(
              size: size,
              status: 3, // Status 3
              carback: 'assets/icons/carback.png',
              orderNo: 'Order no. A423458',
              iconPosition1: 'assets/icons/home_icon.png',
              iconPosition2: 'assets/icons/icon_red2.png',
              iconPosition3: 'assets/icons/icon_red3.png',
              iconPosition4: 'assets/icons/icon_grayb3.png',
              iconPosition5: 'assets/icons/correctgrey.png',
              press: () {
                print('Pressed status 3');
              },
            ),
            CardWarehouseWidget(
              size: size,
              status: 4, // Status 4
              carback: 'assets/icons/carback.png',
              orderNo: 'Order no. A423459',
              iconPosition1: 'assets/icons/home_icon.png',
              iconPosition2: 'assets/icons/icon_red2.png',
              iconPosition3: 'assets/icons/icon_red3.png',
              iconPosition4: 'assets/icons/icon_red4.png',
              iconPosition5: 'assets/icons/correctgrey.png',
              press: () {
                print('Pressed status 4');
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CardWarehouseWidget(
              size: size,
              status: 5, // Status 5
              carback: 'assets/icons/carback.png',
              orderNo: 'Order no. A423460',
              iconPosition1: 'assets/icons/home_icon.png',
              iconPosition2: 'assets/icons/icon_red2.png',
              iconPosition3: 'assets/icons/icon_red3.png',
              iconPosition4: 'assets/icons/icon_red4.png',
              iconPosition5: 'assets/icons/delivery.png',
              press: () {
                print('Pressed status 5');
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomDivider(),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
