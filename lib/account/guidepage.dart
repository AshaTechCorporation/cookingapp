import 'dart:ui';

import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  _GuidepageState createState() => _GuidepageState();
}

class _GuidepageState extends State<Guidepage> {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('คู่มือการใช้งาน',style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
        ),),
        backgroundColor: background,
      ),
      body: ListView.builder(
        itemCount: guidelist.length,
        itemBuilder: (context, index) {
          final item = guidelist[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.01,
            ),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   flex: 3,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.horizontal(
                  //       left: Radius.circular(10),
                  //     ),
                  //     child: Image.asset(
                  //       item['image'],
                  //       height: size.height * 0.11,
                  //       width: size.height * 0.1,
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.012,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (item['subtitle'].isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                item['subtitle'],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
}