import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:pixraw/raw_image.dart';
import 'package:pixraw/raw_photo.dart';

class LazyThumbnailCard extends StatefulWidget {
  final RawPhoto rawPhoto;
  final bool highlighted;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const LazyThumbnailCard({
    super.key,
    required this.rawPhoto,
    required this.highlighted,
    required this.onChanged,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  State<LazyThumbnailCard> createState() => _LazyThumbnailCardState();
}

class _LazyThumbnailCardState extends State<LazyThumbnailCard> {
  bool highlighted = false;

  @override
  void initState() {
    super.initState();
    highlighted = widget.highlighted;
  }

  @override
  void didUpdateWidget(covariant LazyThumbnailCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.highlighted != widget.highlighted) {
      setState(() {
        highlighted = widget.highlighted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: highlighted ? Colors.blueAccent : null,
      child: InkWell(
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        child: PRawImage(
          rawPhoto: widget.rawPhoto,
          cacheWidth: 280,
          onChanged: widget.onChanged,
          onDoubleTap: widget.onDoubleTap,
        ),
      ),
    );
  }
}
