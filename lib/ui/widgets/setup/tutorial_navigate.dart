import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixraw/ui/widgets/setup/setup_key.dart';

import '../../intents.dart';

class TutorialNavigate extends StatefulWidget {
  const TutorialNavigate({super.key});

  @override
  State<TutorialNavigate> createState() => _TutorialNavigateState();
}

class _TutorialNavigateState extends State<TutorialNavigate> {
  final List<String> photos = ['assets/photo1.jpg', 'assets/photo2.jpg'];
  int currentPhoto = 0;

  void _selectPrevious() {

    if (currentPhoto > 0) {
      setState(() {
        currentPhoto = currentPhoto - 1;
      });
    }
  }

  void _selectNext() {

    if (currentPhoto < (photos.length - 1)) {
      setState(() {
        currentPhoto = currentPhoto + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true, // Grabs focus initially so arrows work right away
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowLeft): MoveLeftIntent(),
        SingleActivator(LogicalKeyboardKey.arrowRight): MoveRightIntent(),
      },
      actions: <Type, Action<Intent>>{
        // Define what happens when the intents are triggered
        MoveLeftIntent: CallbackAction<MoveLeftIntent>(
          onInvoke: (_) => _selectPrevious(),
        ),
        MoveRightIntent: CallbackAction<MoveRightIntent>(
          onInvoke: (_) => _selectNext(),
        ),
      },
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: GridView.builder(
                shrinkWrap:
                    true, // 1. Tells the grid to only take up as much height as it needs
                physics: const NeverScrollableScrollPhysics(),
                key: const ValueKey('tutorial_photo_grid'),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1.0,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(photos[index]),
                    clipBehavior: Clip.antiAlias,
                    color: currentPhoto == index ? Colors.blueAccent : null,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(child: Image.asset(photos[index])),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 55),
          Expanded(
            flex: 5,
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
                    SetupKey(icon: Icon(Icons.arrow_back)),
                    SetupKey(icon: Icon(Icons.arrow_forward)),
                  ],
                ),
                Text(
                  'Use the left and right arrow keys to navigate between photos',
                  style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                ),
                SizedBox(height: 5),
                Text('Go ahead and try it out now!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
