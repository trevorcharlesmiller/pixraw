import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../state/app_config_notifier.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    final notifier = ref.read(appConfigProvider.notifier);

    return RadioGroup<ThemeMode>(
      groupValue: config.themeMode,
      onChanged: (ThemeMode? newMode) {
        if (newMode != null) notifier.setThemeMode(newMode);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 20),
              child: ListTile(
                leading: Image.asset('assets/pixraw-mode.png'),
                title: Row(
                  children: [
                    Text('Automatic'),
                    SizedBox(width: 5),
                    Tooltip(
                      message:
                      'This will use the operating system setting.',
                      preferBelow: false,
                      verticalOffset: 20,
                      child: Icon(Icons.help_outline, size: 20),
                    ),
                  ],
                ),
                trailing: Radio<ThemeMode>(value: ThemeMode.system),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 20),
              child: ListTile(
                leading: Image.asset('assets/pixraw-dark.png'),
                title: Text('Dark'),
                trailing: Radio<ThemeMode>(value: ThemeMode.dark),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 20),
              child: ListTile(
                leading: Image.asset('assets/pixraw-light.png'),
                title: Text('Light'),
                trailing: Radio<ThemeMode>(value: ThemeMode.light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
