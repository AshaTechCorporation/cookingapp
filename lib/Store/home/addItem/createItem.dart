import 'package:cookingapp/constants.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:flutter/material.dart';

class CreateItemPage extends StatefulWidget {
  const CreateItemPage({super.key});

  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                // controller: _nameController,
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(75, 158, 158, 158),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    width: size.width * 0.3,
                    height: size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(75, 158, 158, 158),
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
                        width: size.width * 0.4,
                        // controller: _nameController,
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
                      FromRegister(
                        width: size.width * 0.4,
                        // controller: _nameController,
                        hintText: 'สถานะ',
                      ),
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
                keyboardType: TextInputType.multiline,
                // controller: _nameController,
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
    );
  }
}
