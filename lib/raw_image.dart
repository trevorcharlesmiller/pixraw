import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:pixraw/raw_photo.dart';

class PRawImage extends StatefulWidget {
  final RawPhoto rawPhoto;

  const PRawImage({super.key, required this.rawPhoto});

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
      oldWidget.rawPhoto.close();
      _loadPRawImage();
    }
  }

  void _cleanupNativeResources() {
    widget.rawPhoto.close();
  }

  void _loadPRawImage() {
    setState(() {
      thumbnail = widget.rawPhoto.loadThumbnail();
    });
  }

  @override
  void dispose() {
    _cleanupNativeResources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: FutureBuilder<RawPhotoResult>(
        key: ValueKey(widget.rawPhoto.filePath),
        future: thumbnail,
        builder:
            (BuildContext context, AsyncSnapshot<RawPhotoResult> snapshot) {
              if (snapshot.hasData) {
                final renderStopwatch = Stopwatch()..start();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  renderStopwatch.stop();
                  print('🖼️ Flutter render completed in ${renderStopwatch.elapsedMilliseconds}ms');
                });
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.memory(
                        snapshot.data!.bytes!,
                        cacheWidth: 500,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(fileName, style: TextStyle(fontSize: 12)),
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
