import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyLead extends StatefulWidget {
  const MonthlyLead({super.key});

  @override
  State<MonthlyLead> createState() => MonthlyLeadState();
}

class MonthlyLeadState extends State<MonthlyLead> {
  // ignore: library_private_types_in_public_api
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Jan', 35),
      _ChartData('Feb', 15),
      _ChartData('Mar', 25),
      _ChartData('Apr', 20),
      _ChartData('May', 30)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.7), width: 1),
         color: Color.fromARGB(255, 193, 193, 193),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text('Monthly Lead ',
                          style: TextStyle(color: Color.fromARGB(255, 119, 119, 119), fontSize: 20)),
                    ),
                  ],
                ),
                Card(
                  color: Colors.black,
                  elevation: 20,
                  child: SizedBox(
                    height: 340,
                    width: 450,
                    child: Column(children: [
                      SfCartesianChart(
                          title: const ChartTitle(
                              text: ' sales analysis',
                              textStyle: TextStyle(color: Colors.white)),
                          primaryXAxis: const CategoryAxis(
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          primaryYAxis:const NumericAxis(
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          tooltipBehavior: _tooltip,
                          series: <CartesianSeries<dynamic, dynamic>>[
                            ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              gradient:const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0, 1.1],
                                colors: [
                                  Colors.white,
                                  Colors.black,
                                  Colors.black
                                ],
                              ),
                            )
                          ]),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
