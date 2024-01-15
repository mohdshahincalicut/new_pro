import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tuple_dart/tuple.dart';

final data = <Tuple3<String, double, Color>>[
  Tuple3('housing', 1000, Colors.primaries[1]),
  Tuple3('food', 500, Colors.primaries[4]),
  Tuple3('health', 200, Colors.primaries[8]),
  Tuple3('trasport', 100, Colors.primaries[16]),
];

class FlPieChart extends StatefulWidget {
  const FlPieChart({super.key});

  @override
  FlPieChartState createState() => FlPieChartState();
}

class FlPieChartState extends State<FlPieChart> {
  int touchedIdx = -1;
  bool showBorder = true;
  double radius = 100;
  double innerRadius = 0;
  double sectionsSpace = 0;
  double startDegreeOffset = 180;
  
 

  @override
  Widget build(BuildContext context) {
   
    final pieChartSections = <PieChartSectionData>[
      for (int i = 0; i < data.length; ++i)
        PieChartSectionData(
          title: data[i].item1,
          value: data[i].item2,
          color: data[i].item3,
        
          radius: i == touchedIdx ? radius * 1.2 : radius,
        ),
    ];

    
    final pieChartData = PieChartData(
      sections: pieChartSections,
     
      pieTouchData: PieTouchData(
        enabled: true,
        touchCallback: (touchEvent, pieTouchResponse) => setState(() {
          if (pieTouchResponse?.touchedSection != null) {
            touchedIdx = pieTouchResponse!.touchedSection!.touchedSectionIndex;
          }
        }),
      ),
      centerSpaceRadius: innerRadius,
      sectionsSpace: sectionsSpace,
      startDegreeOffset: startDegreeOffset,
      borderData: FlBorderData(show: showBorder),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PieChart(pieChartData),
      ),
      bottomNavigationBar: _buildControlWidgets(),
    );
  }

  Widget _buildControlWidgets() {
    return Container(
      
      height: 350,
      color: Colors.black,
      child: ListView(
        children: [
          SwitchListTile(
            title: const Text('ShowBorder',style: TextStyle(color: Colors.white)),
            onChanged: (bool val) => setState(() => showBorder = val),
            value: showBorder,
          ),
          const ListTile(title: Text('Radius:',style: TextStyle(color: Colors.white),)),
          Slider(
            divisions: 15,
            min: 50,
            max: 200,
            onChanged: (double val) => setState(() => radius = val),
            value: radius,
            label: '$radius',
          ),
          const ListTile(title: Text('Inner circle radius:',style: TextStyle(color: Colors.white))),
          Slider(
            divisions: 10,
            max: 20,
            onChanged: (double val) => setState(() => innerRadius = val),
            value: innerRadius,
            label: '$innerRadius',
          ),
          const ListTile(title: Text('Sections space:',style: TextStyle(color: Colors.white))),
          Slider(
            divisions: 10,
            max: 10,
            onChanged: (double val) =>
                setState(() => sectionsSpace = val),
            value: sectionsSpace,
            label: '$sectionsSpace',
          ),
          const ListTile(title: Text('Start degree offset:',style: TextStyle(color: Colors.white))),
          Slider(
            max: 360,
            onChanged: (double val) =>
                setState(() => startDegreeOffset = val),
            value: startDegreeOffset,
            label: '$startDegreeOffset',
          ),
        ],
      ),
    );
  }
}