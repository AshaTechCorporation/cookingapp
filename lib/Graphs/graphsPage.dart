import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        // minX: 0,
        // maxX: 14,
        // maxY: 7,
        // minY: 0,
        minX: 1,
        maxX: 14,
        minY: 1,
        maxY: 9,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 10,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
        lineChartBarData2_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '100';
        break;
      case 3:
        text = '150';
        break;
      case 4:
        text = '200';
        break;
      case 5:
        text = '300';
        break;
      case 6:
        text = '500';
        break;
      case 7:
        text = '600';
        break;
      case 8:
        text = '800';
        break;
      case 9:
        text = '1000';
        break;
      // case 10:
      //   text = '100';
      //   break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        // showTitles: true,
        // reservedSize: 32,
        // interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.cyan,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.cyan,
            strokeWidth: 1,
          );
        },
      );

  // FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.blue, width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.grey,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, (60 / 10)),
          FlSpot(3, (60 / 10)),
          FlSpot(5, (60 / 10)),
          FlSpot(7, (60 / 10)),
          FlSpot(10, (60 / 10)),
          FlSpot(12, (60 / 10)),
          FlSpot(13, (60 / 10)),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.orange,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink,
        ),
        spots: const [
          FlSpot(1, (10 / 10)),
          FlSpot(3, (30 / 10)),
          FlSpot(7, (40 / 10)),
          FlSpot(10, (45 / 10)),
          FlSpot(12, (60 / 10)),
          FlSpot(13, (80 / 10)),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, (10 / 10)),
          FlSpot(3, (50 / 10)),
          FlSpot(7, (15 / 10)),
          FlSpot(10, (20 / 10)),
          FlSpot(12, (50 / 10)),
          FlSpot(13, (65 / 10)),
        ],
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.orange,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Colors.purple,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.pink,
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.red,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text(
          //   'ยอดการสั่งอาหาร',
          //   style: TextStyle(
          //     color: Colors.amber,
          //     fontSize: 25,
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 2,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 155, 17, 179),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'ยอดการสั่งอาหาร',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16, left: 6),
                              child: _LineChart(isShowingMainData: isShowingMainData),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.refresh,
                      //     color: Colors.grey.withOpacity(isShowingMainData ? 1.0 : 0.5),
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       isShowingMainData = !isShowingMainData;
                      //     });
                      //   },
                      // )
                    ],
                  ),
                ),
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
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'กำไร: 800 บาท',
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
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'กำลังจะกำไร: 650 บาท',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      centerX: 0.5,
                      centerY: 0.8,
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
                      pointers: <GaugePointer>[NeedlePointer(value: 60)],
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
              // SfLinearGauge(
              //     minimum: 0.0,
              //     maximum: 100.0,
              //     orientation: LinearGaugeOrientation.horizontal,
              //     majorTickStyle: LinearTickStyle(length: 20),
              //     axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
              //     axisTrackStyle: LinearAxisTrackStyle(color: Colors.cyan, edgeStyle: LinearEdgeStyle.bothFlat, thickness: 15.0, borderColor: Colors.grey)),
              SfRadialGauge(
                title: GaugeTitle(text: 'ยอดการสั่งอาหาร', textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 2000,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 650, color: Colors.green, startWidth: 10, endWidth: 10),
                      GaugeRange(startValue: 651, endValue: 1300, color: Colors.orange, startWidth: 10, endWidth: 10),
                      GaugeRange(startValue: 1301, endValue: 2000, color: Colors.red, startWidth: 10, endWidth: 10)
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: 800)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(widget: Container(child: const Text('800', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))), angle: 90, positionFactor: 0.5)
                    ],
                  ),
                ],
              ),
              Center(
                child: Text(
                  'รายชื่อผู้ซื้อ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: listPerson.length,
                    itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('ลำดับที่ ${index + 1}'),
                              Text('คุณ. ${listPerson[index]['name']}'),
                              Text('จำนวน: ${listPerson[index]['total']}'),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> listPerson = [
    {
      'name': 'บัญชา',
      'total': 2,
    },
    {
      'name': 'กะทิ',
      'total': 1,
    },
    {
      'name': 'มี้',
      'total': 1,
    },
    {
      'name': 'สิง',
      'total': 5,
    },
    {
      'name': 'ยามา',
      'total': 2,
    },
    {
      'name': 'จน',
      'total': 1,
    },
    {
      'name': 'ไข่',
      'total': 10,
    },
    {
      'name': 'มา',
      'total': 3,
    },
  ];
}
