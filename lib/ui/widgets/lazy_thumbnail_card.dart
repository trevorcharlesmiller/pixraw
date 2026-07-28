import 'package:flutter/material.dart';
import 'package:pixraw/ui/widgets/rating.dart';
import 'package:pixraw/ui/widgets/raw_image.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:path/path.dart' as p;

import '../../util/rating_color.dart';

class LazyThumbnailCard extends StatefulWidget {
  final int index;
  final RawPhoto rawPhoto;
  final bool highlighted;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final ValueChanged<int>? onRatingChanged;
  final ValueChanged<RatingColor?>? onColorChanged;

  const LazyThumbnailCard({
    super.key,
    required this.index,
    required this.rawPhoto,
    required this.highlighted,
    required this.onChanged,
    required this.onTap,
    required this.onDoubleTap,
    required this.onRatingChanged,
    required this.onColorChanged,
  });

  @override
  State<LazyThumbnailCard> createState() => _LazyThumbnailCardState();
}

class _LazyThumbnailCardState extends State<LazyThumbnailCard> {
  final paleYellow = Color.from(
    alpha: 1.0, red: 255, green: 251, blue: 242,

  );

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
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: highlighted ? Colors.blueAccent : (widget.rawPhoto.selected ? colorScheme.primaryContainer : null),
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
                    cacheWidth: 280,
                    onChanged: widget.onChanged,
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
                  Checkbox(
                    value: widget.rawPhoto.selected,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    onChanged: widget.onChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
