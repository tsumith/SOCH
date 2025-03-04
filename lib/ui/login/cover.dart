import 'package:flutter/material.dart';
import 'package:soch/ui/splash/on_board_screen.dart';

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
              image: AssetImage('assets/images/cover2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Opacity(
          opacity: 0.02,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent]),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
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
                  // Navigator.pushNamed(context, '/signIn');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BoardingScreen();
                  }));
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
