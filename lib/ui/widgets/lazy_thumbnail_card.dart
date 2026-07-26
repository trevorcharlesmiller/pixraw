import 'package:flutter/material.dart';
import 'package:pixraw/ui/widgets/raw_image.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:path/path.dart' as p;

class LazyThumbnailCard extends StatefulWidget {
  final int index;
  final RawPhoto rawPhoto;
  final bool highlighted;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const LazyThumbnailCard({
    super.key,
    required this.index,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.basename(widget.rawPhoto.filePath),
                style: TextStyle(fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
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
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(width: 10),
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
