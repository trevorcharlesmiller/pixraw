import 'package:flutter/material.dart';

const TextStyle labelStyle = TextStyle(fontSize: 10);
const TextStyle valueStyle = TextStyle(fontSize: 12);

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: labelStyle,
            textAlign: TextAlign.end,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: valueStyle,
          ),
        ),
      ],
    );
  }
}
