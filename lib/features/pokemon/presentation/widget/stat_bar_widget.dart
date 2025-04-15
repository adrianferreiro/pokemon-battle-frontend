import 'package:flutter/material.dart';
import 'package:pokemon_app/config/constants/constants.dart';

class StatBarWidget extends StatelessWidget {
  final String label;
  final int value;
  const StatBarWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final double percentage = value / maxStatValue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: Colors.lightGreenAccent[400],
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
