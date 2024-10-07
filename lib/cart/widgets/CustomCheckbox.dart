import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: size.width * 0.065,
        height: size.height * 0.03,
        decoration: BoxDecoration(
          color: value ? greymess : greymess, // สีพื้นหลัง
          borderRadius: BorderRadius.circular(6.0), // ขอบมน
          // border: Border.all(
          //   color: Colors.grey.shade400,
          //   width: 1.5,
          // ),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: size.height * 0.025,
                color: red1,
              )
            : null,
      ),
    );
  }
}
