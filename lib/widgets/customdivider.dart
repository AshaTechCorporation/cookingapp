import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double heightFactor; // ตัวคูณสำหรับความสูง
  final double widthFactor; // ตัวคูณสำหรับความกว้าง
  final Color color; // สีของ Divider

  const CustomDivider({
    super.key,
    this.heightFactor = 0.001,
    this.widthFactor = 0.95,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    // เข้าถึงขนาดหน้าจอ
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * heightFactor,
      width: size.width * widthFactor,
      color: color,
    );
  }
}
