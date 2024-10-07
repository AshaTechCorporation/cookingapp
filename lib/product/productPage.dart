import 'package:cookingapp/model/food.dart';
import 'package:cookingapp/product/widgets/categories.dart';
import 'package:cookingapp/product/widgets/food_card.dart';
import 'package:cookingapp/product/widgets/product_appbar.dart';
import 'package:cookingapp/product/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String currentCat = "All";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductAppbar(),
                SizedBox(height: size.height * 0.02),
                ProductSearchBar(),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/explore.png"),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Categories(currentCat: currentCat),
                // SizedBox(height: size.height * 0.02),
                // QuickAndFastList(),
                SizedBox(height: size.height * 0.04),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => FoodCard(
                    food: foods[index],
                  ),
                  itemCount: foods.length,
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
