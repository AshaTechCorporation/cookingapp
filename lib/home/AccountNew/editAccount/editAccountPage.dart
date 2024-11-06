import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:intl/intl.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();

  String? stringTime;
  String pickerDate = '';

  String? _selectedGender;

  List<String> manuFoods = [
    'ผัดกระเพรา',
    'ผัดพริกแกง',
    'ต้มยำ',
    'ผัดพริกเกลือ',
    'อาหารจานเดียว',
    'ผัดกระเพรา',
    'ผัดพริกแกง',
    'ต้มยำ',
    'ผัดพริกเกลือ',
    'อาหารจานเดียว',
  ];
  List<bool> _isSelectedList = [];

  @override
  void initState() {
    super.initState();
    _isSelectedList = List<bool>.filled(
      manuFoods.length,
      false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'แก้ไขข้อมูลส่วนตัว',
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Newlogo.png',
                width: size.width * 0.59,
              ),
              FromRegister(
                width: size.width * 0.9,
                controller: _nameController,
                hintText: 'ชื่อ',
                validator: (value) {
                  if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                  return null;
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              FromRegister(
                width: size.width * 0.9,
                controller: _lastnameController,
                hintText: 'นามสกุล',
                validator: (value) {
                  if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                  return null;
                },
              ),
              SizedBox(height: size.height * 0.01),
              FromRegister(
                width: size.width * 0.9,
                controller: _telController,
                hintText: 'เบอร์มือถือ',
                validator: (value) {
                  if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                  return null;
                },
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  picker.DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    currentTime: DateTime.now(),
                    locale: picker.LocaleType.th,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime(2200, 1, 1),
                    theme: picker.DatePickerTheme(
                      containerHeight: size.height * 0.5,
                      itemHeight: size.height * 0.075,
                      titleHeight: size.height * 0.08,
                      headerColor: brown,
                      backgroundColor: Colors.white,
                      itemStyle: TextStyle(color: brown, fontWeight: FontWeight.bold, fontSize: 20),
                      doneStyle: TextStyle(color: red1, fontSize: 30, fontWeight: FontWeight.bold),
                      cancelStyle: TextStyle(color: red1, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    // onChanged: (date) {
                    //   print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                    // },
                    onConfirm: (date) async {
                      setState(
                        () {
                          pickerDate = DateFormat('dd/MM/yyyy').format(date);
                          stringTime = DateFormat('yyyy-MM-dd').format(date);
                          print(stringTime);
                        },
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.055,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pickerDate == '' ? 'เลือกวันที่' : pickerDate,
                        style: TextStyle(
                          color: pickerDate == '' ? Color.fromARGB(255, 172, 172, 172) : null,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.calendar_month_sharp,
                        color: Color.fromARGB(255, 151, 150, 150),
                      )
                    ],
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
                            if (_selectedGender == 'ชาย') {
                              _selectedGender = null;
                            } else {
                              _selectedGender = 'ชาย';
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
                                value: _selectedGender == 'ชาย',
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedGender = 'ชาย';
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
                        if (_selectedGender == 'หญิง') {
                          _selectedGender = null;
                        } else {
                          _selectedGender = 'หญิง';
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
                            value: _selectedGender == 'หญิง',
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedGender = 'หญิง';
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
                height: size.height * 0.01,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Wrap(
                  children: List.generate(
                    manuFoods.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelectedList[index] = !_isSelectedList[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 4,
                        // ),
                        height: size.height * 0.04,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isSelectedList[index] ? red2 : Colors.grey,
                          ),
                          color: _isSelectedList[index] ? red1 : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            manuFoods[index],
                            style: TextStyle(
                              fontSize: 13, color: _isSelectedList[index] ? Colors.white : Colors.black, fontWeight: _isSelectedList[index] ? FontWeight.bold : null,
                              // color: selectTab == index ? brown : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
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
                'แก้ไข',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
