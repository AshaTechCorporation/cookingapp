// import 'package:cookingapp/constants.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// class Addnewaddresspage extends StatefulWidget {
//   const Addnewaddresspage({super.key});

//   @override
//   State<Addnewaddresspage> createState() => _AddnewaddresspageState();
// }

// class _AddnewaddresspageState extends State<Addnewaddresspage> {
//   final TextEditingController _addressnameController = TextEditingController();
//   final TextEditingController _addresstelController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _subtelController = TextEditingController();

//   final List<String> newaddressprovice = [
//     '5',
//     '6',
//   ];
//   final List<String> newaddressdistrict = [
//     '2',
//     '4',
//   ];
//   final List<String> newaddresssubdistrict = [
//     '7',
//     '9',
//   ];
//   final List<String> newaddresszipcode = [
//     '8',
//     '6',
//   ];

//   String? selectednewaddressprovice;

//   String? selectednewaddressdistrict;

//   String? selectednewaddresssubdistrict;

//   String? selectednewaddresszipcode;

//   int _selectedLoacation = 0;
//   int _selectedtime = 0;
//   bool _isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: background,
//       appBar: AppBar(
//         backgroundColor: background,
//         title: Text(
//           'เพิ่มที่อยู่',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(4.0),
//           child: Container(
//             color: Colors.grey,
//             height: 1.0,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: background,
//           child: Column(
//             children: [
//               Container(
//                 color: background,
//                 height: size.height * 0.055,
//                 width: double.infinity,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: size.width * 0.03, top: size.height * 0.02),
//                   child: Text(
//                     'ข้อมูลทางติดต่อ',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.05,
//                 color: white,
//                 child: TextField(
//                   controller: _addressnameController,
//                   decoration: InputDecoration(
//                     hintText: 'ชื่อ นามสกุล',
//                     hintStyle: TextStyle(
//                       fontSize: 13,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.03),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 height: size.height * 0.05,
//                 color: white,
//                 child: TextField(
//                   controller: _addresstelController,
//                   decoration: InputDecoration(
//                     hintText: 'หมายเลขโทรศัพท์',
//                     hintStyle: TextStyle(
//                       fontSize: 13,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.03),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 height: size.height * 0.05,
//                 color: white,
//                 child: TextField(
//                   controller: _subtelController,
//                   decoration: InputDecoration(
//                     hintText: 'หมายเลขโทรศัพท์สำรอง(ถ้ามี)',
//                     hintStyle: TextStyle(
//                       fontSize: 13,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.03),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               Container(
//                 color: background,
//                 height: size.height * 0.07,
//                 width: double.infinity,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: size.width * 0.03, top: size.height * 0.02),
//                   child: Row(
//                     children: [
//                       Text(
//                         'ที่อยู่',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 color: white,
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton2<String>(
//                     isExpanded: true,
//                     hint: Text(
//                       'จังหวัด',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).hintColor,
//                       ),
//                     ),
//                     items: newaddressprovice
//                         .map((String item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                     value: selectednewaddressprovice,
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectednewaddressprovice = value;
//                       });
//                     },
//                     buttonStyleData: ButtonStyleData(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.035),
//                       height: size.height * 0.045,
//                       width: size.width * 0.02,
//                     ),
//                     menuItemStyleData: MenuItemStyleData(
//                       height: size.height * 0.02,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 width: double.infinity,
//                 color: white,
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton2<String>(
//                     isExpanded: true,
//                     hint: Text(
//                       'เขต/อำเภอ',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).hintColor,
//                       ),
//                     ),
//                     items: newaddressdistrict
//                         .map((String item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                     value: selectednewaddressdistrict,
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectednewaddressdistrict = value;
//                       });
//                     },
//                     buttonStyleData: ButtonStyleData(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.035),
//                       height: size.height * 0.045,
//                       width: size.width * 0.02,
//                     ),
//                     menuItemStyleData: MenuItemStyleData(
//                       height: size.height * 0.02,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 color: white,
//                 width: double.infinity,
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton2<String>(
//                     isExpanded: true,
//                     hint: Text(
//                       'แขวง/ตำบล',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).hintColor,
//                       ),
//                     ),
//                     items: newaddresssubdistrict
//                         .map((String item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                     value: selectednewaddressdistrict,
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectednewaddressdistrict = value;
//                       });
//                     },
//                     buttonStyleData: ButtonStyleData(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.035),
//                       height: size.height * 0.045,
//                       width: size.width * 0.02,
//                     ),
//                     menuItemStyleData: MenuItemStyleData(
//                       height: size.height * 0.02,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 color: white,
//                 width: double.infinity,
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton2<String>(
//                     isExpanded: true,
//                     hint: Text(
//                       'รหัสปรษณีย์',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).hintColor,
//                       ),
//                     ),
//                     items: newaddresszipcode
//                         .map((String item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                     value: selectednewaddresszipcode,
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectednewaddresszipcode = value;
//                       });
//                     }, //พี่เดลเก่งอ่า
//                     buttonStyleData: ButtonStyleData(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.035),
//                       height: size.height * 0.045,
//                       width: size.width * 0.02,
//                     ),
//                     menuItemStyleData: MenuItemStyleData(
//                       height: size.height * 0.02,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.003),
//               Container(
//                 height: size.height * 0.05,
//                 color: white,
//                 child: TextField(
//                   controller: _addressController,
//                   decoration: InputDecoration(
//                     hintText: 'บ้านเลขที่, ซอย, หมู่, ถนน, แขวง/ถนน',
//                     hintStyle: TextStyle(
//                       fontSize: 13,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.03),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                 padding: EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: SizedBox(
//                   height: size.height * 0.03,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Text ด้านซ้าย
//                       Text(
//                         'สถานที่',
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           ChoiceChip(
//                             label: Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: size.height * 0.007),
//                               child: Text(
//                                 'สำนักงาน',
//                                 style: TextStyle(
//                                     fontSize: 13, fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                             selected: _selectedLoacation == 0,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedLoacation = selected ? 0 : -1;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: red1),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             selectedColor: red1,
//                             labelStyle: TextStyle(
//                               color: _selectedLoacation == 0
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontWeight: _selectedLoacation == 0
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                             backgroundColor: Colors.white,
//                             showCheckmark: false,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.013),
//                             labelPadding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.001),
//                           ),
//                           SizedBox(width: size.width * 0.02),
//                           ChoiceChip(
//                             label: Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: size.height * 0.007),
//                               child: Text(
//                                 'บ้าน',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500, fontSize: 13),
//                               ),
//                             ),
//                             selected: _selectedLoacation == 1,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedLoacation = selected ? 1 : -1;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: red1),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             selectedColor: red1,
//                             labelStyle: TextStyle(
//                               color: _selectedLoacation == 1
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontWeight: _selectedLoacation == 1
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                             backgroundColor: Colors.white,
//                             showCheckmark: false,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.013),
//                             labelPadding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.008),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.0006),
//               Container(
//                 height: size.height * 0.05,
//                 width: double.infinity,
//                 color: white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'เลือกเป็นที่อยู่ตั้งต้น',
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Switch(
//                         value: _isSwitched,
//                         onChanged: (value) {
//                           setState(() {
//                             _isSwitched = value;
//                           });
//                         },
//                         activeTrackColor: Colors.red[100],
//                         activeColor: Colors.red,
//                         inactiveTrackColor: white,
//                         inactiveThumbColor: Color(0xffd9d9d9),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                 padding: EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: SizedBox(
//                   height: size.height * 0.03,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Text ด้านซ้าย
//                       Text(
//                         'เวลาที่สะดวกรับ',
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           ChoiceChip(
//                             label: Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: size.height * 0.007),
//                               child: Text(
//                                 'เฉพาะ จ.-ศ. เวลาราชการ',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                             selected: _selectedtime == 0,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedtime = selected ? 0 : -1;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: red1),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             selectedColor: red1,
//                             labelStyle: TextStyle(
//                               color: _selectedtime == 0
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontWeight: _selectedtime == 0
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                             backgroundColor: Colors.white,
//                             showCheckmark: false,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.013),
//                             labelPadding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.001),
//                           ),
//                           SizedBox(width: size.width * 0.02),
//                           ChoiceChip(
//                             label: Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: size.height * 0.007),
//                               child: Text(
//                                 'ทุกเวลา',
//                               ),
//                             ),
//                             selected: _selectedtime == 1,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedtime = selected ? 1 : -1;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: red1),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             selectedColor: red1,
//                             labelStyle: TextStyle(
//                               color: _selectedtime == 1
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontWeight: _selectedtime == 1
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                             backgroundColor: Colors.white,
//                             showCheckmark: false,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.013),
//                             labelPadding: EdgeInsets.symmetric(
//                                 horizontal: size.height * 0.008),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.07,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           content: Text('เพิ่มเรียบร้อย'),
//                           actions: [
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text('ตกลง'))
//                           ],
//                         );
//                       });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: arrowcolor,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 1,
//                         offset: Offset(0, 2), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   width: size.width * 0.91,
//                   height: size.height * 0.056,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'ยืนยัน',
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: white,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }