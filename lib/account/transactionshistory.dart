
import 'package:cookingapp/account/Accumulatedpoints.dart';
import 'package:cookingapp/account/Refund.dart';
import 'package:cookingapp/account/Statement.dart';
import 'package:cookingapp/account/Topuphis.dart';
import 'package:cookingapp/account/Withdrown.dart';
import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Transactionhistorypage extends StatefulWidget {
  const Transactionhistorypage({super.key});

  @override
  State<Transactionhistorypage> createState() => _TransactionhistorypageState();
}

class _TransactionhistorypageState extends State<Transactionhistorypage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with length 3
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'ประวัติธุรกรรม',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildTabItem(0, 'ประวัติการเติมเงิน'),
                  buildTabItem(1, 'ประวัติการถอนเงิน'),
                  buildTabItem(2, 'รายการเดินบัญชี'),
                  buildTabItem(3, 'ใบแจ้งยอดการคืนเงิน'),
                  buildTabItem(4, 'รายการคะแนนสะสม'),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Topuphis(),
                  Withdrown(),
                  Statement(),
                  Refund(),
                  Accumulatedpoints()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          _tabController.animateTo(index);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.008),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: greymess),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : headingtext,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
