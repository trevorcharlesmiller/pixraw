import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixraw/ui/widgets/rating/rating_filter_button.dart';
import 'package:pixraw/util/rating_color.dart';

import '../../../model/raw_photos.dart';
import '../../../state/raw_photos_notifier.dart';

class RatingToolbar extends ConsumerWidget {
  const RatingToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: VerticalDivider(
            color: Colors.grey,
            thickness: 1, 
            width: 20,
          ),
        ),

        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '0',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(null);
          },
          tooltip: 'Show all unrated photos.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(0))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '1',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(1);
          },
          tooltip: 'Show photos rated with 1 star.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(1))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '2',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(2);
          },
          tooltip: 'Show photos rated with 2 stars.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(2))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '3',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(3);
          },
          tooltip: 'Show photos rated with 3 stars.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(3))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '4',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(4);
          },
          tooltip: 'Show photos rated with 4 stars.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(4))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '5',
          onTap: (){
            ref.read(rawPhotosProvider.notifier).toggleRatingFilter(5);
          },
          tooltip: 'Show photos rated with 5 stars.',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(5))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        IconButton(
          tooltip: 'Show photos with no color rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(null);
          },
          icon: FaIcon(rawPhotos.ratingFilter.colors.contains(null) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, ),
        ),
        IconButton(
          tooltip: 'Show photos with Red rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(RatingColor.Red);
          },
          icon: FaIcon(
            rawPhotos.ratingFilter.colors.contains(RatingColor.Red) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, 
            color: Colors.red,),
        ),
        IconButton(
          tooltip: 'Show photos with Yellow rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(RatingColor.Yellow);
          },
          icon: FaIcon(
            rawPhotos.ratingFilter.colors.contains(RatingColor.Yellow) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, 
            color: Colors.yellow,),
        ),
        IconButton(
          tooltip: 'Show photos with Green rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(RatingColor.Green);
          },
          icon: FaIcon(
            rawPhotos.ratingFilter.colors.contains(RatingColor.Green) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, 
            color: Colors.green,),),
        IconButton(
          tooltip: 'Show photos with Blue rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(RatingColor.Blue);
          },
          icon: FaIcon(
            rawPhotos.ratingFilter.colors.contains(RatingColor.Blue) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, 
            color: Colors.blue,),
        ),
        IconButton(
          tooltip: 'Show photos with Purple rating.',
          onPressed: (){
            ref.read(rawPhotosProvider.notifier).toggleColorRatingFilter(RatingColor.Purple);
          },
          icon: FaIcon(
            rawPhotos.ratingFilter.colors.contains(RatingColor.Purple) ? FontAwesomeIcons.solidCircle : FontAwesomeIcons.circle, 
            color: Colors.purple,),
        ),
        IconButton(
          tooltip: 'Show photos neither selected nor rejected.',
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.square,),
        ),
        IconButton(
          tooltip: 'Show photos that have been rejected.',
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.squareXmark,),
        ),
        IconButton(
          tooltip: 'Show photos that have been selected.',
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.squareCheck,),
        ),
        SizedBox(width: 4,),
        OutlinedButton(
          onPressed: (rawPhotos.ratingFilter == null || rawPhotos.ratingFilter!.isEmpty) ? null :
              (){},
          child: Text('Clear'),
        ),
      ]
    );
  }
}
