import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String tempreture;
  final IconData icon;
  const HourlyForecastItem(
      {super.key,
      required this.time,
      required this.tempreture,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              tempreture,
            ),
          ],
        ),
      ),
    );
  }
}