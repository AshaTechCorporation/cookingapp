import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/models/provinecs.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class Registerpage extends StatefulWidget {
  const Registerpage({super.key, required this.type});
  final String type;
  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final registerFormKey = GlobalKey<FormState>();
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
  final TextEditingController name = TextEditingController();

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

  String? stringTime;
  String pickerDate = '';

  double? lat = 0.0;
  double? long = 0.0;
  @override
  void initState() {
    super.initState();
    getProvinecs();
    getLocation();
    _isSelectedList = List<bool>.filled(
      manuFoods.length,
      false,
    );
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      lat = position.latitude;
      long = position.longitude;
      print('lat: $lat long: $long');
    });
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
      body: Form(
        key: registerFormKey,
        child: SingleChildScrollView(
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
                          decoration:
                              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
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
                  FromRegister(
                    width: size.width * 0.9,
                    controller: username,
                    hintText: 'ผู้ใช้งาน',
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
                    controller: _passwordController,
                    hintText: 'รหัสผ่าน',
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'กรุณากรอกรหัสผ่าน';
                      }
                      if (value.length < 8 || value.length > 20) {
                        return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                      }
                      if (value != _confirmPasswordController.text) {
                        return 'รหัสผ่านไม่ตรงกัน';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  FromRegister(
                    width: size.width * 0.9,
                    controller: _confirmPasswordController,
                    hintText: 'ยืนยันรหัสผ่าน',
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'กรุณากรอกรหัสผ่าน';
                      }
                      if (value.length < 8 || value.length > 20) {
                        return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                      }
                      if (value != _passwordController.text) {
                        return 'รหัสผ่านไม่ตรงกัน';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  widget.type == 'ร้านค้า'
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            Wrap(
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
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
                            SizedBox(height: size.height * 0.01),
                          ],
                        ),
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
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            FromRegister(
                              width: size.width * 0.9,
                              controller: name,
                              hintText: 'ชื่อร้านค้า',
                              validator: (value) {
                                if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                                return null;
                              },
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey,
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
                                          hintText: 'อำเภอ',
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
                                          hintText: 'ตำบล',
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
                                          selcetSubDistricts = value;
                                          // if (value != null) {
                                          //   getDistrits(id: value.id);
                                          // }
                                        });
                                      },
                                    ),
                                  ),
                            SizedBox(height: size.height * 0.01),
                            FromRegister(
                              width: size.width * 0.9,
                              controller: address,
                              hintText: 'ที่อยู่',
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                                return null;
                              },
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: size.height * 0.073,
          decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextButton(
              onPressed: () async {
                if (registerFormKey.currentState!.validate()) {
                  if (stringTime != null || stringTime != '') {
                    LoadingDialog.open(context);
                    try {
                      await LoginService.register(
                        user_type: widget.type == 'ร้านค้า' ? 'ร้านค้า' : 'บุคคล',
                        first_name: _nameController.text,
                        last_name: _lastnameController.text,
                        phone_number: _telController.text,
                        birth_date: stringTime,
                        gender: _selectedGender,
                        username: username.text,
                        password: _passwordController.text,
                        password_confirmation: _confirmPasswordController.text,
                        address: address.text,
                        name: name.text,
                        province_id: widget.type == 'ร้านค้า' ? selcetProvinecs!.id : null,
                        district_id: widget.type == 'ร้านค้า' ? selcetDistricts!.id : null,
                        subdistrict_id: widget.type == 'ร้านค้า' ? selcetSubDistricts!.id : null,
                        latitude: widget.type == 'ร้านค้า' ? lat : null,
                        longitude: widget.type == 'ร้านค้า' ? long : null,
                      );
                      LoadingDialog.close(context);
                      if (!mounted) return;
                      Navigator.pop(context);
                    } catch (e) {
                      LoadingDialog.close(context);
                      if (!mounted) return;
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('แจ้งเตือน'),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('ตกลง'),
                                  )
                                ],
                              ));
                    }
                  }
                }
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
