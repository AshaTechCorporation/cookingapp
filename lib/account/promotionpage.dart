import 'package:flutter/material.dart';

class Promotionpage extends StatefulWidget {
  const Promotionpage({super.key});

  @override
  State<Promotionpage> createState() => _PromotionpageState();
}

class _PromotionpageState extends State<Promotionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บทความ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
      ),
      body: Container(
        color: Colors.grey[300],
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Promotion2page(),
                  //   ),
                  // );
                  },
                //   
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
