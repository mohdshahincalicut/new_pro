import 'package:flutter/material.dart';

import 'package:new_pro/Pages/FlPieChart.dart';
import 'package:new_pro/Pages/flpie_chart.dart';
import 'package:new_pro/Pages/heat_map_calender.dart';
import 'package:new_pro/Pages/time_series_chart.dart';
import 'package:new_pro/components/cards.dart';
import 'package:new_pro/components/chart_cards.dart';
import 'package:new_pro/components/daily_lead.dart';
import 'package:new_pro/components/monthly_lead.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 249, 249),
              ])),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.10),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border:
                            Border.all(color: Colors.black.withOpacity(.10))),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'DashBord',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.bakery_dining_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Your Progress',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Cards(
                    width: 150,
                    height: 100,
                    containercolors:  Color.fromARGB(255, 0, 0, 0),
                    avtarcolors:  Color.fromARGB(242, 57, 57, 57),
                    data1: 'Lead',
                    data2: '302',
                    data3: 'toda  400 lead',
                    icons: Icons.leaderboard,
                    width1: 150,
                    height1: 100,
                    containercolors1: Color.fromARGB(255, 0, 0, 0),
                    avtarcolors1: Color.fromARGB(242, 57, 57, 57),
                    icons1: Icons.person,
                    data4: 'Followup',
                    data5: '23',
                    data6: 'today 40Followup',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Cards(
                    width: 190,
                    height: 100,
                    containercolors:  Color.fromARGB(255, 0, 0, 0),
                    avtarcolors:  Color.fromARGB(242, 57, 57, 57),
                    data1: 'Call',
                    data2: 'Incoming',
                    data3: '06 Outgoing 25 ',
                    icons: Icons.phone,
                    width1: 110,
                    height1: 100,
                    containercolors1: Color.fromARGB(255, 0, 0, 0),
                    avtarcolors1:  Color.fromARGB(242, 57, 57, 57),
                    icons1: Icons.task,
                    data4: 'Task',
                    data5: '15',
                    data6: ' ',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const DailyLead(),
                  const SizedBox(
                    height: 50,
                  ),
                  const MonthlyLead(),
                  const SizedBox(
                    height: 50,
                  ),
                  Chartcards(
                    width: 150,
                    height: 80,
                    icons: Icons.pie_chart,
                    taxtdata: 'Pie Chart',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PieChart()));
                    },
                    icons1: Icons.calendar_view_month_sharp,
                    width1: 150,
                    height1: 80,
                    taxtdata1: 'Heatmap Calender',
                    onTap1: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HeatMapCalender()));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Chartcards(
                    width: 200,
                    height: 80,
                    taxtdata: 'Time Series Chart',
                    icons: Icons.ssid_chart_sharp,
                    width1: 100,
                    height1: 80,
                    icons1: Icons.pie_chart_outline_sharp,
                    taxtdata1: 'FlPieChart',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TimeSeriesChart()));
                    },
                    onTap1: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const FlPieChart()));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


