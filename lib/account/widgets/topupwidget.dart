import 'package:flutter/material.dart';

class Topupwidget extends StatefulWidget {
  const Topupwidget({super.key, required this.size, required this.title, required this.press});

  final Size size;
  final String title;
  final VoidCallback press;

  @override
  State<Topupwidget> createState() => _TopupwidgetState();
}

class _TopupwidgetState extends State<Topupwidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        height: size.height * 0.054,
        width: size.width * 0.43,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8e4b09), fontSize: 15),
          ),
        ),
      ),
    );
  }
}
