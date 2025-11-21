import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Импортируем SharedPreferences
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class TimeCounter extends StatefulWidget {
  const TimeCounter({super.key});

  @override
  TimeCounterState createState() => TimeCounterState();
}

class TimeCounterState extends State<TimeCounter> {
  late int remainingDays;
  late int remainingTime;

  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadSavedState();

    remainingDays = 5;
    remainingTime = 23 * 3600 + 59 * 60 + 59;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else if (remainingDays > 0) {
          remainingDays--;
          remainingTime = 23 * 3600 + 59 * 60 + 59;
        }
      });
    });
  }

  Future<void> _loadSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    remainingDays = prefs.getInt('remainingDays') ?? 5;
    remainingTime = prefs.getInt('remainingTime') ?? (23 * 3600 + 59 * 60 + 59);
    setState(() {});
  }

  Future<void> _saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('remainingDays', remainingDays);
    prefs.setInt('remainingTime', remainingTime);
  }

  @override
  void dispose() {
    _saveState();
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int time) {
    final hours = (time ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((time % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (time % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final timeString = _formatTime(remainingTime);
    final timeParts = timeString.split(':');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('До окончания: $remainingDays дней', style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd)),
          const SizedBox(width: 2),
          Row(
            children: List.generate(6, (index) {
              String digit;
              if (index < 2) {
                digit = timeParts[0][index];
              } else if (index < 4) {
                digit = timeParts[1][index - 2];
              } else {
                digit = timeParts[2][index - 4];
              }

              return Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      digit,
                      style: TextStyle(color: TColors.black, fontSize: TSizes.fontSizeMd),
                    ),
                  ),
                  if (index == 1 || index == 3) ...[
                    const SizedBox(width: 3),
                    const Text(':', style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 3),
                  ],
                  if (index != 1 && index != 3) const SizedBox(width: 2),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
