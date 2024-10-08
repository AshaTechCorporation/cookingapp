import 'dart:io';

import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class ReportFormPage extends StatefulWidget {

  const ReportFormPage({super.key, });

  @override
  _ReportFormPageState createState() => _ReportFormPageState();
}

class _ReportFormPageState extends State<ReportFormPage> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedIssue;
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  File? _image;

 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'แบบฟอร์มแจ้งปัญหา',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        // DropdownButtonFormField<int>(
                        //   dropdownColor: Colors.white,
                        //   icon: Icon(Icons.keyboard_arrow_down),
                        //   decoration: InputDecoration(
                        //     isDense: true,
                        //     contentPadding: EdgeInsets.symmetric(
                        //         vertical: 8.0, horizontal: 12.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //   ),
                        //   hint: Text(
                        //     'เลือกปัญหาที่พบในด้านนี้',
                        //     style: TextStyle(fontSize: 14),
                        //   ),
                        //   value: _selectedIssue,
                        //   onChanged: (int? newValue) {
                        //     setState(() {
                        //       _selectedIssue = newValue;
                        //     });
                        //   },
                        //   // ใช้ problem_bodies จาก widget.problemType
                        //   items: widget.problemData.problem_bodies!
                        //       .map<DropdownMenuItem<int>>(
                        //     (Problembodies problemBody) {
                        //       return DropdownMenuItem<int>(
                        //         value: problemBody.id, // ใช้ `id` เป็นค่า value
                        //         child: Text(
                        //           problemBody
                        //               .body, // แสดง `body` เป็นข้อความใน Dropdown
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //       );
                        //     },
                        //   ).toList(),
                        // ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            hintText: '... กรอกหัวข้อเรื่อง',
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกหัวข้อเรื่อง';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: _detailsController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '... กรอกรายละเอียด',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกรายละเอียด';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'รูปภาพประกอบ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            ElevatedButton(
                              onPressed:
                                 (){

                                 }, // เรียกฟังก์ชันอัปโหลดรูปภาพ
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                'อัพโหลดไฟล์รูป',
                                style: TextStyle(color: greyuserinfo),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        if (_image != null)
                          Image.file(
                            _image!,
                            height: size.height * 0.3,
                          ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _submitProblem();
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: red1,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: size.width * 0.05,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'แจ้งปัญหา',
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}