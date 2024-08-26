import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer_app/utilities/constants.dart';

class StopWatchTimerPage extends StatefulWidget {
  const StopWatchTimerPage({Key? key}) : super(key: key);

  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Timer',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: 0,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Text(
                  displayTime,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButtonStyle,
                  onPressed: () {
                    _stopWatchTimer.onStartTimer();
                  },
                  child: Text('Start', style: Textstyle),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButtonStyle,
                  onPressed: () {
                    _stopWatchTimer.onStopTimer();
                  },
                  child: Text('Stop', style: Textstyle),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButtonStyle,
                  onPressed: () {
                    _stopWatchTimer.onResetTimer();
                  },
                  child: Text('Reset', style: Textstyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
