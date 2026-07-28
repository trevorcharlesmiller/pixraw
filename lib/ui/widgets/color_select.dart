import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixraw/util/rating_color.dart';

class ColorSelect extends StatelessWidget {
  final ValueChanged<RatingColor?>? onChanged;

  const ColorSelect({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<RatingColor?>(
      tooltip: 'Select color',
      icon: const FaIcon(FontAwesomeIcons.circle, size: 13),
      onSelected: (RatingColor? value) {
        if (onChanged != null ) {
          onChanged!(value);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<RatingColor?>>[
        const PopupMenuItem<RatingColor?>(
          value: RatingColor.Red,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.solidCircle, size: 13, color: Colors.red,),
              Text('Red'),
            ],
          ),
        ),
        const PopupMenuItem<RatingColor?>(
          value: RatingColor.Green,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.solidCircle, size: 13, color: Colors.green,),
              Text('Green'),
            ],
          ),
        ),
        const PopupMenuItem<RatingColor?>(
          value: RatingColor.Blue,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.solidCircle, size: 13, color: Colors.blue,),
              Text('Blue'),
            ],
          ),
        ),
        const PopupMenuItem<RatingColor?>(
          value: RatingColor.Yellow,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.solidCircle, size: 13, color: Colors.yellow,),
              Text('Yellow'),
            ],
          ),
        ),
        const PopupMenuItem<RatingColor?>(
          value: RatingColor.Purple,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.solidCircle, size: 13, color: Colors.purple,),
              Text('Purple'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<RatingColor?>(
          value: null,
          onTap: () {
            if (onChanged != null ) {
              onChanged!(null);
            }
          },
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.circle, size: 13, ),
              Text('Clear'),
            ],
          ),
        ),
      ],
    );
  }
}
