import 'package:flutter/material.dart';

class Chartcards extends StatefulWidget {
  final double width;
  final double width1;
  final double height;
  final double height1;
  final IconData? icons;
  final IconData? icons1;
  final String taxtdata;
  final String taxtdata1;
  final Function()? onTap;
  final Function()? onTap1;
  const Chartcards(
      {super.key,
      required this.width,
      required this.width1,
      required this.height,
      required this.height1,
      required this.icons,
      required this.icons1,
      required this.taxtdata,
      required this.taxtdata1,
      this.onTap,
      this.onTap1});

  @override
  State<Chartcards> createState() => ChartcardsState();
}

class ChartcardsState extends State<Chartcards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            shadowColor: Colors.blue,
            elevation: 8,
           color: Colors.black,
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                height: widget.height,
                width: widget.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Text(widget.taxtdata,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 211, 211, 211),
                              fontSize: 15)),
                    ),
                    Icon(
                      widget.icons,
                      size: 30,
                      color: const Color.fromARGB(255, 193, 193, 193),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.blue,
            elevation: 8,
            
            color: Colors.black,
            child: InkWell(
              onTap: widget.onTap1,
              child: Container(
                height: widget.height1,
                width: widget.width1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Text(widget.taxtdata1,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 211, 211, 211),
                              fontSize: 15)),
                    ),
                    Icon(
                      widget.icons1,
                      size: 30,
                      color: const Color.fromARGB(255, 193, 193, 193),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
