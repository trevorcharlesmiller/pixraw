import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/model/raw_photo.dart';

import '../../model/raw_photo_load_result.dart';
import '../../state/raw_photos_notifier.dart';

class PRawImage extends ConsumerStatefulWidget {
  final int index;
  final int? cacheWidth;
  final VoidCallback onDoubleTap;

  const PRawImage({
    super.key,
    required this.index,
    this.cacheWidth,
    required this.onDoubleTap
  });

  @override
  ConsumerState<PRawImage> createState() => _PRawImageState();
}

class _PRawImageState extends ConsumerState<PRawImage> {
  late Future<RawPhotoResult> thumbnail;

  @override
  void initState() {
    super.initState();
    _loadPRawImage();
  }

  @override
  void didUpdateWidget(covariant PRawImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.index != widget.index) {
      _loadPRawImage();
    }
  }

  void _loadPRawImage() {
    setState(() {
      thumbnail = ref.read(rawPhotosProvider.notifier).loadThumbnail(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    RawPhoto rawPhoto = ref.read(rawPhotosProvider).rawPhotoPaths[widget.index];
    return FutureBuilder<RawPhotoResult>(
        key: ValueKey(widget.index),
        future: thumbnail,
        builder: (BuildContext context, AsyncSnapshot<RawPhotoResult> snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onDoubleTap: widget.onDoubleTap,
              child: RotatedBox(
                quarterTurns: snapshot.data!.quarterTurns,
                child: Image.memory(
                  snapshot.data!.bytes!,
                  cacheWidth: widget.cacheWidth,
                  fit: BoxFit.contain,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Icon(Icons.broken_image, color: Colors.red),
            );
          } else {
            return Container();
          }
        },
      );
  }
}
