import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/ui/widgets/setup/tutorial_navigate.dart';

import '../../state/app_config_notifier.dart';
import '../widgets/setup/theme_selection.dart';
import '../widgets/setup/tutorial_rating.dart';

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
          child: Text(currentPage<2 ? 'Next' : 'Done'),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if(currentPage==0) {
      return TutorialNavigate();
    } else if(currentPage==1) {
      return TutorialRating();
    }
    return ThemeSelection();
  }

}
