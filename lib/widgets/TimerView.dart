import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

const clockTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 24,
);

class TimerView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TimerViewState();
}

class _DigitalClockTimerState extends State<TimerView>{
  @override
  Widget build(BuildContext context) => DigitalClock(
    is24HourTimeFormat: true,
    showSecondsDigit: false,
    areaDecoration: BoxDecoration(
        color: Colors.transparent
    ),
    hourMinuteDigitTextStyle: clockTextStyle
  );

}

class _TimerViewState extends State<TimerView>{
  DateTime _time = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    //Start timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Text(
      "Heute, ${_time.hour}:${_time.minute}",
  style: clockTextStyle,);

  @override
  void dispose() {
    super.dispose();
    //end Timer
    _timer?.cancel();
  }
}