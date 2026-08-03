import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixraw/ui/widgets/rating/rating_filter_button.dart';

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
            color: Colors.grey, // Ensure color is visible
            thickness: 1, // Explicitly set thickness
            width: 20, // Space allocated for the divider
          ),
        ),
        SizedBox(width: 4,),
        Text('Filters:', style: TextStyle(fontSize: 12),),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '0',
          onTap: (){},
          tooltip: 'Filter for unrated photos',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(0))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '1',
          onTap: (){},
          tooltip: 'Filter photos rated with 1 star',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(1))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '2',
          onTap: (){},
          tooltip: 'Filter photos rated with 2 stars',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(2))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '3',
          onTap: (){},
          tooltip: 'Filter photos rated with 3 star2',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(3))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '4',
          onTap: (){},
          tooltip: 'Filter photos rated with 4 star2',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(4))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        RatingFilterButton(
          icon: FaIcon(FontAwesomeIcons.star,),
          label: '5',
          onTap: (){},
          tooltip: 'Filter photos rated with 5 star2',
          color: (rawPhotos.ratingFilter != null && rawPhotos.ratingFilter!.ratings.contains(5))
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, ),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, color: Colors.red,),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, color: Colors.yellow,),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, color: Colors.green,),),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, color: Colors.blue,),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.circle, color: Colors.purple,),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.squareXmark,),
        ),
        IconButton(
          onPressed: (){},
          icon: FaIcon(FontAwesomeIcons.squareCheck,),
        ),
        SizedBox(width: 4,),
        OutlinedButton(
          onPressed: (rawPhotos.ratingFilter == null || rawPhotos.ratingFilter!.isEmpty) ? null :
              (){},
          child: Text('Clear Filters'),
        ),
      ]
    );
  }
}
