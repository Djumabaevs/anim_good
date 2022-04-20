import 'package:flutter/cupertino.dart';

class ArrowIcons extends StatelessWidget {
  const ArrowIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 0,
      child: Column(children: [
        IconUp(),
        IconDown(),
      ]),
    );
  }
}
