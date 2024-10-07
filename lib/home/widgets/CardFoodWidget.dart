import 'package:flutter/material.dart';

class CardFoodWidget extends StatelessWidget {
  const CardFoodWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.88,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.amber,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.88,
            height: size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/explore.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Row(
              children: [
                Expanded(flex: 1,child: Text('ใส่โค้ด xxxx รับส่วนลดทันที', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Row(
              children: [
                Expanded(flex: 1,child: Text('เมนูอาหาร', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}