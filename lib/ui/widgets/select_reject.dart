import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/raw_photo.dart';
import '../../model/raw_photos.dart';
import '../../state/raw_photos_notifier.dart' show rawPhotosProvider;

class SelectReject extends ConsumerWidget {
  final int? index;
  const SelectReject({super.key, this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    RawPhoto rawPhoto = rawPhotos.rawPhotoPaths[index ?? rawPhotos.currentPhoto];
    bool rejected = (rawPhoto.selected!= null && rawPhoto.selected==false);
    bool selected = (rawPhoto.selected!= null && rawPhoto.selected==true);
    return Row(
      spacing: 5,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
            onPressed: (){
              if (index != null && rawPhotos.currentPhoto != index) {
                ref.read(rawPhotosProvider.notifier).setSelectedPhoto(index!);
              }
              ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoRejected();
            },
            icon: FaIcon(FontAwesomeIcons.squareXmark, size: 16, color: rejected ? Colors.red : null,),),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: (){
            if (index != null && rawPhotos.currentPhoto != index) {
              ref.read(rawPhotosProvider.notifier).setSelectedPhoto(index!);
            }
            ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoSelected();
          },
          icon: selected ? FaIcon(FontAwesomeIcons.squareCheck, size: 16, color: Colors.green,)
            : FaIcon(FontAwesomeIcons.square, size: 16,),
        ),
      ],
    );
  }
}
