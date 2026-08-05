import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/ui/widgets/raw_image.dart';

import '../../model/raw_photos.dart';
import '../../state/raw_photos_notifier.dart';

class SinglePhotoView extends ConsumerWidget {
  final VoidCallback toggleGridView;
  const SinglePhotoView({super.key, required this.toggleGridView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.read(rawPhotosProvider);
    return Center(
      child: PRawImage(
        index: rawPhotos.currentPhoto,
        filePath: rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto].filePath,
        cacheWidth: MediaQuery.of(context).size.width.toInt(),
        onDoubleTap: toggleGridView,
      ),
    );
  }
}
