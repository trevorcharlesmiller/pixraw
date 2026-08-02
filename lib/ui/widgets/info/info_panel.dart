import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

import '../../../model/raw_photos.dart';
import '../../../state/raw_photos_notifier.dart';
import 'info_row.dart';

const TextStyle labelStyle = TextStyle(
    fontSize: 9
);

class InfoPanel extends ConsumerWidget {

  const InfoPanel({super.key});

  String formatShutter(double? shutter) {
    if(shutter == null) {
      return '';
    } else
    if(shutter < 1.0) {
      return '1/${(1/shutter).toStringAsFixed(0)}s';
    } else {
      return '${(shutter).toStringAsFixed(2)}s';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    if(rawPhotos.rawPhotoPaths.isEmpty) {
      return Card(
        child: Padding(padding: const EdgeInsets.all(15.0),
        child: SizedBox(width: 262,child: Column(),),),
      );
    }
    RawPhoto photo = rawPhotos.rawPhotoPaths[rawPhotos.currentPhoto];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 262,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Image Info',
              ),
              const Divider(),
              InfoRow(label: 'Filename', value: p.basename(photo.filePath),),
              InfoRow(label: 'Capture Date', value: photo.info.timestamp==null ? '' :
                DateFormat.yMd().format(photo.info.timestamp!),),
              InfoRow(label: 'Capture Time', value: photo.info.timestamp==null ? '' : DateFormat.jm().format(photo.info.timestamp!),),
              InfoRow(label: 'Dimensions', value: '${photo.info.width} x ${photo.info.height}'),
              InfoRow(label: 'Camera Make', value: photo.info.cameraMake==null ? '' :
                photo.info.cameraMake!,),
              InfoRow(label: 'Camera Model', value: photo.info.cameraModel==null ? '' :
                photo.info.cameraModel!,),
              InfoRow(label: 'Lens', value: photo.info.lens==null ? '' :
                photo.info.lens!,),
              InfoRow(label: 'ISO', value: photo.info.iso==null ? '' : '${photo.info.iso}',),
              InfoRow(label: 'Aperture', value: photo.info.aperture==null ? '' : 'f${photo.info.aperture!.toStringAsPrecision(2)}',),
              InfoRow(label: 'Shutter', value: photo.info.shutter==null ? '' : formatShutter(photo.info.shutter),),
              InfoRow(label: 'Focal Length', value: photo.info.focalLength==null ? '' : '${photo.info.focalLength}mm'),

            ],
          ),
        ),
      ),
    );
  }
}
