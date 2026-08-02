import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:pixraw/ui/widgets/rating.dart';
import 'package:pixraw/ui/widgets/select_reject.dart';

import '../../model/raw_photos.dart';
import '../../state/app_config_notifier.dart';
import '../../state/raw_photos_notifier.dart';
import '../../util/rating_color.dart';

class StatusBar extends ConsumerWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);

    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 5,),
          Expanded(
            child: rawPhotos.rawPhotoPaths.isEmpty
                ? Container()
                : Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      if (!config.isGridView)
                        Rating(
                          onChanged: (int? value) {
                            ref
                                .read(rawPhotosProvider.notifier)
                                .setRating(value);
                          },
                          onColorChanged: (RatingColor? color){
                            ref.read(rawPhotosProvider.notifier).setColor(color);
                          },
                          rawPhoto:
                              rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto],
                        ),

                      if (!config.isGridView)
                        SelectReject(),

                      Text(
                        p.basename(
                          rawPhotos
                              .rawPhotoPaths[rawPhotos.currentPhoto]
                              .filePath,
                        ),
                        style: TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),

          rawPhotos.rawPhotoPaths.isEmpty
              ? Text('0')
              : Text(
                  '${rawPhotos.currentPhoto + 1} of ${rawPhotos.rawPhotoPaths.length}',
                ),
          SizedBox(width: 5),
          const Icon(Icons.image_outlined, size: 14),
          SizedBox(width: 15),
          Text(
            '${rawPhotos.rawPhotoPaths.where((p) => p.selected??false).length} selected',
          ),
          IconButton(
            icon: const Icon(Icons.library_add_check_rounded),
            tooltip: 'Select all photos',
            iconSize: 15,
            onPressed:
                rawPhotos.rawPhotoPaths.isEmpty ||
                    (rawPhotos.rawPhotoPaths.where((p) => p.selected??false).length ==
                        rawPhotos.rawPhotoPaths.length)
                ? null
                : () {
                    ref.read(rawPhotosProvider.notifier).selectAllPhotos();
                  },
          ),
          IconButton(
            icon: const Icon(Icons.deselect),
            tooltip: 'Clear selected photos',
            iconSize: 15,
            onPressed: rawPhotos.rawPhotoPaths.where((p) => p.selected??false).isEmpty
                ? null
                : () {
                    ref.read(rawPhotosProvider.notifier).unSelectAllPhotos();
                  },
          ),
        ],
      ),
    );
  }
}
