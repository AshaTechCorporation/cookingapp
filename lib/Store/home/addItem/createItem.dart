import 'dart:io';

import 'package:cookingapp/constants.dart';
import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as pickerdate;

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
  final TextEditingController ingredient1 = TextEditingController();
  final TextEditingController ingredient2 = TextEditingController();
  final TextEditingController ingredient3 = TextEditingController();
  final TextEditingController ingredient4 = TextEditingController();
  final TextEditingController ingredient5 = TextEditingController();
  final TextEditingController ingredientG1 = TextEditingController();
  final TextEditingController ingredientG2 = TextEditingController();
  final TextEditingController ingredientG3 = TextEditingController();
  final TextEditingController ingredientG4 = TextEditingController();
  final TextEditingController ingredientG5 = TextEditingController();
  Food? selectType;
  int count = 1;
  int iG1 = 0;
  int iG2 = 0;
  int iG3 = 0;
  int iG4 = 0;
  int iG5 = 0;

  bool status = true;

  ImagePicker picker = ImagePicker();
  XFile? image;
  String? imageSelect;

  String startSell = '';
  String endSell = '';

  List<List<TextEditingController>> history = [];

  @override
  void initState() {
    super.initState();
    TextEditingController name = TextEditingController();
    TextEditingController type = TextEditingController();
    TextEditingController startDate = TextEditingController();
    TextEditingController endDate = TextEditingController();
    history.add([name, type, startDate, endDate]);
    if (widget.foods != null) {
      nameFood.text = widget.foods?.name ?? '';
      priceFood.text = widget.foods?.reviews.toString() ?? '0.0';
      status = widget.foods?.isLiked ?? false;
      remark.text = widget.foods?.remark ?? '';
      ingredient1.text = widget.foods?.pig ?? '';
      ingredient2.text = widget.foods?.basil ?? '';
      ingredient3.text = widget.foods?.garlic ?? '';
      ingredient4.text = widget.foods?.chili ?? '';
      ingredient5.text = widget.foods?.sauce ?? '';
      ingredientG1.text = widget.foods?.pigG.toString() ?? '';
      ingredientG2.text = widget.foods?.basilG.toString() ?? '';
      ingredientG3.text = widget.foods?.garlicG.toString() ?? '';
      ingredientG4.text = widget.foods?.chiliG.toString() ?? '';
      ingredientG5.text = widget.foods?.sauceG.toString() ?? '';
      iG1 = widget.foods?.pigG ?? 0;
      iG2 = widget.foods?.basilG ?? 0;
      iG3 = widget.foods?.garlicG ?? 0;
      iG4 = widget.foods?.chiliG ?? 0;
      iG5 = widget.foods?.sauceG ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final underlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.black, width: 1),
    );
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
                widget.foods != null
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'หมวดหมู่',
                                style: TextStyle(fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(81, 207, 124, 9),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: DropdownSearch<Food>(
                              selectedItem: selectType,
                              items: foods,
                              itemAsString: (item) => item.name,
                              popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                fit: FlexFit.loose,
                                dialogProps: DialogProps(
                                  backgroundColor: Color.fromARGB(243, 202, 202, 202),
                                ),
                                containerBuilder: (context, popupWidget) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.grey, width: 3),
                                  ),
                                  child: popupWidget,
                                ),
                                searchFieldProps: TextFieldProps(
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    // fontFamily: 'Prompt',
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'รายการอาหาร',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 73, 73, 73)),
                                    prefixIcon: Icon(Icons.search),
                                    prefixIconColor: Colors.black,
                                    enabledBorder: underlineInputBorder,
                                    focusedBorder: underlineInputBorder,
                                  ),
                                ),
                                itemBuilder: (context, item, isSelected) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 1.5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  // fontFamily: 'Prompt',
                                ),
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: 'รายการอาหาร',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    // fontFamily: 'Prompt',
                                  ),
                                  border: InputBorder.none,
                                  suffixIconColor: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  image = null;
                                  selectType = value;
                                  nameFood.text = value!.name;
                                  imageSelect = value.image;
                                  // priceFood.text = value.cal.toString();
                                  remark.text = value.remark;
                                  ingredient1.text = value.pig;
                                  ingredient2.text = value.basil;
                                  ingredient3.text = value.garlic;
                                  ingredient4.text = value.chili;
                                  ingredient5.text = value.sauce;
                                  ingredientG1.text = value.pigG.toString();
                                  ingredientG2.text = value.basilG.toString();
                                  ingredientG3.text = value.garlicG.toString();
                                  ingredientG4.text = value.chiliG.toString();
                                  ingredientG5.text = value.sauceG.toString();
                                  iG1 = value.pigG;
                                  iG2 = value.basilG;
                                  iG3 = value.garlicG;
                                  iG4 = value.chiliG;
                                  iG5 = value.sauceG;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      ),
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
                            : imageSelect != null
                                ? Stack(
                                    children: [
                                      Image.asset(
                                        imageSelect!,
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
                          'จำนวนขายทั้งหมด',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        FromRegister(
                          width: size.width * 0.45,
                          controller: priceFood,
                          hintText: 'จำนวนขายทั้งหมด',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickerdate.DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          currentTime: DateTime.now(),
                          locale: pickerdate.LocaleType.th,
                          minTime: DateTime(1900, 1, 1),
                          maxTime: DateTime(2200, 1, 1),
                          theme: pickerdate.DatePickerTheme(
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
                                startSell = DateFormat('dd/MM/yyyy').format(date);
                                // stringTime = DateFormat('yyyy-MM-dd').format(date);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.45,
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
                              startSell == '' ? 'เริ่มขาย' : startSell,
                              style: TextStyle(
                                color: startSell == '' ? Color.fromARGB(255, 172, 172, 172) : null,
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
                    GestureDetector(
                      onTap: () {
                        pickerdate.DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          currentTime: DateTime.now(),
                          locale: pickerdate.LocaleType.th,
                          minTime: DateTime(1900, 1, 1),
                          maxTime: DateTime(2200, 1, 1),
                          theme: pickerdate.DatePickerTheme(
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
                                endSell = DateFormat('dd/MM/yyyy').format(date);
                                // stringTime = DateFormat('yyyy-MM-dd').format(date);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.45,
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
                              endSell == '' ? 'สิ้นสุดการขาย' : endSell,
                              style: TextStyle(
                                color: endSell == '' ? Color.fromARGB(255, 172, 172, 172) : null,
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
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'เรทราคา',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                    children: List.generate(
                  history.length,
                  (index) => Experience(
                    index: index,
                    price: history[index][0],
                    unitStart: history[index][1],
                    unitEnd: history[index][2],
                    onTap: () {
                      setState(() {
                        history.removeAt(index);
                      });
                    },
                  ),
                )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      TextEditingController name = TextEditingController();
                      TextEditingController type = TextEditingController();
                      TextEditingController startDate = TextEditingController();
                      TextEditingController endDate = TextEditingController();
                      history.add([name, type, startDate, endDate]);
                    });
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text('เพิ่มวันที่'),
                        ],
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
                    Text(
                      'ส่วนผสม',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (count > 1) {
                              setState(() {
                                count -= 1;
                                ingredientG1.text = (iG1 * count).toString();
                                ingredientG2.text = (iG2 * count).toString();
                                ingredientG3.text = (iG3 * count).toString();
                                ingredientG4.text = (iG4 * count).toString();
                                ingredientG5.text = (iG5 * count).toString();
                              });
                            }
                          },
                          child: Container(
                            width: size.width * 0.08,
                            height: size.height * 0.03,
                            decoration: BoxDecoration(
                              color: red1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          count.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count += 1;
                              ingredientG1.text = (iG1 * count).toString();
                              ingredientG2.text = (iG2 * count).toString();
                              ingredientG3.text = (iG3 * count).toString();
                              ingredientG4.text = (iG4 * count).toString();
                              ingredientG5.text = (iG5 * count).toString();
                            });
                          },
                          child: Container(
                            width: size.width * 0.08,
                            height: size.height * 0.03,
                            decoration: BoxDecoration(
                              color: red1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FromRegister(
                      width: size.width * 0.6,
                      controller: ingredient1,
                      hintText: 'ส่วนผสม',
                    ),
                    FromRegister(
                      width: size.width * 0.3,
                      controller: ingredientG1,
                      hintText: 'กรัม',
                      labelText: 'กรัม/ช้อนโต๊ะ',
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FromRegister(
                      width: size.width * 0.6,
                      controller: ingredient2,
                      hintText: 'ส่วนผสม',
                    ),
                    FromRegister(
                      width: size.width * 0.3,
                      controller: ingredientG2,
                      hintText: 'กรัม',
                      labelText: 'กรัม/ช้อนโต๊ะ',
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FromRegister(
                      width: size.width * 0.6,
                      controller: ingredient3,
                      hintText: 'ส่วนผสม',
                    ),
                    FromRegister(
                      width: size.width * 0.3,
                      controller: ingredientG3,
                      hintText: 'กรัม',
                      labelText: 'กรัม/ช้อนโต๊ะ',
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FromRegister(
                      width: size.width * 0.6,
                      controller: ingredient4,
                      hintText: 'ส่วนผสม',
                    ),
                    FromRegister(
                      width: size.width * 0.3,
                      controller: ingredientG4,
                      hintText: 'กรัม',
                      labelText: 'กรัม/ช้อนโต๊ะ',
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FromRegister(
                      width: size.width * 0.6,
                      controller: ingredient5,
                      hintText: 'ส่วนผสม',
                    ),
                    FromRegister(
                      width: size.width * 0.3,
                      controller: ingredientG5,
                      hintText: 'กรัม',
                      labelText: 'กรัม/ช้อนโต๊ะ',
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'วิธีทำอาหาร',
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
                onPressed: () async {
                  final out = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('ยืนยัน'),
                            content: Text('ยืนยันที่จะเปิดขายรายการอาหาร'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: Text('ยกเลิก'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text('ตกลง'),
                              )
                            ],
                          ));
                  if (out == true) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  widget.foods == null ? 'เพิ่มรายการ' : 'แก้ไขรายการ',
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

class Experience extends StatelessWidget {
  Experience({
    super.key,
    this.index,
    required this.price,
    required this.unitStart,
    required this.unitEnd,
    this.onTap,
  });

  int? index;
  TextEditingController price = TextEditingController();
  TextEditingController unitStart = TextEditingController();
  TextEditingController unitEnd = TextEditingController();

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: red2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${index! + 1}.'),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FromRegister(
                        width: size.width * 0.3,
                        controller: unitStart,
                        hintText: 'เริ่มที่จำนวน',
                        labelText: 'เริ่มที่จำนวน',
                        // focusNode: FocusNode(),
                      ),
                      FromRegister(
                        width: size.width * 0.3,
                        controller: unitEnd,
                        hintText: 'สิ้นสุดที่จำนวน',
                        labelText: 'สิ้นสุดที่จำนวน',
                        // focusNode: FocusNode(),
                      ),
                      FromRegister(
                        width: size.width * 0.25,
                        controller: price,
                        hintText: 'ราคา',
                        labelText: 'ราคา',
                        // focusNode: FocusNode(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [Icon(Icons.remove)],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
