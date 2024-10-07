import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Palceanorderpage extends StatelessWidget {
  const Palceanorderpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Row(
              children: [
                Text(
                  'รายการสถานะ :',
                  style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.001,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.015,
                  vertical: 0,
                ),
                itemCount: palceanorder.length,
                itemBuilder: (context, index) {
                  final order = palceanorder[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {}
                      if (index == 1) {}
                      if (index == 2) {}
                      if (index == 3) {}
                      if (index == 4) {}
                      if (index == 5) {}
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                      padding: EdgeInsets.all(size.height * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            order['images'],
                            height: size.height * 0.045,
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            order['title'],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            index < 4 ? 'ดำเนินการอยู่ ${order['process']} รายการ' : '${order['process']} รายการ',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
