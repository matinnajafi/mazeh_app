import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:flutter/material.dart';

class AnalogClock extends StatelessWidget {
  const AnalogClock({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedAnalogClock(
      size: 52,
      clock: () => DateTime.now(),
      backgroundColor: Color(0xff1E1E26),
      hourHandColor: Colors.lightBlueAccent,
      minuteHandColor: Colors.lightBlueAccent,
      secondHandColor: Colors.amber,
      centerDotColor: Colors.amber,
      hourDashColor: Colors.lightBlue,
      minuteDashColor: Colors.blueAccent,
    );
  }
}
