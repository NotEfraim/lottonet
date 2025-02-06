import 'dart:async';
import 'package:flutter/material.dart';

class CustomSlideCountdown extends StatefulWidget {
  final Function onAnimationDone;
  final Duration initialDuration; // Renamed and now used as initial duration

  const CustomSlideCountdown(
      {super.key,
      required this.initialDuration,
      required this.onAnimationDone});

  @override
  _CountUpTimerState createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CustomSlideCountdown> {
  late Duration duration; // Now mutable
  Timer? timer;

  @override
  void initState() {
    super.initState();
    duration = widget.initialDuration; // Initialize with the provided duration
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => subtractTime());
  }

  void subtractTime() {
    setState(() {
      if (duration.inSeconds > 0) {
        duration = Duration(seconds: duration.inSeconds - 1);
      } else {
        timer?.cancel();
        widget.onAnimationDone();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      children: [
        buildTimeColumn(hours, "שעות"),
        buildTimeColumn(minutes, "דקות"),
        buildTimeColumn(seconds, "שניות", isLast: true),
      ],
    );
  }

  Widget buildTimeColumn(String time, String label, {bool isLast = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            buildDigit(time[0]),
            buildDigit(time[1]),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        Transform.translate(
            offset: const Offset(-5, 0), // Offset by -20 on the Y-axis
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 14, color: Colors.white), // Your text style
            ))
      ],
    );
  }

  Widget buildDigit(String digit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeOutExpo,
          switchOutCurve: Curves.easeInExpo,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 1),
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  )),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.bounceIn,
                  )),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              ],
            );
          },
          child: Text(
            digit,
            key: ValueKey<String>(digit),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
