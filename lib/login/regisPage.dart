import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/models/districts.dart';
import 'package:cookingapp/models/provinecs.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key, required this.type});
  final String type;
  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reccomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _importercodeController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController address = TextEditingController();

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

  Provinecs? selcetProvinecs;
  Provinecs? selcetDistricts;
  Provinecs? selcetSubDistricts;

  List<Provinecs> listProvinecs = [];
  List<Provinecs> listDistricts = [];
  List<Provinecs> listSubDistricts = [];
  @override
  void initState() {
    super.initState();
    getProvinecs();
  }

  Future<void> getProvinecs() async {
    final listPro = await LoginService.getProvinecs();
    setState(() {
      listProvinecs = listPro;
    });
  }

  Future<void> getDistrits({required int id}) async {
    final listDis = await LoginService.getDistrits(id: id);
    setState(() {
      listDistricts = listDis;
    });
  }

  Future<void> getSubDistrits({required int id}) async {
    final listSubDis = await LoginService.getSubDistrits(id: id);
    setState(() {
      listSubDistricts = listSubDis;
    });
  }

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final underlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.black, width: 1),
    );
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
                Image.asset(
                  'assets/images/Newlogo.png',
                  width: size.width * 0.59,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white,
                  ),
                  child: TextField(
                    controller: username,
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
                      hintText: 'ผู้ใช้งาน',
                      labelStyle: const TextStyle(),
                      contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
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
                widget.type != 'ร้านค้า'
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ร้านค้า',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: DropdownSearch<Provinecs>(
                              selectedItem: selcetProvinecs,
                              // items: listProvinec,
                              items: listProvinecs,
                              itemAsString: (item) => item.name_th ?? '',
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(maxHeight: 450),
                                fit: FlexFit.loose,
                                itemBuilder: (context, item, isSelected) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name_th ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Prompt',
                                ),
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: 'จังหวัด',
                                  hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontFamily: 'Prompt',
                                  ),
                                  border: InputBorder.none,
                                  suffixIconColor: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selcetProvinecs = value;
                                  if (value != null) {
                                    getDistrits(id: value.id!);
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          selcetProvinecs == null || listDistricts.isEmpty
                              ? SizedBox.shrink()
                              : Container(
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: DropdownSearch<Provinecs>(
                                    selectedItem: selcetDistricts,
                                    items: listDistricts,
                                    itemAsString: (item) => item.name_th ?? '',
                                    popupProps: PopupProps.menu(
                                      constraints: BoxConstraints(maxHeight: 450),
                                      fit: FlexFit.loose,
                                      itemBuilder: (context, item, isSelected) => Container(
                                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name_th ?? '',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      baseStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Prompt',
                                      ),
                                      dropdownSearchDecoration: InputDecoration(
                                        hintText: 'จังหวัด',
                                        hintStyle: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'Prompt',
                                        ),
                                        border: InputBorder.none,
                                        suffixIconColor: Colors.grey,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        selcetDistricts = value;
                                        if (value != null) {
                                          getSubDistrits(id: value.id!);
                                        }
                                      });
                                    },
                                  ),
                                ),
                          SizedBox(height: size.height * 0.01),
                          selcetDistricts == null
                              ? SizedBox.shrink()
                              : Container(
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: DropdownSearch<Provinecs>(
                                    selectedItem: selcetSubDistricts,
                                    // items: listProvinec,
                                    items: listSubDistricts,
                                    itemAsString: (item) => item.name_th ?? '',
                                    popupProps: PopupProps.menu(
                                      constraints: BoxConstraints(maxHeight: 450),
                                      fit: FlexFit.loose,
                                      itemBuilder: (context, item, isSelected) => Container(
                                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name_th ?? '',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      baseStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Prompt',
                                      ),
                                      dropdownSearchDecoration: InputDecoration(
                                        hintText: 'จังหวัด',
                                        hintStyle: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'Prompt',
                                        ),
                                        border: InputBorder.none,
                                        suffixIconColor: Colors.grey,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        selcetDistricts = value;
                                        // if (value != null) {
                                        //   getDistrits(id: value.id);
                                        // }
                                      });
                                    },
                                  ),
                                ),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            // height: size.height * 0.052,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: white,
                            ),
                            child: TextFormField(
                              controller: address,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
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
                                hintText: 'ที่อยู่',
                                labelStyle: const TextStyle(),
                                contentPadding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.02),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      )
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
