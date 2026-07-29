import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/app_config_notifier.dart';
import '../widgets/setup/setup_key.dart';
import '../widgets/shared/theme_selector.dart';

class SetupWizardDialog extends ConsumerStatefulWidget {
  const SetupWizardDialog({super.key});

  @override
  ConsumerState<SetupWizardDialog> createState() => _SetupWizardDialogState();
}

class _SetupWizardDialogState extends ConsumerState<SetupWizardDialog> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Setup'),
      content: SizedBox(
        width: 700,
        height: 400,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 15),
          child: _buildContent(context),
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            if(currentPage<2) {
              setState(() {
                currentPage = currentPage+1;
              });
            } else {
              ref.read(appConfigProvider.notifier).setFirstRun(false);
              if (mounted) Navigator.of(context).pop();
            }
          },
          child: Text(currentPage<2 ? 'Next' : 'Close'),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if(currentPage==0) {
      return _buildTutorialPage1(context);
    } else if(currentPage==1) {
      return _buildTutorialPage2(context);
    }
    return _buildThemeSelectionPage(context);
  }

  Widget _buildTutorialPage1(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
        ),
        SizedBox(width: 55),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                SetupKey(icon: Icon(Icons.arrow_back),),
                  SetupKey(icon: Icon(Icons.arrow_forward),),
                ],
              ),
              Text('Use the left and right arrow keys\nto navigate between photos', style: TextStyle(fontSize: 24, color: Colors.blueAccent),),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTutorialPage2(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final TextStyle subStyle = TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant);
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
        ),
        SizedBox(width: 55),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Apply a rating to a photo\nwith keyboard shortcuts', style: TextStyle(fontSize: 24, color: Colors.blueAccent),),
              SizedBox(height: 10,),
              Text('stars', style: subStyle,),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  SetupKey(label: '1'),
                  SetupKey(label: '2'),
                  SetupKey(label: '3'),
                  SetupKey(label: '4'),
                  SetupKey(label: '5'),
                ],
              ),
              SizedBox(height: 10,),
              Text('colors', style: subStyle,),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  SetupKey(label: 'R', color: Colors.red,),
                  SetupKey(label: 'G', color: Colors.green,),
                  SetupKey(label: 'B', color: Colors.blue,),
                  SetupKey(label: 'Y', color: Colors.amber),
                  SetupKey(label: 'P', color: Colors.purple,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeSelectionPage(BuildContext context) {
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
