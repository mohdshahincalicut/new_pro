import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:new_pro/Pages/FlPieChart.dart';


class CostsData {
  final String category;
  final int cost;

  const CostsData(this.category, this.cost);
}

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  PieChartState createState() => PieChartState();
}

class PieChartState extends State<PieChart> {
  
  bool animate = true;
  bool defaultInteractions = true;
  double arcRatio = 0.8;
  charts.ArcLabelPosition arcLabelPosition = charts.ArcLabelPosition.auto;
  charts.BehaviorPosition titlePosition = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition legendPosition = charts.BehaviorPosition.bottom;

  
  final List<CostsData> _data = [
    CostsData('housing', 1000),
     CostsData('food', 500),
     CostsData('health', 200),
     CostsData('trasport', 100),
  ];

  @override
  Widget build(BuildContext context) {
    final colorPalettes =
        charts.MaterialPalette.getOrderedPalettes(data.length);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          SizedBox(
            height: 300,
            child: charts.PieChart<String>(
              [
                charts.Series<CostsData, String>(
                  id: 'Sales-1',
                  colorFn: (_, idx) => colorPalettes[idx!].shadeDefault,
                  domainFn: (CostsData sales, _) => sales.category,
                  measureFn: (CostsData sales, _) => sales.cost,
                  data: _data,
                  labelAccessorFn: (CostsData row, _) =>
                      '${row.category}: ${row.cost}',
                ),
              ],
              animate: animate,
              defaultRenderer: charts.ArcRendererConfig(
                arcRatio: arcRatio,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(labelPosition: arcLabelPosition)
                ],
              ),
              behaviors: [
                charts.ChartTitle(
                  'costs breakup',
                  titleStyleSpec: charts.TextStyleSpec(color: charts.Color.white),
                  behaviorPosition: titlePosition,
                  
                ),
                //
                charts.DatumLegend(
                  position: legendPosition,
                  desiredMaxRows: 1,
                  entryTextStyle:charts.TextStyleSpec(color: charts.Color.white)
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

  List<Widget> _controlWidgets() => [
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
        const ListTile(
            title: Text(
          'Arc width ratio w.r.t. radius:',
          style: TextStyle(color: Colors.white),
        )),
        Slider(
          divisions: 10,
          onChanged: (double val) => setState(() => arcRatio = val),
          value: arcRatio,
          label: '$arcRatio',
        ),
        ListTile(
          title: const Text(
            'arcLabelPosition:',
            style: TextStyle(color: Colors.white),
          ),
          trailing: DropdownButton<charts.ArcLabelPosition>(
            dropdownColor: const Color.fromARGB(255, 54, 54, 54),
            style: const TextStyle(color: Colors.white),
            value: arcLabelPosition,
            onChanged: (charts.ArcLabelPosition? newVal) {
              if (newVal != null) {
                setState(() => arcLabelPosition = newVal);
              }
            },
            items: [
              for (final val in charts.ArcLabelPosition.values)
                DropdownMenuItem(value: val, child: Text('$val'))
            ],
          ),
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
          ),
        ),
      ];
}
