import 'package:cookingapp/Store/Graphs/test3.dart';
import 'package:cookingapp/Store/fristPAgeStore.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/extension/ApiExeption.dart';
import 'package:cookingapp/home/firstPage.dart';
import 'package:cookingapp/home/homePage.dart';
import 'package:cookingapp/home/persenFood.dart';
import 'package:cookingapp/login/Services/loginService.dart';
import 'package:cookingapp/login/regisPage.dart';
import 'package:cookingapp/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool seePassword = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(81, 207, 124, 9),
        centerTitle: false,
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size.height * 0.29,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/backgroundLogin.png'), fit: BoxFit.fitWidth),
                  // color:Color.fromARGB(81, 207, 124, 9),,
                  borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(100, 100))),
              child: Center(
                child: SizedBox(
                  height: size.height * 0.25,
                  width: size.width * 0.35,
                  child: Image.asset('assets/images/Newlogo.png'),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.06,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/images/userlogin.png'), labelText: 'รหัสผู้ใช้งาน', labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.06,
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่าน',
                        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        prefixIcon: Image.asset(
                          'assets/icons/password.png',
                          height: size.height * 0.001,
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => seePassword = !seePassword);
                              },
                              child: Icon(
                                !seePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              ),
                            )
                          ],
                        ),
                      ),
                      obscureText: seePassword,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'ลืมรหัสผ่าน?',
                          style: TextStyle(
                            color: red1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.87,
                    child: ElevatedButton(
                      onPressed: () async {
                        LoadingDialog.open(context);
                        try {
                          final token = await LoginService.login(email.text, password.text);
                          LoadingDialog.close(context);
                          if (token != null) {
                            final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                            final SharedPreferences prefs = await _prefs;
                            await prefs.setString('token', token['token']);
                            if (token['user'] == 'ร้านค้า') {
                              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPageStore()), (route) => true);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return FirstPageStore();
                              }));
                              // Navigator.of(context, rootNavigator: true).pushReplacement(
                              //   MaterialPageRoute(
                              //     builder: (context) => FirstPageStore(),
                              //   ),
                              // );
                            } else {
                              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PresenFoodPage()), (route) => true);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return PresenFoodPage();
                              }));
                              // Navigator.of(context, rootNavigator: true).pushReplacement(
                              //   MaterialPageRoute(
                              //     builder: (context) => PresenFoodPage(),
                              //     // FirstPage(),
                              //   ),
                              // );
                            }
                          }
                        } on ApiException catch (e) {
                          LoadingDialog.close(context);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('แจ้งเตือน'),
                                    content: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('ตกลง'),
                                      )
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.87,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 219, 18, 4),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: BorderSide(
                          color: brown, // สีของขอบ
                          width: 1,
                        ),
                      ),
                      onPressed: () {
                        _showSelectionDialog(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return Registerpage();
                        // }));
                      },
                      child: Text(
                        'ลงทะเบียนผู้ใช้ใหม่',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: red1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                ],
              ),
            ),
            Text(
              'หรือ',
              style: TextStyle(fontSize: 15),
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.91,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/icons/google.png',
                      height: size.height * 0.08,
                    ),
                    Image.asset(
                      'assets/icons/linelogin.png',
                      height: size.height * 0.03,
                    ),
                    Image.asset(
                      'assets/icons/facebook.png',
                      height: size.height * 0.10,
                    ),
                    Image.asset(
                      'assets/icons/applelogin.png',
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}

void _showSelectionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          'ท่านลงทะเบียนผู้ใช้ใหม่ในฐานะ ..',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOption(
              context,
              'บุคคลทั่วไป',
              () {
                Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => registerpage()),
                // );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Registerpage(
                    type: 'บุคคลทั่วไป',
                  );
                }));
              },
            ),
            _buildOption(
              context,
              'ร้านค้า',
              () {
                Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Legalpersonpage()),
                // );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Registerpage(
                    type: 'ร้านค้า',
                  );
                }));
              },
            ),
            // _buildOption(
            //   context,
            //   'ตัวแทน (Agent)',
            //   () {
            //     // Navigator.of(context).pop();
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(builder: (context) => Agentpage()),
            //     // );
            //   },
            // ),
          ],
        ),
      );
    },
  );
}

Widget _buildOption(BuildContext context, String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: red1, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: red1, // กำหนดสีตัวหนังสือให้เป็นสีแดง
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap,
    ),
  );
}
