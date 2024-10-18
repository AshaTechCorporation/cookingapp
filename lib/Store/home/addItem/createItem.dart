import 'dart:io';

import 'package:cookingapp/constants.dart';
import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateItemPage extends StatefulWidget {
  CreateItemPage({super.key, this.foods});
  Food? foods;

  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  final TextEditingController nameFood = TextEditingController();
  final TextEditingController priceFood = TextEditingController();
  final TextEditingController remark = TextEditingController();

  bool status = false;

  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
    nameFood.text = widget.foods?.name ?? '';
    priceFood.text = widget.foods?.cal.toString() ?? '0.0';
    status = widget.foods?.isLiked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/backG.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'เพิ่มรายการอาหาร',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: red1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'รายการอาหาร',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: nameFood,
                  hintText: 'รายการอาหาร',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'รูปภาพ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: image != null
                        ? Stack(
                            children: [
                              Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                                width: size.width * 0.9,
                                height: size.height * 0.3,
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
                        : widget.foods?.image != null
                            ? Stack(
                                children: [
                                  Image.asset(
                                    widget.foods!.image,
                                    fit: BoxFit.cover,
                                    width: size.width * 0.9,
                                    height: size.height * 0.3,
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
                              )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ราคา',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        FromRegister(
                          width: size.width * 0.45,
                          controller: priceFood,
                          hintText: 'ราคา',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'สถานะ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Container(
                          width: size.width * 0.45,
                          height: size.height * 0.065,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: background,
                            border: Border.all(
                              color: status == true ? red1 : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Transform.scale(
                                scale: 1.1,
                                child: Switch(
                                  activeColor: red1,
                                  value: status,
                                  onChanged: (value) {
                                    setState(() {
                                      status = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                status == true ? 'พร้อมขาย' : 'ไม่พร้อมขาย',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'รายละเอียด',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FromRegister(
                  width: size.width * 0.9,
                  keyboardType: TextInputType.text,
                  controller: remark,
                  hintText: 'รายละเอียด',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: size.height * 0.073,
            decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextButton(
                onPressed: () async {},
                child: Text(
                  'เพิ่มรายการ',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
