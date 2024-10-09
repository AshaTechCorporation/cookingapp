import 'dart:async';

import 'package:cookingapp/Store/fristPAgeStore.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/persenFood.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      fristLoad();
    });
  }

  Future<void> fristLoad() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } else {
      final user = await LoginService.getProfile();
      if (user.user_type == 'ร้านค้า') {
        Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FirstPageStore(),
          ),
        );
      } else {
        Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PresenFoodPage(),
            // FirstPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(81, 207, 124, 9),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
        //     Color(0xFFffffff),
        //     Color(0xFFd5e8f9),
        //   ]),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/Newlogo.png",
                  height: size.height * 0.5,
                  width: size.width * 0.8,
                ),
                Text(
                  'ยินดีตอนรับ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            // CircularProgressIndicator(
            //   strokeWidth: 5.0,
            //   valueColor: AlwaysStoppedAnimation<Color>(kGreenAccent),
            // ),
          ],
        ),
      ),
    );
  }
}
