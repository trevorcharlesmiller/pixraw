import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixraw/ui/widgets/setup/setup_key.dart';
import 'package:pixraw/util/rating_color.dart';

import '../../../model/raw_photo.dart';
import '../../intents.dart';
import '../rating/rating.dart';

class TutorialSelection extends StatefulWidget {
  const TutorialSelection({super.key});

  @override
  State<TutorialSelection> createState() => _TutorialSelectionState();
}

class _TutorialSelectionState extends State<TutorialSelection> {
  RawPhoto rawPhoto = RawPhoto(filePath: '');

  @override
  Widget build(BuildContext context) {
    bool rejected = (rawPhoto.selected != null && rawPhoto.selected == false);
    bool selected = (rawPhoto.selected != null && rawPhoto.selected == true);
    final colorScheme = Theme.of(context).colorScheme;
    Color defaultFontColor = colorScheme.onSurface;
    final TextStyle subStyle = TextStyle(
      fontSize: 11,
      color: colorScheme.secondary,
    );

    return FocusableActionDetector(
      autofocus: true,
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.space): ToggleSelectedIntent(),
        SingleActivator(LogicalKeyboardKey.keyX): ToggleRejectedIntent(),
      },
      actions: <Type, Action<Intent>>{
        ToggleSelectedIntent: CallbackAction<ToggleSelectedIntent>(
          onInvoke: (_) => _toggleSelectedPhoto(),
        ),
        ToggleRejectedIntent: CallbackAction<ToggleRejectedIntent>(
          onInvoke: (_) => _toggleRejectedPhoto(),
        ),
      },
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
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
                            spacing: 7,
                            children: [
                              Rating(
                                onChanged: (int? rating) {
                                },
                                onColorChanged: (RatingColor? color) {
                                },
                                rawPhoto: rawPhoto,
                              ),
                              Expanded(child: Container()),
                              //=============================================== [SELECT REJECT]
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.squareXmark,
                                  size: 16,
                                  color: rejected ? Colors.red : null,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                icon: selected
                                    ? FaIcon(
                                        FontAwesomeIcons.squareCheck,
                                        size: 16,
                                        color: Colors.green,
                                      )
                                    : FaIcon(FontAwesomeIcons.square, size: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select or reject photos\nwith keyboard shortcuts',
                  style: TextStyle(fontSize: 24, color: colorScheme.secondary),
                ),
                SizedBox(height: 15),
                
                Text('SELECT PHOTO', style: subStyle),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: defaultFontColor, width: 1.0),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ), // Rounded corners radius
                      ),
                      child: Center(
                        child: Text(
                          'SPACE BAR',
                          style: TextStyle(
                            fontSize: 26,
                            color: defaultFontColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Text('REJECT PHOTO', style: subStyle),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    SetupKey(label: 'X',),
                  ],
                ),
                
                SizedBox(height: 20),
                Text('Toggle the space bar and \'x\' key.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSelectedPhoto() {
    bool? selected = (rawPhoto.selected==null || !rawPhoto.selected!) ? true : null;
    setState(() {
      rawPhoto = rawPhoto.copyWith(selected: selected);
    });
  }
  void _toggleRejectedPhoto() {
    bool? rejected = (rawPhoto.selected!=null && rawPhoto.selected==false) ? null : false;
    setState(() {
      rawPhoto = rawPhoto.copyWith(selected: rejected);
    });
  }
}