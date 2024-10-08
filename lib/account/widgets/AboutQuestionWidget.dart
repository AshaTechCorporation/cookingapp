import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class AboutQuestionWidget extends StatelessWidget {
  const AboutQuestionWidget({super.key,required this.size,required this.title,required this.press});
  final Size size;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          height: size.height * 0.055,
          width: size.width * 0.45,
          decoration: BoxDecoration(
            color: red1,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0), 
              bottomRight: Radius.circular(10.0), 
              topLeft: Radius.circular(10.0), 
              bottomLeft: Radius.circular(10.0)),
          ),
          child: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14))),       
        ),
    );
  }
}