import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class OurServicesWidget extends StatelessWidget {
  final Size size;
  final String title;
  final VoidCallback press;
  final String imagespath;

  OurServicesWidget({
    super.key,
    required this.size,
    required this.title,
    required this.press,
    required this.imagespath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.066,
              width: size.width * 0.19,
              decoration: BoxDecoration(
                color: pinkser,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      imagespath,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
