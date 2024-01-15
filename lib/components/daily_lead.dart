import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DailyLead extends StatefulWidget {
  const DailyLead({super.key});

  @override
  State<DailyLead> createState() => _DailyLeadState();
}

class _DailyLeadState extends State<DailyLead> {
  List<_SalesData> data = [
    _SalesData('Mon', 35),
    _SalesData('Tue', 10),
    _SalesData('Wed', 25),
    _SalesData('Thu', 40),
    _SalesData('Fri', 30)
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.7), width: 1),
          color: const Color.fromARGB(255, 219, 218, 218),
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
                      child: Text('Daily  Lead ',
                          style: TextStyle(color: Color.fromARGB(255, 119, 119, 119), fontSize: 20)),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 20,
                  child: SizedBox(
                    height: 340,
                    width: 450,
                    child: Column(children: [
                      SfCartesianChart(
                          primaryXAxis: const CategoryAxis(
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          primaryYAxis: const CategoryAxis(
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          title: const ChartTitle(
                              text: ' sales analysis',
                              textStyle: TextStyle(color: Colors.white)),
                          legend: const Legend(
                              isVisible: true,
                              textStyle: TextStyle(color: Colors.white)),
                          series: <CartesianSeries<dynamic, dynamic>>[
                            LineSeries<_SalesData, String>(
                                dataSource: data,
                                xValueMapper: (_SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (_SalesData sales, _) =>
                                    sales.sales,
                                name: 'Sales',
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(color: Colors.white),
                                    borderColor: Colors.white))
                          ]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SfSparkLineChart.custom(
                            trackball: const SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            marker: const SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            xValueMapper: (int index) => data[index].year,
                            yValueMapper: (int index) => data[index].sales,
                            dataCount: 5,
                          ),
                        ),
                      )
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
