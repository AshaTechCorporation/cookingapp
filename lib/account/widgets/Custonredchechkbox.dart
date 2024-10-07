import 'package:flutter/material.dart';

// Custonredchechkbox Widget
class Customredchechkbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onChanged;

  Customredchechkbox({super.key, 
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red, // สีขอบกรอบของ Checkbox
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(3.0), // ขอบโค้งมนของ Checkbox
        ),
        width: size.width * 0.055,
        height: size.height * 0.025,
        child: isSelected
            ? Icon(
                Icons.check,
                size: 20.0,
                color: Colors.red, // สีของเครื่องหมายถูก
              )
            : null,
      ),
    );
  }
}
