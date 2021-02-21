import 'package:flutter/material.dart';

// Add an image to the background
class HomeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 4 / 12,
      child: Image.asset(
        "assets/images/background2.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
