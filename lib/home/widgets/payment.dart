import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key, required this.size,required this.imagespath,required this.press});

  final Size size;
  final String imagespath;
  final VoidCallback press;
  

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.103,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0), topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: AspectRatio(
                aspectRatio: 5,
                child: Container(
                  height: 50,
                  child: Image.asset(
                    widget.imagespath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}