import 'package:flutter/material.dart';

class StatBarWidget extends StatelessWidget {
  final String label;
  final int value;
  const StatBarWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final double percentage = value / 10;

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[300],
            color: Colors.green,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
