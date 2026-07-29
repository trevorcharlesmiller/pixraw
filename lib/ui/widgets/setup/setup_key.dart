import 'package:flutter/material.dart';

class SetupKey extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final Color? color;

  const SetupKey({super.key, this.label, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color defaultFontColor = colorScheme.onSurface;
    Color fontColor = color ?? defaultFontColor;

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: fontColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0), // Rounded corners radius
      ),
      child: Center(
        child: icon ?? Text(label!, style: TextStyle(fontSize: 26, color: fontColor)),
      ),
    );
  }
}
