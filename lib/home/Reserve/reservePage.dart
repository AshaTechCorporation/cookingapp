import 'package:cookingapp/constants.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:flutter/material.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key, required this.food});
  final Menus food;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        //backgroundColor: Colors.red.withOpacity(appBarOpacity),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text('จองอาหาร'),
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
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.05,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text(
              'รายการสั่งซื้อ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.food.photo_url ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                      width: size.width * 0.2,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.food.name ?? ' - '),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text('จำนวน 1'),
                      ],
                    )
                  ],
                ),
                Text(widget.food.price ?? ' - '),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.08,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'หมายเหตุเพิ่มเติม: ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'หมายเหตุ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ยอดรวมค่าอาหารทั้งหมด: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '฿ ${widget.food.price ?? ' - '}',
                      style: TextStyle(
                        fontSize: 12,
                        color: red1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.1,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'ช่องทางการชำระเงิน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'wallet',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.11,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ยอดรวมค่าอาหารทั้งหมด: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '฿ ${widget.food.price ?? ' - '}',
                  style: TextStyle(
                    fontSize: 15,
                    color: red1,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.05,
              decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservePage(
                                  food: widget.food,
                                )));
                  },
                  child: Text(
                    'จองอาหาร',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
