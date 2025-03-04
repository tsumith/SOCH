import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soch/ui/components/board_page.dart';
import 'package:soch/ui/login/signIn.dart';

class BoardingScreen extends StatefulWidget {
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  Timer? timer;
  int totalPages = 4;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (tmr) {
      if (currentPage < totalPages - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(currentPage,
          duration: Duration(seconds: 1), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    timer!.cancel(); // Stop the timer when screen is closed
    pageController.dispose();
    super.dispose();
  }

  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: pageController,
          children: [
            BoardPage(url: "assets/images/onboard/onboard1.jpg"),
            BoardPage(url: "assets/images/onboard/onboard2.jpg"),
            BoardPage(url: "assets/images/onboard/onboard3.jpg"),
            BoardPage(url: "assets/images/onboard/onboard4.jpg"),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(30)),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: totalPages,
                effect: JumpingDotEffect(
                    activeDotColor: const Color.fromARGB(255, 97, 97, 97),
                    dotColor: const Color.fromARGB(255, 5, 5, 5),
                    dotHeight: 8,
                    dotWidth: 8,
                    verticalOffset: 15,
                    jumpScale: 0.7),
              ),
            ),
            FloatingActionButton.extended(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return SignInPage();
                  }));
                },
                label: Text(
                  "continue",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
