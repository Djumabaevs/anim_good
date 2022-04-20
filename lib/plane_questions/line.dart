import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 40.0 + 32,
        top: 40,
        bottom: 0,
        width: 1,
        child: Container(
          color: Colors.white.withOpacity(0.5),
        ));
  }
}
