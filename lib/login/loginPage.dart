import 'package:cookingapp/constants.dart';
import 'package:cookingapp/home/firstPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.001,
              ),
              Container(
                height: size.height * 0.12,
                width: size.width * 0.23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 61.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.055,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 76.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.06,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(prefixIcon: Image.asset('assets/images/userlogin.png'), labelText: 'รหัสผู้นำเข้า', labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.06,
                child: TextField(
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
                      children: [GestureDetector(onTap: () {}, child: Image.asset('assets/icons/eyepass.png'))],
                    ),
                  ),
                  obscureText: true,
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
                        color: Colors.blue[700],
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
                height: size.height * 0.059,
                width: size.width * 0.87,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => FirstPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 219, 18, 4),
                    padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 219, 18, 4),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                    color: Color.fromARGB(255, 219, 18, 4), // สีของขอบ
                    width: 1,
                  ),
                ),
                onPressed: () {
                  _showSelectionDialog(context);
                },
                child: const Text(
                  'ลงทะเบียนผู้ใช้ใหม่',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 219, 18, 4),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Text(
                'หรือ',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset('assets/icons/google.png'),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Google',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Image.asset('assets/icons/facebook.png'),
                    ),
                    // SizedBox(
                    //   width: size.width * 0.03,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'ดำเนินการต่อด้วยบัญชี Facebook',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Image.asset(
                          'assets/icons/linelogin.png',
                          height: size.height * 0.03,
                        ),
                      ),
                      // SizedBox(
                      //   width: size.width * 0.03,
                      // ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Line',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 38),
                        child: Image.asset(
                          'assets/icons/applelogin.png',
                          height: size.height * 0.03,
                        ),
                      ),
                      // SizedBox(
                      //   width: size.width * 0.03,
                      // ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Apple',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => registerpage()),
                // );
              },
            ),
            _buildOption(
              context,
              'นิติบุคคล',
              () {
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Legalpersonpage()),
                // );
              },
            ),
            _buildOption(
              context,
              'ตัวแทน (Agent)',
              () {
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Agentpage()),
                // );
              },
            ),
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
