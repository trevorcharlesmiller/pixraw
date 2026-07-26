import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

import '../../model/raw_photos.dart';
import '../../state/raw_photos_notifier.dart';

const TextStyle labelStyle = TextStyle(
    fontSize: 9
);

class InfoPanel extends ConsumerWidget {

  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    if(rawPhotos.rawPhotoPaths.isEmpty) {
      return Card();
    }
    RawPhoto photo = rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 262,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Image Info',
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Filename',
                      style: labelStyle,
                    ),
                  ),

                  Text(
                    p.basename(photo.filePath),
                    style: TextStyle(fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Capture Date',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.timestamp==null ? '' :
                    DateFormat.yMd().format(photo.info.timestamp!),
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Capture Time',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.timestamp==null ? '' : DateFormat.jm().format(photo.info.timestamp!),
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Dimensions',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    '${photo.info.width} x ${photo.info.height}',
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Camera Make',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.cameraMake==null ? '' :
                    photo.info.cameraMake!,
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Camera Model',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.cameraModel==null ? '' :
                    photo.info.cameraModel!,
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Lens',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.lens==null ? '' :
                    photo.info.lens!,
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'ISO',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.iso==null ? '' : '${photo.info.iso}',
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Aperture',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.aperture==null ? '' : 'f${photo.info.aperture!.toStringAsPrecision(2)}',
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Shutter',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.shutter==null ? '' : '${photo.info.shutter}s',
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Focal Length',
                      style: labelStyle,
                    ),
                  ),
                  Text(
                    photo.info.focalLength==null ? '' : '${photo.info.focalLength}mm',
                    style: TextStyle(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
