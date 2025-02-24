import 'package:flutter/material.dart';

class CoverPage extends StatefulWidget {
  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/start_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Opacity(
          opacity: 0.60,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color.fromARGB(255, 228, 225, 44),
                  const Color.fromARGB(255, 166, 167, 161),
                  const Color.fromARGB(255, 170, 156, 74),
                  const Color.fromARGB(255, 122, 122, 89),
                  const Color.fromARGB(255, 255, 255, 255),
                ])),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Join us",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(235, 236, 228, 118),
                      const Color.fromARGB(255, 233, 195, 9),
                    ]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "let's go!!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: double.infinity,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/signIn');
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
