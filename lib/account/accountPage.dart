import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class MenuItem {
  final String imagePath;
  final String text;

  MenuItem({required this.imagePath, required this.text});
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                tiles: menuItems.map((item) {
                  int index = menuItems.indexOf(item);
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 0),
                    leading: Image.asset(
                      item.imagePath,
                      //width: size.width * 0.04,
                      height: size.height * 0.04,
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      item.text,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      if (index == 0) {}
                      if (index == 1) {}
                      if (index == 2) {}
                      if (index == 3) {}
                      if (index == 4) {}
                      if (index == 5) {}
                      if (index == 6) {}
                      if (index == 7) {}
                      if (index == 8) {}
                    },
                  );
                }).toList(),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
