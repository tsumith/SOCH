import 'package:flutter/material.dart';

class CoverGraphics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double radius1 = MediaQuery.of(context).size.height * 0.10;
    double radius2 = MediaQuery.of(context).size.height * 0.13;
    double radius3 = MediaQuery.of(context).size.height * 0.16;
    double radius4 = MediaQuery.of(context).size.height * 0.05;
    // TODO: implement build
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: radius4,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 168, 167, 160),
                  const Color.fromARGB(255, 15, 15, 15)
                ]),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(radius4))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: radius1,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color.fromARGB(255, 153, 151, 144),
                      const Color.fromARGB(255, 24, 24, 24)
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius1),
                    topRight: Radius.circular(radius1))),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: radius3,
            width: radius3,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 231, 198, 79),
                  Colors.yellow
                ]),
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(radius3))),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: radius2,
            width: radius2,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 231, 198, 79),
                  Colors.yellow
                ]),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(radius2))),
          ),
        ),
      ],
    );
  }
}
