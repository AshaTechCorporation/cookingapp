import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class ProblemCardPage extends StatefulWidget {
  // final String imagePath; // รับข้อมูลผ่าน constructor
  final String title;
  final List<String> options;

  const ProblemCardPage({
    Key? key,
    // required this.imagePath,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  _ProblemCardPageState createState() => _ProblemCardPageState();
}

class _ProblemCardPageState extends State<ProblemCardPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ReportFormPage(
        //       problemTypeId:
        //           problem[index].id, // ใช้ `id` ของ `problem` ที่เลือก
        //     ),
        //   ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: pinkmess, // คุณสามารถใช้สี youngpink ตามที่คุณต้องการ
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   widget.imagePath, // ใช้ข้อมูลจาก widget
                  //   width: 24,
                  //   height: 24,
                  // ),
                  const SizedBox(width: 8),
                  Text(
                    widget.title, // ใช้ข้อมูลจาก widget
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Container สำหรับ options
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '• $option',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
