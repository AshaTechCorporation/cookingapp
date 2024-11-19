import 'package:cookingapp/Store/Graphs/graphsPage.dart';
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/model/food.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailFoodStorePage extends StatefulWidget {
  const DetailFoodStorePage({super.key, required this.foods});
  final Food foods;

  @override
  State<DetailFoodStorePage> createState() => _DetailFoodStorePageState();
}

class _DetailFoodStorePageState extends State<DetailFoodStorePage> {
  final ScrollController scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.072),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            //backgroundColor: Colors.red.withOpacity(appBarOpacity),
            backgroundColor: Colors.transparent,
            elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(width: 4),
                        Text(
                          "จำนวนจอง 15",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Center(child: Icon(Icons.share)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: SizedBox(
                        child: Image.asset(
                          widget.foods.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      //bottom: MediaQuery.of(context).size.height * (-30 / 800),
                      bottom: -330,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.44,
                            width: size.width * 0.92,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.width * 0.02),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Text(
                                          'ยอดรวมการสั่งอาหาร',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                                        ),
                                      ),
                                      Text(
                                        ' ${widget.foods.reviews} ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' ถุง',
                                        style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: size.height * 0.06,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 130,
                                  child: SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        radiusFactor: 2.5,
                                        centerX: 0.5,
                                        centerY: 0.9,
                                        startAngle: 180,
                                        endAngle: 0,
                                        showLabels: false,
                                        showAxisLine: false,
                                        showTicks: false,
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
                                        pointers: <GaugePointer>[NeedlePointer(value: widget.foods.reviews.toDouble())],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
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
                                        'กำไร',
                                        style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
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
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              // Container(
              //   // height: size.height * 0.44,
              //   width: size.width * 0.92,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.2),
              //         spreadRadius: 1,
              //         blurRadius: 1,
              //         offset: Offset(0, 2),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: size.height * 0.02,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.width * 0.02),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Expanded(
              //               flex: 12,
              //               child: Text(
              //                 widget.foods.name,
              //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
              //               ),
              //             ),
              //             Expanded(
              //               flex: 2,
              //               child: Text(
              //                 widget.foods.cal.toStringAsFixed(0),
              //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       // Padding(
              //       //   padding: EdgeInsets.symmetric(
              //       //     horizontal: size.width * 0.02,
              //       //   ),
              //       //   child: Wrap(
              //       //     children: [
              //       //       Text(
              //       //         widget.food.description ?? ' - ',
              //       //         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
              //       //       ),
              //       //     ],
              //       //   ),
              //       // ),
              //       Divider(),
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: size.width * 0.02,
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'ราคาอาหาร',
              //               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   '18 ตุลาคม 2567 - 19 ตุลาคม 2567',
              //                   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
              //                 ),
              //                 Text(
              //                   '50',
              //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   '20 ตุลาคม 2567 - 21 ตุลาคม 2567',
              //                   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
              //                 ),
              //                 Text(
              //                   '65',
              //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   '22 ตุลาคม 2567 - 24 ตุลาคม 2567',
              //                   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 16),
              //                 ),
              //                 Text(
              //                   '80',
              //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.all(8),
                child: SfCalendar(
                  view: CalendarView.month,
                  dataSource: MeetingDateSource(_getDataSource()),
                  todayHighlightColor: red1,
                  cellBorderColor: Colors.blue,
                  showNavigationArrow: true,
                  cellEndPadding: 5,
                  showCurrentTimeIndicator: true,
                  weekNumberStyle: const WeekNumberStyle(
                    backgroundColor: Colors.pink,
                    textStyle: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: red1, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                  monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    showAgenda: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              //   SizedBox(
              //       height: 300,
              //       child: SfRadialGauge(
              //         axes: <RadialAxis>[
              //           RadialAxis(
              //               startAngle: 180,
              //               endAngle: 360,
              //               radiusFactor: 0.9,
              //               canScaleToFit: true,
              //               interval: 10,
              //               showLabels: false,
              //               showAxisLine: false,
              //               pointers: <GaugePointer>[
              //                 MarkerPointer(
              //                     value: widget.foods.reviews.toDouble(),
              //                     // elevation: _elevation,
              //                     markerWidth: 25,
              //                     markerHeight: 25,
              //                     color: const Color(0xFFF67280),
              //                     markerType: MarkerType.circle,
              //                     markerOffset: -7)
              //               ],
              //               annotations: <GaugeAnnotation>[
              //                 GaugeAnnotation(
              //                     angle: 175,
              //                     positionFactor: 0.8,
              //                     widget: Text('ยอดขาย',
              //                         style: TextStyle(
              //                             // fontSize: isCardView ? 12 : 16,
              //                             fontWeight: FontWeight.bold))),
              //                 GaugeAnnotation(
              //                     angle: 270,
              //                     positionFactor: 0.1,
              //                     widget: Text(
              //                       'จำนวนจอง ${widget.foods.reviews}\n\nยอดที่ต้องการ 60 ',
              //                       style: TextStyle(
              //                           // fontSize: isCardView ? 12 : 16,
              //                           fontWeight: FontWeight.bold),
              //                       textAlign: TextAlign.center,
              //                     )),
              //                 GaugeAnnotation(
              //                     angle: 5,
              //                     positionFactor: 0.8,
              //                     widget: Text('Max',
              //                         style: TextStyle(
              //                             // fontSize: isCardView ? 12 : 16,
              //                             fontWeight: FontWeight.bold)))
              //               ],
              //               ranges: <GaugeRange>[
              //                 GaugeRange(
              //                   startValue: 0,
              //                   endValue: 100,
              //                   sizeUnit: GaugeSizeUnit.factor,
              //                   gradient: const SweepGradient(colors: <Color>[Color(0xFFAB64F5), Color(0xFF62DBF6)], stops: <double>[0.25, 0.75]),
              //                   startWidth: 0.4,
              //                   endWidth: 0.4,
              //                   color: const Color(0xFF00A8B5),
              //                 )
              //               ],
              //               showTicks: false),
              //         ],
              //       )),
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.08,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.45,
              height: size.height * 0.05,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: TextButton(
                  onPressed: () async {},
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.45,
              height: size.height * 0.05,
              decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: TextButton(
                  onPressed: () async {},
                  child: Text(
                    'ทำอาหาร',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    List<Meeting> meets = <Meeting>[
      Meeting(widget.foods.name, DateTime(2024, 11, 18), DateTime(2024, 11, 24), red1, true),
    ];
    // meets.add(Meeting('ทำอาหาร', DateTime.now(), DateTime.now().add(Duration(minutes: 30)), Colors.pink, true));
    return meets;
  }
}
