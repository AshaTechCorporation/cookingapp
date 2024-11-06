import 'dart:io';

import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TopUpCashPage extends StatefulWidget {
  const TopUpCashPage({super.key});

  @override
  State<TopUpCashPage> createState() => _TopUpCashPageState();
}

class _TopUpCashPageState extends State<TopUpCashPage> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  String? imageSelect;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'เติมเงิน',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'ดำเนินการชำระเงิน',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.75,
              height: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: red1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/PromptPay2.png',
                    scale: 2,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/icons/qr_code_barcode.jpg',
                      height: size.height * 0.232,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download),
                Text('ดาวน์โหลด QR code'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: red1),
              ),
              child: image != null
                  ? Stack(
                      children: [
                        Center(
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: size.width * 0.85,
                            height: size.height * 0.25,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              final img = await picker.pickImage(source: ImageSource.gallery);
                              setState(() {
                                image = img;
                              });
                            },
                            child: Container(
                              width: size.width * 0.1,
                              height: size.width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () async {
                        final img = await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          image = img;
                        });
                      },
                      child: Center(
                        child: Container(
                          width: size.width * 0.3,
                          height: size.width * 0.3,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(134, 244, 208, 150),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 50,
                            color: red1,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: size.height * 0.073,
          decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextButton(
              onPressed: () async {},
              child: Text(
                'ดำเนินการ',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
