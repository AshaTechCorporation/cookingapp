import 'package:flutter/material.dart';

class Importwidget extends StatelessWidget {
  const Importwidget({
    super.key,
    required this.size,
    required this.title,
    required this.imagePath,
    required this.id, // เพิ่มตัวแปร id เพื่อใช้ในการตรวจสอบเงื่อนไข
  });

  final Size size;
  final String title;
  final String imagePath;
  final int id; // เพิ่มตัวแปร id

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(size.height * 0.007),
              child: Image.asset(
                imagePath,
                height: id == 2 ? size.height * 0.07 : size.height * 0.05, // ปรับขนาดตาม id
                width: id == 2 ? size.width * 0.15 : size.width * 0.07, // ปรับขนาดตาม id
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

