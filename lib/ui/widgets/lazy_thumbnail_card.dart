import 'package:flutter/material.dart';
import 'package:pixraw/ui/widgets/rating/rating.dart';
import 'package:pixraw/ui/widgets/raw_image.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:path/path.dart' as p;
import 'package:pixraw/ui/widgets/rating/select_reject.dart';

import '../../util/rating_color.dart';

class LazyThumbnailCard extends StatefulWidget {
  final int index;
  final RawPhoto rawPhoto;
  final bool highlighted;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final ValueChanged<int>? onRatingChanged;
  final ValueChanged<RatingColor?>? onColorChanged;

  const LazyThumbnailCard({
    super.key,
    required this.index,
    required this.rawPhoto,
    required this.highlighted,
    required this.onTap,
    required this.onDoubleTap,
    required this.onRatingChanged,
    required this.onColorChanged,
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

  Color? cardColor(ColorScheme colorScheme) {
    if(highlighted) {
      return Colors.blueAccent;
    }
    if(widget.rawPhoto.selected != null) {
      if(widget.rawPhoto.selected!) {
        return colorScheme.primaryContainer;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: cardColor(colorScheme),
      child: InkWell(
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.basename(widget.rawPhoto.filePath),
                style: TextStyle(fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Center(
                  child: PRawImage(
                    index: widget.index,
                    filePath: widget.rawPhoto.filePath,
                    cacheWidth: 280,
                    onDoubleTap: widget.onDoubleTap,
                  ),
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Rating(
                    onChanged: widget.onRatingChanged,
                    onColorChanged: widget.onColorChanged,
                    rawPhoto: widget.rawPhoto,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SelectReject(index: widget.index,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
