import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatMapCalender extends StatefulWidget {
  const HeatMapCalender({super.key});

  @override
  State<HeatMapCalender> createState() => HeatMapCalenderState();
}

DateTime removeHMS(DateTime d) => DateTime(d.year, d.month, d.day);

Map<DateTime, int> genDummyDateset() {
  final today = removeHMS(DateTime.now());
  return {
    today.subtract(const Duration(days: 1)): 40,
    today.subtract(const Duration(days: 2)): 30,
    today.subtract(const Duration(days: 3)): 10,
    today.subtract(const Duration(days: 5)): 25,
    today.subtract(const Duration(days: 7)): 15,
    today.subtract(const Duration(days: 10)): 10,
    today.subtract(const Duration(days: 14)): 10,
    today.subtract(const Duration(days: 28)): 5,
  };
}

class HeatMapCalenderState extends State<HeatMapCalender> {
  ColorMode colorMode = ColorMode.color;
  bool showText = false;
  bool scrollable = true;
  bool showColorTip = false;
  double size = 30;

  static const kColorMap = {
    1: Colors.red,
    3: Colors.orange,
    5: Colors.yellow,
    10: Colors.green,
    15: Colors.blue,
    20: Colors.indigo,
    30: Colors.purple,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          HeatMap(
            datasets: genDummyDateset(),
            startDate: null,
            endDate: null,
            size: size,
            colorMode: colorMode,
            showText: showText,
            scrollable: scrollable,
            showColorTip: showColorTip,
            colorsets: kColorMap,
            onClick: (date) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(SnackBar(content: Text(date.toString())));
            },
          ),
          const Divider(),
          ..._controlWidgets(),
        ],
      ),
    );
  }

  List<Widget> _controlWidgets() => [
        SwitchListTile(
          title: const Text('showText:',
            style: TextStyle(color: Colors.white)),
          onChanged: (bool val) => setState(() => showText = val),
          value: showText,
        ),
        SwitchListTile(
          title: const Text('scrollable:',
            style: TextStyle(color: Colors.white)),
          onChanged: (bool val) => setState(() => scrollable = val),
          value: scrollable,
        ),
        SwitchListTile(
          title: const Text('showColorTip:',
            style: TextStyle(color: Colors.white)),
          onChanged: (bool val) => setState(() => showColorTip = val),
          value: showColorTip,
        ),
        ListTile(
          title: Text('size (of each block): $size',
            style: TextStyle(color: Colors.white)),
          subtitle: Slider(
              min: 10,
              max: 50,
              divisions: 8,
              label: size.toString(),
              value: size,
              onChanged: (v) => setState(() => size = v)),
        ),
        ListTile(
            title: const Text('colorMode:',
            style: TextStyle(color: Colors.white)),
            trailing: DropdownButton<ColorMode>(
              dropdownColor: const Color.fromARGB(255, 54, 54, 54),
            style: const TextStyle(color: Colors.white),
              value: colorMode,
              onChanged: (ColorMode? newVal) {
                if (newVal != null) setState(() => colorMode = newVal);
              },
              items: [
                for (final val in ColorMode.values)
                  DropdownMenuItem(value: val, child: Text('$val'))
              ],
            ))
      ];
}
