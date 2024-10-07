import 'package:flutter/material.dart';

class CardRestaurantWidget extends StatelessWidget {
  CardRestaurantWidget({
    super.key,
    required this.size,
    required this.press,
    required this.image,
    required this.name,
    required this.address
  });

  final Size size;
  VoidCallback press;
  final String image;
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: size.height * 0.30,
          width: size.width * 0.41,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.amber
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.15,
                width: size.width * 0.41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("$image"),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('โปรโมชั่น'),
              Text(
                '$name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '$address',
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 241, 214, 132),
                    ),
                    child: Center(child: Text('ร้านใช้โค้ดได้')),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 241, 214, 132),
                    ),
                    child: Center(child: Text('ลด 30%')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}