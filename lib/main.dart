import 'package:flutter/material.dart';
import 'package:timer_app/screeens/timer_screen.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}
