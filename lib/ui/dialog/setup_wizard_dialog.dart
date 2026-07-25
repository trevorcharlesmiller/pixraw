import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/app_config_notifier.dart';

class SetupWizardDialog extends ConsumerStatefulWidget {
  const SetupWizardDialog({super.key});

  @override
  ConsumerState<SetupWizardDialog> createState() => _SetupWizardDialogState();
}

class _SetupWizardDialogState extends ConsumerState<SetupWizardDialog> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final config = ref.watch(appConfigProvider);
    final notifier = ref.read(appConfigProvider.notifier);

    return AlertDialog(
      title: Text('Setup'),
      content: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PERSONALIZE', style: TextStyle(fontSize: 14, color: colorScheme.secondary)),
                  SizedBox(height: 10,),
                  Text('Make it your own', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text(
                    'Choose your preferred look and feel.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(width: 55,),
            Expanded(
              flex: 6,
              child: RadioGroup<ThemeMode>(
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
                              SizedBox(width: 5,),
                              Tooltip(
                                message: 'This will use the operating system setting.',
                                  child: Icon(Icons.help_outline, size: 20,),),
                            ],
                          ),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.system,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                        child: ListTile(
                          leading: Image.asset('assets/pixraw-dark.png'),
                          title: Text('Dark'),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.dark,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                        child: ListTile(
                          leading: Image.asset('assets/pixraw-light.png'),
                          title: Text('Light'),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.light,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            ref.read(appConfigProvider.notifier).setFirstRun(false);
            if (mounted) Navigator.of(context).pop();
          },
          child: Text('Select Theme'),
        ),
      ],
    );
  }
}
