import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:pixraw/raw_image.dart';
import 'package:pixraw/raw_photo.dart';

class LazyThumbnailCard extends StatefulWidget {
  final RawPhoto rawPhoto;
  final bool highlighted;

  const LazyThumbnailCard({super.key, required this.rawPhoto, required this.highlighted});

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

  Widget build(BuildContext context) {
    return Card(
      color: highlighted ? Colors.blueAccent : null,
      child: PRawImage(rawPhoto: widget.rawPhoto,),
    );
  }
}
