// ignore_for_file: file_names

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Constants/constants.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: AnalogClock(
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              width: 150,
              height: 150,
              isLive: true,
              tickColor: Colors.amber[400]!,
              showAllNumbers: false,
              hourHandColor: Colors.white54,
              minuteHandColor: Colors.white54,
              secondHandColor: Colors.blue,
              showSecondHand: true,
              numberColor: Colors.white54,
              showNumbers: true,
              textScaleFactor: 1.5,
              showTicks: true,
              showDigitalClock: false,
              digitalClockColor: Colors.amber[400]!,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            DateFormat("yyyy").format(DateTime.now()),
            style: TextStyle(
                color: Colors.amber[400], fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            DateFormat("MMMM dd EEEE").format(DateTime.now()),
            style: TextStyle(color: Colors.amber[400]),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
