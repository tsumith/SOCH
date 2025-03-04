import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  String url;
  BoardPage({required this.url});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.black,
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(url, fit: BoxFit.cover),
            )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: MediaQuery.of(context).size.height * 0.3,
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color.fromARGB(166, 0, 0, 0),
                    Colors.black
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.35 +
              MediaQuery.of(context).size.height * 0.5,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          child: Center(child: Text("text goes here")),
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 230, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
    ]);
  }
}
