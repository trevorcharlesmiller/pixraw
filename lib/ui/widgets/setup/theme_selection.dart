import 'package:flutter/material.dart';

import '../shared/theme_selector.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PERSONALIZE',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.secondary,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Make it your own',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Choose your preferred look and feel.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(width: 55),
        Expanded(
          flex: 6,
          child: ThemeSelector(),
        ),
      ],
    );
  }
}
