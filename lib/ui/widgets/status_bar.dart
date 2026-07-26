import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;

import '../../model/raw_photos.dart';
import '../../state/raw_photos_notifier.dart';

class StatusBar extends ConsumerWidget {
  final bool gridView;
  const StatusBar({super.key, required this.gridView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
              child: rawPhotos.rawPhotoPaths.isEmpty ? Container() :

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    p.basename(rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto].filePath),
                    style: TextStyle(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 10),
                  if(!gridView)
                    Checkbox(
                      value: rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto].selected,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (bool? value){ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoSelected();},
                    )
                ],
              )

          ),

          rawPhotos.rawPhotoPaths.isEmpty
              ? Text('0')
              : Text(
            '${rawPhotos.currentPhoto + 1} of ${rawPhotos.rawPhotoPaths.length}',
          ),
          SizedBox(width: 5,),
          const Icon(Icons.image_outlined, size: 14,),
          SizedBox(width: 15,),
          Text(
            '${rawPhotos.rawPhotoPaths.where((p) => p.selected).length} selected',
          ),
          IconButton(
            icon: const Icon(Icons.library_add_check_rounded),
            tooltip: 'Select all photos',
            iconSize: 15,
            onPressed:
            rawPhotos.rawPhotoPaths.isEmpty ||
                (rawPhotos.rawPhotoPaths
                    .where((p) => p.selected)
                    .length ==
                    rawPhotos.rawPhotoPaths.length)
                ? null
                : () {
              ref
                  .read(rawPhotosProvider.notifier)
                  .selectAllPhotos();
            },
          ),
          IconButton(
            icon: const Icon(Icons.deselect),
            tooltip: 'Clear selected photos',
            iconSize: 15,
            onPressed:
            rawPhotos.rawPhotoPaths.where((p) => p.selected).isEmpty
                ? null
                : () {
              ref
                  .read(rawPhotosProvider.notifier)
                  .unSelectAllPhotos();
            },
          ),
        ],
      ),
    );
  }
}
