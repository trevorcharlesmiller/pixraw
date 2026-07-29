import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/ui/widgets/shared/theme_selector.dart';

import '../../state/app_config_notifier.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: const Text('Settings'),
      content: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onPrimary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners radius
        ),
        width: 400,
        child: Padding(padding: EdgeInsetsGeometry.all(15,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text('Theme', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ThemeSelector()
            ],
          ),
        ),
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
