import 'package:flutter/material.dart';

class PRAboutDialog extends StatelessWidget {
  const PRAboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About PixRAW'),
      content: const Text(
        'PixRAW is open source software.\n\n'
            'Copyright 2026 Trevor Charles Miller.\n'
            'All rights reserved.',
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
