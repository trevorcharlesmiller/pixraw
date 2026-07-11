import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:pixraw/raw_photo.dart';

class PRawImage extends StatefulWidget {
  final RawPhoto rawPhoto;
  final int? cacheWidth;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onDoubleTap;

  const PRawImage({
    super.key,
    required this.rawPhoto,
    this.cacheWidth,
    required this.onChanged,
    required this.onDoubleTap
  });

  @override
  State<PRawImage> createState() => _PRawImageState();
}

class _PRawImageState extends State<PRawImage> {
  late String fileName;
  late Future<RawPhotoResult> thumbnail;

  @override
  void initState() {
    super.initState();
    fileName = p.basename(widget.rawPhoto.filePath);
    _loadPRawImage();
  }

  @override
  void didUpdateWidget(covariant PRawImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.rawPhoto.filePath != widget.rawPhoto.filePath) {
      setState(() {
        fileName = p.basename(widget.rawPhoto.filePath);
      });
      _loadPRawImage();
    }
  }

  void _loadPRawImage() {
    setState(() {
      thumbnail = widget.rawPhoto.loadThumbnail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: FutureBuilder<RawPhotoResult>(
        key: ValueKey(widget.rawPhoto.filePath),
        future: thumbnail,
        builder: (BuildContext context, AsyncSnapshot<RawPhotoResult> snapshot) {
          if (snapshot.hasData) {
            final renderStopwatch = Stopwatch()..start();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              renderStopwatch.stop();
              //print('🖼️ Flutter render completed in ${renderStopwatch.elapsedMilliseconds}ms');
            });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onDoubleTap: widget.onDoubleTap,
                      child: Image.memory(
                        snapshot.data!.bytes!,
                        cacheWidth: widget.cacheWidth,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(fileName, style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(width: 10),
                    Checkbox(
                      value: widget.rawPhoto.selected,
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
            return Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
