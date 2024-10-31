import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/Reserve/reservePage.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food, required this.image});
  final Menus food;
  final String image;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.072),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            //backgroundColor: Colors.red.withOpacity(appBarOpacity),
            backgroundColor: Colors.transparent,
            elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Center(child: Icon(Icons.share)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: SizedBox(
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        '${widget.food.name}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text(
                            '${widget.food.price}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ราคา',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'ส่วนผสม',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '- ใบผักชี 1/2 ถ้วย\n- ใบพาร์สลีย์ 1/2 ถ้วย\n- น้ำมันมะกอก 3/4 ถ้วย\n- กระเทียม 2 ช้อนโต๊ะ\n- เกลือทะเล 1/4 ช้อนชา\n- พริกขี้หนูเขียว (กรีดเมล็ดออกสับหยาบ) 1 ช้อนชา\n- พริกหวานสีเขียวสับหยาบ 1 ช้อนโต๊ะ\n- หอมหัวใหญ่สีแดงสับหยาบ 1 ช้อนโต๊ะ\n- น้ำเลมอน 1 ช้อนโต๊ะ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReservePage(
                          food: widget.food,
                        )));
          },
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              color: brown,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              'จองอาหาร',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
