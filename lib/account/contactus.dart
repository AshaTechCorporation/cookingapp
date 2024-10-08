import 'package:cookingapp/constants.dart';
import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'เกี่ยวกับเรา',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Center(
            //     child: Image.asset(
            //   'assets/images/logofull.png',
            //   width: 268,
            //   height: 85,
            // )),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: 365,
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'เราคือ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'SukhumvitSet'),
                          children: <TextSpan>[
                        TextSpan(
                          text: ' กับข้าว',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              fontFamily: 'SukhumvitSet'),
                        )
                      ])),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet porta lorem. Sed sollicitudin turpis nec hendrerit hendrerit. Praesent id tellus id leo sodales scelerisque nec id tellus. Ut justo justo, hendrerit nec risus sed, ornare dapibus est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sagittis elit ut nisl feugiat, eget convallis nunc efficitur. Praesent in lacus ac erat congue viverra.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '   Nulla eu leo sagittis, accumsan nunc eget, scelerisque ipsum. Aliquam erat volutpat. Curabitur et fringilla mauris, sit amet suscipit nisl. Proin porta egestas sodales. Donec vitae semper ipsum. Nulla vel vulputate nunc. Nullam pretium accumsan metus a placerat.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Cras pretium arcu ut elementum imperdiet. Quisque at eros dignissim, condimentum orci quis, hendrerit est. Suspendisse porta neque et interdum congue. Aenean luctus dui non augue congue, eget fringilla est tristique. Nullam pulvinar ex eget nisi consectetur mattis. Vestibulum varius, urna sit amet efficitur elementum, elit',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // Image.asset('assets/images/exitway.png')
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.88,
              child: Row(
                children: [
                  Text(
                    'ช่องทางการติดต่ออื่นๆ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.001,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContactContainer(
                      size: size,
                      color: red1,
                      // imagePath: '',
                      text: '0000000000',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: red1,
                      // imagePath: '',
                      text: 'Sale@กับข้าว.net',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: green,
                      // imagePath: '',
                      text: '18520290139',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: green,
                      // imagePath: '',
                      text: '@กับข้าว',
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildContactContainer(
                      size: size,
                      color: blue,
                      // imagePath: '',
                      text: 'กับข้าว',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildContactContainer({
  required Size size,
  required Color color,
  // required String imagePath,
  required String text,
}) {
  return Container(
    height: size.height * 0.05,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0),
        //   child: Image.asset(
        //     imagePath, // ใช้ Image.asset แทน Icon
        //     // color: Colors.white, // หากต้องการให้ภาพเป็นสีขาว
        //     width: 24,
        //     height: 24,
        //   ),
        // ),
        Spacer(),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(), // ทำให้ Text อยู่ตรงกลาง
      ],
    ),
  );
}