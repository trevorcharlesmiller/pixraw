import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:pixraw/util/rating_color.dart';

class Rating extends StatelessWidget {
  final ValueChanged<int>? onChanged;
  final RawPhoto rawPhoto;

  const Rating({super.key, required this.onChanged, required this.rawPhoto});

  Color? getColor(RatingColor? color) {
    switch(color) {
      case RatingColor.Blue : {
        return Colors.blue;
      }
      case RatingColor.Red : {
        return Colors.red;
      }
      case RatingColor.Green : {
        return Colors.green;
      }
      case RatingColor.Purple : {
        return Colors.purple;
      }
      case RatingColor.Yellow : {
        return Colors.yellow;
      }
      default: {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    int rating = rawPhoto.rating ?? 0;
    List<Widget> stars = [];

    for(int i = 0; i < rating; i++) {
      stars.add(GestureDetector(onTap: (){
        if (onChanged != null ) {
          onChanged!(i+1);
        }
      }, child: FaIcon(FontAwesomeIcons.solidStar, size: 10,),),);
    }

    for(int i = rating; i < 5; i++) {
      stars.add(GestureDetector(onTap: (){
        if (onChanged != null ) {
          onChanged!(i+1);
        }
      }, child: FaIcon(FontAwesomeIcons.star, size: 10,),),);
    }

    return Container(
      height: 24.0,
      decoration: BoxDecoration(
        color: getColor(rawPhoto.color),
        border: Border.all(
          color: colorScheme.primaryContainer,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Row(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: stars,
        ),
      ),
    );
  }
}
