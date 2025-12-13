import 'package:flutter/material.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/analog_clock.dart';

class HeaderRowClockWithWeather extends StatelessWidget {
  const HeaderRowClockWithWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const AnalogClock(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset('images/sunny.png'),
            ),
            const Text(
              '۲۴°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'CM',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
