import 'package:flutter/material.dart';

class ShowContentSEAWidget extends StatelessWidget {
  const ShowContentSEAWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.012),
      child: Stack(
        children: [
          Image.asset('assets/images/17.png'),
          Positioned(
              top: size.height * 0.06,
              left: size.width * 0.05,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'ประเภท ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SukhumvitSet'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'A',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.39,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.095,
              left: size.width * 0.05,
              child: Row(
                children: [
                  Text(
                    'สินค้าทั่วไป',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.12,
              left: size.width * 0.05,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'ประเภท ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SukhumvitSet'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'C',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.39,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.155,
              left: size.width * 0.05,
              child: Row(
                children: [
                  Text(
                    'สินค้ามาตราฐาน',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.185,
              left: size.width * 0.05,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'ประเภท ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SukhumvitSet'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'D',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.39,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.22,
              left: size.width * 0.05,
              child: Row(
                children: [
                  Text(
                    'สินค้ามาตราฐาน',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.258,
              left: size.width * 0.05,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'ประเภท ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SukhumvitSet'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'B',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.39,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.29,
              left: size.width * 0.05,
              child: Row(
                children: [
                  Text(
                    'สินค้าอื่นๆ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
