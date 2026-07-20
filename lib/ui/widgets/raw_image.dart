import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:pixraw/model/raw_photo.dart';

import '../../model/raw_photo_load_result.dart';
import '../../state/raw_photos_notifier.dart';

class PRawImage extends ConsumerStatefulWidget {
  final int index;
  final int? cacheWidth;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onDoubleTap;

  const PRawImage({
    super.key,
    required this.index,
    this.cacheWidth,
    required this.onChanged,
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
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: FutureBuilder<RawPhotoResult>(
        key: ValueKey(widget.index),
        future: thumbnail,
        builder: (BuildContext context, AsyncSnapshot<RawPhotoResult> snapshot) {
          if (snapshot.hasData) {
            // final renderStopwatch = Stopwatch()..start();
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   renderStopwatch.stop();
            //   print('🖼️ Flutter render completed in ${renderStopwatch.elapsedMilliseconds}ms');
            // });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onDoubleTap: widget.onDoubleTap,
                      child: RotatedBox(
                        quarterTurns: snapshot.data!.quarterTurns,
                        child: Image.memory(
                          snapshot.data!.bytes!,
                          cacheWidth: widget.cacheWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          p.basename(rawPhoto.filePath),
                          style: TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Checkbox(
                      value: rawPhoto.selected,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                      // 2. Adjusts the compact density to maximum negative values to remove padding
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: widget.onChanged,
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Icon(Icons.broken_image, color: Colors.red),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
