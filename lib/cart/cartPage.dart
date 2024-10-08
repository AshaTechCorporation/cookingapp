import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/cart/widgets/storeitem.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isSelected = false;
  final List<bool> storeItemsSelection = [false, false];
  final List<String> storeNames = ['รายการอาหาร', 'รายการอาหาร'];
  final List<List<bool>> productItemsSelection = [
    [false, false],
    [false, false]
  ];

  void selectAll(bool? value) {
    setState(() {
      isSelected = value ?? false;
      storeItemsSelection.fillRange(0, storeItemsSelection.length, isSelected);
      for (int i = 0; i < productItemsSelection.length; i++) {
        productItemsSelection[i].fillRange(0, productItemsSelection[i].length, isSelected);
      }
    });
  }

  void updateStoreSelection(int index, bool? value) {
    setState(() {
      storeItemsSelection[index] = value ?? false;
      productItemsSelection[index].fillRange(0, productItemsSelection[index].length, storeItemsSelection[index]);
      isSelected = storeItemsSelection.every((selected) => selected);
    });
  }

  void updateProductSelection(int storeIndex, int productIndex, bool? value) {
    setState(() {
      productItemsSelection[storeIndex][productIndex] = value ?? false;
      // Update store selection based on product selections
      storeItemsSelection[storeIndex] = !productItemsSelection[storeIndex].contains(false);
      isSelected = storeItemsSelection.every((selected) => selected);
    });
  }

  void deleteStore(int storeIndex) {
    setState(() {
      storeNames.removeAt(storeIndex);
      storeItemsSelection.removeAt(storeIndex);
      productItemsSelection.removeAt(storeIndex);
      isSelected = storeItemsSelection.every((selected) => selected);
    });
  }

  void deleteProduct(int storeIndex, int productIndex) {
    setState(() {
      productItemsSelection[storeIndex].removeAt(productIndex);
      if (productItemsSelection[storeIndex].isEmpty) {
        deleteStore(storeIndex);
      } else {
        storeItemsSelection[storeIndex] = !productItemsSelection[storeIndex].contains(false);
        isSelected = storeItemsSelection.every((selected) => selected);
      }
    });
  }

  Widget buildCheckbox(String label, bool value, ValueChanged<bool?> onChanged) {
    final size = MediaQuery.of(context).size; // ประกาศ size ที่นี่

    return Row(
      children: [
        CustomCheckbox(
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(width: size.width * 0.02),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildBottomBar(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.075,
      child: BottomAppBar(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCheckbox('ทั้งหมด', isSelected, selectAll),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: red1,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.007,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'สั่งซื้อสินค้า',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        title: const Text(
          'รถเข็น',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: storeItemsSelection.length,
        itemBuilder: (context, index) {
          return StoreItem(
            storeName: storeNames[index],
            isSelected: storeItemsSelection[index],
            onSelectionChanged: (isSelected) =>
                updateStoreSelection(index, isSelected),
            productItemsSelection: productItemsSelection[index],
            onProductSelectionChanged: (productIndex, isSelected) =>
                updateProductSelection(index, productIndex, isSelected),
            onDeleteStore: () => deleteStore(index),
            onDeleteProduct: (productIndex) =>
                deleteProduct(index, productIndex),
          );
        },
      ),
      bottomNavigationBar: buildBottomBar(context),
    );
  }
}
