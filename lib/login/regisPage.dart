import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reccomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _importercodeController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
// dropdown
  final List<String> subdistrict = [
    '1',
    '2',
  ];
  final List<String> zipcode = [
    '3',
    '4',
  ];

  final List<String> _formatsent = [
    '3',
    '4',
  ];

  final List<String> totalsend = [
    '5',
    '6',
  ];

  final List<String> sendoften = [
    '7',
    '8',
  ];

  final List<String> importtype = [
    '2',
    '4',
  ];

  final List<String> userwant = [
    '8',
    '6',
  ];

  String? selectedsubdistrict;

  String? selectedzipcode;

  String? selectedtotalsend;

  String? selectedformatsent;

  String? selectedsendoften;

  String? selectedimporttype;

  String? selecteduserwant;

// checkbox
  String? _selectedGender;

  String? _selecteduseto;

  bool _agreement = false;

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ลงทะเบียนผู้ใช้งาน',
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
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/Screenshot 2024-10-05 161407.png',
                  width: size.width * 0.59,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                SizedBox(
                  height: size.height * 0.052,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'ชื่อ',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      hintText: 'นามสกุล',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _telController,
                    decoration: InputDecoration(
                      hintText: 'เบอร์มือถือ',
                      labelStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _birthController,
                    decoration: InputDecoration(
                      hintText: 'วันเกิด',
                      labelStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.01),
                          child: Text(
                            'เพศ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.4,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedGender == 'Male') {
                                _selectedGender = null;
                              } else {
                                _selectedGender = 'Male';
                              }
                            });
                          },
                          child: Container(
                            height: size.height * 0.043,
                            width: size.width * 0.2,
                            decoration:
                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomCheckbox(
                                  value: _selectedGender == 'Male',
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        _selectedGender = 'Male';
                                      } else {
                                        _selectedGender = null;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'ชาย',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedGender == 'Female') {
                            _selectedGender = null;
                          } else {
                            _selectedGender = 'Female';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.043,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCheckbox(
                              value: _selectedGender == 'Female',
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedGender = 'Female';
                                  } else {
                                    _selectedGender = null;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'หญิง',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  height: size.height * 0.052,
                  color: white,
                  child: TextField(
                    controller: _importercodeController,
                    decoration: InputDecoration(
                      hintText: 'รหัสผู้นำเข้า',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'รหัสผ่าน',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'ยืนยันรหัสผ่าน',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const SizedBox(height: 20),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: _reccomController,
                    decoration: InputDecoration(
                      hintText: 'ผู้แนะนำ',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ที่อยู่การจัดส่งในไทย',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'ตำบล',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: subdistrict
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select distict';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedsubdistrict = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'รหัสไปรษณีย์',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: zipcode
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select zipcode.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedzipcode = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                // InkWell(
                //   onTap: () {
                //     print('map');
                //   },
                //   child: Container(
                //       height: size.height * 0.055,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: white,
                //           border: Border.all(
                //             color: Colors.grey,
                //             width: 0.5,
                //           )),
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: size.width * 0.02,
                //           ),
                //           Image.asset('assets/icons/pin.png'),
                //           SizedBox(
                //             width: size.width * 0.02,
                //           ),
                //           Text(
                //             'พิกัด Google map',
                //             style: TextStyle(
                //               fontSize: 15,
                //             ),
                //           )
                //         ],
                //       )),
                // ),
                SizedBox(height: size.height * 0.035),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'รูปแบบส่งต่อ(ในไทย)',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: _formatsent
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select format.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedformatsent = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'เคยนำเข้าสินค้าจากจีนแล้วหรือไม่',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selecteduseto == 'เคย') {
                            _selecteduseto = null;
                          } else {
                            _selecteduseto = 'เคย';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: size.width * 0.001,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.05),
                          child: Row(
                            children: [
                              CustomCheckbox(
                                value: _selecteduseto == 'เคย',
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selecteduseto = 'เคย';
                                    } else {
                                      _selecteduseto = null;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'เคย',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selecteduseto == 'ไม่เคย') {
                            _selecteduseto = null;
                          } else {
                            _selecteduseto = 'ไม่เคย';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: size.width * 0.001,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.05),
                          child: Row(
                            children: [
                              CustomCheckbox(
                                value: _selecteduseto == 'ไม่เคย',
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selecteduseto = 'ไม่เคย';
                                    } else {
                                      _selecteduseto = null;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'ไม่เคย',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'ยอดจำนวนค่าขนส่งที่เคยนำเข้าต่อครั้ง ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: totalsend
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select ยอดจำนวนส่ง';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedtotalsend = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'ท่านนำเข้าบ่อยหรือไม่ ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: sendoften
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select ยอดจำนวนส่ง';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedsendoften = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'ต้องการนำเข้าแบบใด ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: importtype
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณากรอก';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedimporttype = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: const Text(
                    'สิ่งที่ท่านต้องการ ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: userwant
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณากรอก';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selecteduserwant = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      value: _agreement,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreement = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'ยอมรับ ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'ข้อกำหนด เงื่อนไข',
                              style: TextStyle(color: red1, fontSize: 12),
                              // Add onTap event to TextSpan
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the tap on 'ข้อกำหนด เงื่อนไขการสั่งซื้อและส่งตามนโยบายของบริษัทฯ'
                                  print('Tapped on ข้อกำหนด เงื่อนไข');
                                },
                            ),
                            TextSpan(
                              text: ' การสั่งซื้อและส่งตามนโยบายของ บริษัทฯและ ',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            TextSpan(
                              text: 'นโยบายความเป็นส่วนตัว',
                              style: TextStyle(color: red1, fontSize: 12),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the tap on 'นโยบายความเป็นส่วนตัว'
                                  print('Tapped on นโยบายความเป็นส่วนตัว');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: size.height * 0.015,
                // ),
                // Text(
                //   'หรือ',
                //   style: TextStyle(fontSize: 15),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/google.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Color(0xff3c5a9a),
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/facebook.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Color(0xff00b900),
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/line.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/apple.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
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
              onPressed: () {
                print('succes');
              },
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
