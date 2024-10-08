import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailFoodGraphs extends StatefulWidget {
  const DetailFoodGraphs({super.key});

  @override
  State<DetailFoodGraphs> createState() => _DetailFoodGraphsState();
}

class _DetailFoodGraphsState extends State<DetailFoodGraphs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ยอดการสั่งอาหาร',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 130,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    radiusFactor: 2,
                    centerX: 0.5,
                    centerY: 0.9,
                    startAngle: 180,
                    endAngle: 0,
                    showLabels: false,
                    showAxisLine: false,
                    showTicks: false,
                    ticksPosition: ElementsPosition.outside,
                    labelsPosition: ElementsPosition.outside,
                    minimum: 1,
                    maximum: 101,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 20,
                        color: Colors.red,
                        sizeUnit: GaugeSizeUnit.factor,
                        // label: 'Slow',
                        // labelStyle: GaugeTextStyle(fontSize: 12),
                        startWidth: 0.4,
                        endWidth: 0.4,
                      ),
                      GaugeRange(
                        startValue: 21,
                        endValue: 40,
                        color: Color.fromARGB(255, 255, 136, 0),
                        sizeUnit: GaugeSizeUnit.factor,
                        // label: 'Slow',
                        // labelStyle: GaugeTextStyle(fontSize: 12),
                        startWidth: 0.4,
                        endWidth: 0.4,
                      ),
                      GaugeRange(
                        startValue: 41,
                        endValue: 60,
                        color: Color(0xFFFFBA00),
                        // label: 'Moderate',
                        // labelStyle: GaugeTextStyle(fontSize: 12),
                        startWidth: 0.4,
                        endWidth: 0.4,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                      GaugeRange(
                        startValue: 61,
                        endValue: 80,
                        color: Color.fromARGB(255, 148, 171, 0),
                        // label: 'Fast',
                        // labelStyle: GaugeTextStyle(fontSize: 12),
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.4,
                        endWidth: 0.4,
                      ),
                      GaugeRange(
                        startValue: 81,
                        endValue: 101,
                        color: Color.fromARGB(255, 0, 118, 49),
                        // label: 'Fast',
                        // labelStyle: GaugeTextStyle(fontSize: 12),
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.4,
                        endWidth: 0.4,
                      ),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: 25)],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ขาดทุน',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Color.fromARGB(255, 255, 136, 0),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ขาดทุดน้อย',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Color(0xFFFFBA00),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'เท่าทุน',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Color.fromARGB(255, 148, 171, 0),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'กำลังพอประมาณ',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Color.fromARGB(255, 0, 118, 49),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'กำไรเยอะ',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Center(
              child: Text(
                'รายการ: แกงเขียวหวาน',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ต้นทุน: 500 บาท',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ยอดที่ต้องการ: 50 ถุง',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
