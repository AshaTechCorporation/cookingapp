import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Itemfav extends StatefulWidget {
  const Itemfav({super.key});

  @override
  State<Itemfav> createState() => _ItemfavState();
}

class _ItemfavState extends State<Itemfav> {
  // เก็บสถานะการเลือกของแต่ละร้านค้าและสินค้าภายในร้านค้า
  List<bool> storeSelections = [false];
  late List<List<bool>> storeItemSelections;
  List<List<int>> quantities = [];

  @override
  void initState() {
    super.initState();

    // Initialize selections to match the size of itemfav
    storeSelections = List.generate(itemfav.length, (_) => false);
    storeItemSelections = itemfav.map<List<bool>>((store) => List.generate(store['storeItems'].length, (_) => false)).toList();
    // Initialize quantities with default value of 1 for each item
    quantities = itemfav.map<List<int>>((store) => List.generate(store['storeItems'].length, (_) => 1)).toList();
  }

  void _selectStore(int storeIndex, bool? isSelected) {
    setState(() {
      storeSelections[storeIndex] = isSelected ?? false;
      for (int i = 0; i < storeItemSelections[storeIndex].length; i++) {
        storeItemSelections[storeIndex][i] = storeSelections[storeIndex];
      }
    });
  }

  void _selectStoreItem(int storeIndex, int itemIndex, bool? isSelected) {
    setState(() {
      storeItemSelections[storeIndex][itemIndex] = isSelected ?? false;
      storeSelections[storeIndex] = storeItemSelections[storeIndex].every((item) => item);
    });
  }

  void _deleteStore(int storeIndex) {
    setState(() {
      itemfav = List<Map<String, dynamic>>.from(itemfav);
      itemfav.removeAt(storeIndex);
      storeSelections.removeAt(storeIndex);
      storeItemSelections.removeAt(storeIndex);
    });
  }

  void _deleteStoreItem(int storeIndex, int itemIndex) {
    setState(() {
      itemfav = List<Map<String, dynamic>>.from(itemfav);
      itemfav[storeIndex]['storeItems'] = List<Map<String, dynamic>>.from(itemfav[storeIndex]['storeItems']);
      itemfav[storeIndex]['storeItems'].removeAt(itemIndex);
      storeItemSelections[storeIndex].removeAt(itemIndex);

      if (itemfav[storeIndex]['storeItems'].isEmpty) {
        _deleteStore(storeIndex);
      } else {
        storeSelections[storeIndex] = storeItemSelections[storeIndex].every((item) => item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'รายการโปรด',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: itemfav.length,
        itemBuilder: (context, storeIndex) {
          final store = itemfav[storeIndex];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCheckbox(
                          value: storeSelections[storeIndex],
                          onChanged: (isSelected) => _selectStore(storeIndex, isSelected),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          store['storeName'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => _deleteStore(storeIndex),
                          child: Text(
                            'ลบ',
                            style: TextStyle(color: greyuserinfo),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ...List.generate(
                      store['storeItems'].length,
                      (itemIndex) => Column(
                        children: [
                          _buildProductItem(
                            context,
                            storeIndex,
                            itemIndex,
                            store['storeItems'][itemIndex],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: size.height * 0.006),
          child: Container(
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: red1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'เพิ่มสินค้าที่เลือกไปยังรถเข็น',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int storeIndex, int itemIndex, Map<String, dynamic> item) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CustomCheckbox(
          value: storeItemSelections[storeIndex][itemIndex],
          onChanged: (isSelected) => _selectStoreItem(storeIndex, itemIndex, isSelected),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            item['imageAssetPath'],
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              const Text(
                '¥4.88',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Column(
          children: [
            InkWell(
              onTap: () => _deleteStoreItem(storeIndex, itemIndex),
              child: const Text(
                'ลบ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/icons/shoppingbutton.png',
              width: size.width * 0.12,
              height: size.height * 0.044,
              fit: BoxFit.fill,
              color: red1,
            ),
          ],
        ),
      ],
    );
  }
}
