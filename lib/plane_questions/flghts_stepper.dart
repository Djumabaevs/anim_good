import 'package:anim_good/plane_questions/page.dart';
import 'package:anim_good/plane_questions/plane.dart';
import 'package:flutter/cupertino.dart';

import 'arrow_icons.dart';
import 'line.dart';

class FlightsStepper extends StatefulWidget {
  FlightsStepper({Key? key}) : super(key: key);

  @override
  State<FlightsStepper> createState() => _FlightsStepperState();
}

class _FlightsStepperState extends State<FlightsStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration,
      child: SafeArea(
        child: Stack(
          children: [
            ArrowIcons(),
            Plane(),
            Line(),
            PageV(),
          ],
        ),
      ),
    );
  }
}
