import 'package:cookingapp/cart/widgets/CustomCheckbox.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatefulWidget {
  const StoreItem({
    super.key,
    required this.storeName,
    required this.isSelected,
    required this.onSelectionChanged,
    required this.productItemsSelection,
    required this.onProductSelectionChanged,
    required this.onDeleteStore,
    required this.onDeleteProduct,
  });

  final String storeName;
  final bool isSelected;
  final ValueChanged<bool?> onSelectionChanged;
  final List<bool> productItemsSelection;
  final void Function(int, bool?) onProductSelectionChanged;
  final VoidCallback onDeleteStore;
  final void Function(int) onDeleteProduct;

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  List<int> quantities = []; // สร้างตัวแปรเก็บจำนวนสินค้าแต่ละรายการ

  @override
  void initState() {
    super.initState();
    // ตั้งค่าเริ่มต้นจำนวนสินค้าสำหรับแต่ละรายการ
    quantities = List<int>.filled(widget.productItemsSelection.length, 1);
  }

  void _incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  Widget _buildProductItem({
    required String image,
    required String name,
    required String price,
    required int quantity, // เปลี่ยนเป็น int
    required bool isSelected,
    required ValueChanged<bool?> onSelectionChanged,
    required VoidCallback onDelete,
    required int index, // รับ index โดยตรง
    String dropdownValue = 'ธรรมดา',
    required ValueKey<int> key,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckbox(
            value: isSelected,
            onChanged: onSelectionChanged,
          ),
          const SizedBox(
            width: 7,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              width: 80,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onDelete,
                      child: const Text(
                        'ลบ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                          iconSize: 20,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          onChanged: (String? newValue) {
                            // ฟังก์ชันเปลี่ยนค่า dropdown
                          },
                          items: <String>['ธรรมดา', 'พิเศษ',].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¥${(double.parse(price) * quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    _buildQuantitySelector(quantity, index),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(int quantity, int index) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _decrementQuantity(index),
          icon: Image.asset('assets/icons/dec.png'),
        ),
        Text(quantity.toString(), style: const TextStyle(fontSize: 12)),
        IconButton(
          onPressed: () => _incrementQuantity(index),
          icon: Image.asset('assets/icons/inc.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomCheckbox(
                    value: widget.isSelected,
                    onChanged: widget.onSelectionChanged,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    widget.storeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: widget.onDeleteStore,
                    child: const Text(
                      'ลบ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              for (int i = 0; i < widget.productItemsSelection.length; i++)
                _buildProductItem(
                  key: ValueKey(i), // เพิ่ม Key เพื่อเพิ่มประสิทธิภาพ
                  image: 'assets/images/ramen-noodles.jpg',
                  name: 'Spicy Ramen Noodles',
                  price: '4.88',
                  quantity: quantities[i], // ส่งเป็น int
                  isSelected: widget.productItemsSelection[i],
                  onSelectionChanged: (isSelected) => widget.onProductSelectionChanged(i, isSelected),
                  onDelete: () => widget.onDeleteProduct(i),
                  index: i, // ส่งค่า index โดยตรง
                  dropdownValue: i == 0 ? 'ธรรมดา' : 'พิเศษ',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
