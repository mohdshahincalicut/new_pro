import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double width;
  final double width1;
  final double height;
  final double height1;
  final Color containercolors;
  final Color containercolors1;
  final Color avtarcolors;
  final Color avtarcolors1;
  final IconData? icons;
  final IconData? icons1;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final String data5;
  final String data6;

  const Cards(
      {super.key,
      required this.width,
      required this.height,
      required this.containercolors1,
      required this.avtarcolors,
      required this.data1,
      required this.data2,
      required this.data3,
      required this.icons,
      required this.width1,
      required this.height1,
      required this.containercolors,
      required this.avtarcolors1,
      required this.icons1,
      required this.data4,
      required this.data5,
      required this.data6});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 10,
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.containercolors,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: widget.avtarcolors,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(
                          widget.icons,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(children: [
                          Text(
                            widget.data1,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.data2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.data3,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 10,
                child: Container(
                  height: widget.height1,
                  width: widget.width1,
                  decoration: BoxDecoration(
                    color: widget.containercolors1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: widget.avtarcolors1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(
                          widget.icons1,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(children: [
                          Text(
                            widget.data4,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.data5,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.data6,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
