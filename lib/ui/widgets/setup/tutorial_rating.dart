import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixraw/ui/widgets/setup/setup_key.dart';
import 'package:pixraw/util/rating_color.dart';

import '../../../model/raw_photo.dart';
import '../../intents.dart';
import '../rating.dart';

class TutorialRating extends StatefulWidget {
  const TutorialRating({super.key});

  @override
  State<TutorialRating> createState() => _TutorialRatingState();
}

class _TutorialRatingState extends State<TutorialRating> {

  RawPhoto rawPhoto = RawPhoto(filePath: '');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color defaultFontColor = colorScheme.onSurface;
    final TextStyle subStyle = TextStyle(fontSize: 11, color: colorScheme.secondary);
    return FocusableActionDetector(
      autofocus: true, 
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.space): ToggleSelectedIntent(),
        SingleActivator(LogicalKeyboardKey.digit0): Rating0Intent(),
        SingleActivator(LogicalKeyboardKey.digit1): Rating1Intent(),
        SingleActivator(LogicalKeyboardKey.digit2): Rating2Intent(),
        SingleActivator(LogicalKeyboardKey.digit3): Rating3Intent(),
        SingleActivator(LogicalKeyboardKey.digit4): Rating4Intent(),
        SingleActivator(LogicalKeyboardKey.digit5): Rating5Intent(),
        SingleActivator(LogicalKeyboardKey.keyR): ColorRedIntent(),
        SingleActivator(LogicalKeyboardKey.keyG): ColorGreenIntent(),
        SingleActivator(LogicalKeyboardKey.keyB): ColorBlueIntent(),
        SingleActivator(LogicalKeyboardKey.keyY): ColorYellowIntent(),
        SingleActivator(LogicalKeyboardKey.keyP): ColorPurpleIntent(),
        SingleActivator(LogicalKeyboardKey.keyC): ColorClearIntent(),
      },
      actions: <Type, Action<Intent>>{
        ToggleSelectedIntent: CallbackAction<ToggleSelectedIntent>(
          onInvoke: (_) => _toggleSelectedPhoto(),
        ),
        Rating0Intent: CallbackAction<Rating0Intent>(
          onInvoke: (_) => _setRating(0),
        ),
        Rating1Intent: CallbackAction<Rating1Intent>(
          onInvoke: (_) => _setRating(1),
        ),
        Rating2Intent: CallbackAction<Rating2Intent>(
          onInvoke: (_) => _setRating(2),
        ),
        Rating3Intent: CallbackAction<Rating3Intent>(
          onInvoke: (_) => _setRating(3),
        ),
        Rating4Intent: CallbackAction<Rating4Intent>(
          onInvoke: (_) => _setRating(4),
        ),
        Rating5Intent: CallbackAction<Rating5Intent>(
          onInvoke: (_) => _setRating(5),
        ),
        ColorRedIntent: CallbackAction<ColorRedIntent>(
          onInvoke: (_) => _setRatingColor(RatingColor.Red),
        ),
        ColorGreenIntent: CallbackAction<ColorGreenIntent>(
          onInvoke: (_) => _setRatingColor(RatingColor.Green),
        ),
        ColorBlueIntent: CallbackAction<ColorBlueIntent>(
          onInvoke: (_) => _setRatingColor(RatingColor.Blue),
        ),
        ColorYellowIntent: CallbackAction<ColorYellowIntent>(
          onInvoke: (_) => _setRatingColor(RatingColor.Yellow),
        ),
        ColorPurpleIntent: CallbackAction<ColorPurpleIntent>(
          onInvoke: (_) => _setRatingColor(RatingColor.Purple),
        ),
        ColorClearIntent: CallbackAction<ColorClearIntent>(
          onInvoke: (_) => _setRatingColor(null),
        ),
      },
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 4.0,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DSC_5649.NEF',
                              style: TextStyle(fontSize: 11),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Center(
                                child: Image.asset('assets/photo1.jpg'),
                              ),
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                Rating(
                                  onChanged: (int? rating) {
                                    _setRating(rating);
                                  },
                                  onColorChanged: (RatingColor? color) {
                                    _setRatingColor(color);
                                  },
                                  rawPhoto: rawPhoto,
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Checkbox(
                                  value: rawPhoto.selected,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  onChanged: (bool? value) {
                                    _toggleSelectedPhoto();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Apply a rating to a photo\nwith keyboard shortcuts', style: TextStyle(fontSize: 24, color: Colors.blueAccent),),
                SizedBox(height: 15,),
                Text('STARS', style: subStyle,),
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
                SizedBox(height: 15,),
                Text('COLORS', style: subStyle,),
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
                SizedBox(height: 15,),
                Text('SELECT PHOTO', style: subStyle,),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: defaultFontColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners radius
                      ),
                      child: Center(
                        child: Text('SPACE BAR', style: TextStyle(fontSize: 26, color: defaultFontColor)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text('Try it out!'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _setRating(int? rating) {
    setState(() {
      rawPhoto = rawPhoto.copyWith(rating: rating);
    });
  }

  void _setRatingColor(RatingColor? color) {
    setState(() {
      rawPhoto = rawPhoto.copyWith(color: color);
    });
  }

  void _toggleSelectedPhoto() {
    setState(() {
      rawPhoto = rawPhoto.copyWith(selected: !rawPhoto.selected);
    });
  }
}
