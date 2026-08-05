import 'package:flutter/material.dart';

class RatingFilterButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final String? tooltip;

  const RatingFilterButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      color: color,
      tooltip: tooltip,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          icon,
          Text(
            label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
