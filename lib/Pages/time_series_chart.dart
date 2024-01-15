import 'dart:math';
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
as charts;

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);

  DateTime get date => DateTime(year);
}

List<SalesData> genRandData() {
  final random = Random();

  return [
    for (int i = 2010; i < 2024; ++i)
      SalesData(i, ((i - 2000) * 40 + random.nextInt(100))),
  ];
}

class TimeSeriesChart extends StatefulWidget {
  const TimeSeriesChart({super.key});

  @override
  TimeSeriesChartState createState() => TimeSeriesChartState();
}

class TimeSeriesChartState extends State<TimeSeriesChart> {
  bool animate = true;
  bool defaultInteractions = true;
  bool includeArea = true;
  bool includePoints = true;
  bool stacked = true;
  charts.BehaviorPosition titlePosition = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition legendPosition = charts.BehaviorPosition.bottom;

  late List<SalesData> series1, series2;

  @override
  void initState() {
    super.initState();
    series1 = genRandData();
    series2 = genRandData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          SizedBox(
            height: 300,
            child: charts.TimeSeriesChart(
            
             
              [
                charts.Series<SalesData, DateTime>(
                  id: 'Sales-1',
                  colorFn: (i, _) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (SalesData sales, _) => sales.date,
                  measureFn: (SalesData sales, _) => sales.sales,
                  data: series1,
                ),
                charts.Series<SalesData, DateTime>(
                  id: 'Sales-2',
                  colorFn: (i, _) => charts.MaterialPalette.red.shadeDefault,
                  domainFn: (SalesData sales, _) => sales.date,
                  measureFn: (SalesData sales, _) => sales.sales,
                  data: series2,
                ),
              ],
              defaultInteractions: defaultInteractions,
              defaultRenderer: charts.LineRendererConfig(
                includePoints: includePoints,
                includeArea: includeArea,
                stacked: stacked,
              ),
              animate: animate,
              behaviors: [
                charts.ChartTitle(
                  ' sales time series',
                  titleStyleSpec:
                      const charts.TextStyleSpec(color: charts.Color.white),
                  behaviorPosition: titlePosition,
                ),
                charts.SeriesLegend(position: legendPosition),
                charts.LinePointHighlighter(
                  showHorizontalFollowLine:
                      charts.LinePointHighlighterFollowLineType.all,
                  showVerticalFollowLine:
                      charts.LinePointHighlighterFollowLineType.nearest,
                ),
              ],
            ),
          ),
          const Divider(),
          ..._controlWidgets(),
        ],
      ),
    );
  }

  List<Widget> _controlWidgets() => <Widget>[
        SwitchListTile(
          title: const Text(
            'animate',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool val) => setState(() => animate = val),
          value: animate,
        ),
        SwitchListTile(
          title: const Text(
            'defaultInteractions',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool val) => setState(() => defaultInteractions = val),
          value: defaultInteractions,
        ),
        SwitchListTile(
          title: const Text(
            'includePoints',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool val) => setState(() => includePoints = val),
          value: includePoints,
        ),
        SwitchListTile(
          title: const Text(
            'includeArea',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool val) => setState(() => includeArea = val),
          value: includeArea,
        ),
        SwitchListTile(
          title: const Text(
            'stacked',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool val) => setState(() => stacked = val),
          value: stacked,
        ),
        ListTile(
          title: const Text(
            'titlePosition:',
            style: TextStyle(color: Colors.white),
          ),
          trailing: DropdownButton<charts.BehaviorPosition>(
            dropdownColor: const Color.fromARGB(255, 54, 54, 54),
            style: const TextStyle(color: Colors.white),
            value: titlePosition,
            onChanged: (charts.BehaviorPosition? newVal) {
              if (newVal != null) {
                setState(() => titlePosition = newVal);
              }
            },
            items: [
              for (final val in charts.BehaviorPosition.values)
                DropdownMenuItem(value: val, child: Text('$val'))
            ],
          ),
        ),
        ListTile(
            title: const Text(
              'legendPosition:',
              style: TextStyle(color: Colors.white),
            ),
            trailing: DropdownButton<charts.BehaviorPosition>(
              dropdownColor: const Color.fromARGB(255, 54, 54, 54),
              style: const TextStyle(color: Colors.white),
              value: legendPosition,
              onChanged: (charts.BehaviorPosition? newVal) {
                if (newVal != null) {
                  setState(() => legendPosition = newVal);
                }
              },
              items: [
                for (final val in charts.BehaviorPosition.values)
                  DropdownMenuItem(value: val, child: Text('$val'))
              ],
            ))
      ];
}
