import 'package:cookingapp/constants.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: brown,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text('แสดงความคิดเห็น'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
              padding: EdgeInsets.all(16),
              width: size.width * 0.92,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'แสดงความคิดเห็น',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: size.height * 0.01),
                  FromRegister(
                    width: size.width * 0.8,
                    // controller: _confirmPasswordController,
                    hintText: 'หัวข้อ',
                  ),
                  SizedBox(height: size.height * 0.01),
                  FromRegister(
                    width: size.width * 0.8,
                    // controller: _confirmPasswordController,
                    hintText: 'รายละเอียด',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          width: size.width * 0.45,
          decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: TextButton(
              onPressed: () async {},
              child: Text(
                'ส่งความคิดเห็น',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
