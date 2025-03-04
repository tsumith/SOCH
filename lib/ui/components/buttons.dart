import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  String url;
  Function onTap;
  Button1({required this.url, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(this.url, fit: BoxFit.cover),
                SizedBox(
                  width: 4.0,
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(45, 129, 129, 129),
        ),

        height: 50,
      ),
    );
  }
}
