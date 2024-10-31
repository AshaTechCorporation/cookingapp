import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/detailFood/DetailFoodNew.dart';
import 'package:cookingapp/home/widgets/CardRestaurantWidget.dart';
import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/widgets/Form.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
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
                size: 30,
              ),
            ),
          ),
        ),
        title: Text('ค้นหา'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FromRegister(
                    width: size.width * 0.9,
                    // controller: username,
                    hintText: 'ค้นหา',
                    icons: Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Text('แนะนำ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
              foods.isNotEmpty
                  ? SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(
                          foods.length,
                          (index) => CardRestaurantWidget2(
                              size: size,
                              name: foods[index].name,
                              address: 'ร้านอาหารใกล้ฉัน',
                              image: foods[index].image,
                              km: foods[index].reviews.toString(),
                              rate: foods[index].rate.toString(),
                              press: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DetailFoodNewPage(
                                //               food: foods[index],
                                //             )));
                              }),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
