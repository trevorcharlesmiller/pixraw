import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pixraw/model/raw_photos.dart';

import '../model/raw_photo.dart';
import '../util/raw_utils.dart';

class RawPhotosNotifier extends Notifier<RawPhotos> {

  @override
  RawPhotos build() {
    return RawPhotos();
  }

  void setSelectedPhoto(int index) {
    state = state.copyWith(
      currentPhoto: index
    );
  }

  bool selectPrevious() {
    if(state.currentPhoto > 0) {
      state = state.copyWith(currentPhoto: state.currentPhoto-1);
      return true;
    }
    return false;
  }

  bool selectNext() {
    if (state.currentPhoto < state.rawPhotoPaths.length - 1) {
      state = state.copyWith(currentPhoto: state.currentPhoto+1);
      return true;
    }
    return false;
  }

  void toggleCurrentPhotoSelected() {
    if (state.rawPhotoPaths.isNotEmpty) {
      // 1. Create a modifiable copy of the list
      final updatedPaths = List<RawPhoto>.from(state.rawPhotoPaths);
      final current = updatedPaths[state.currentPhoto];

      // 2. Update the item
      updatedPaths[state.currentPhoto] = current.copyWith(
          selected: !current.selected
      );

      // 3. Reassign the state using copyWith
      state = state.copyWith(rawPhotoPaths: updatedPaths);
    }
  }

  void selectAllPhotos() {
    // Map to a brand new list with updated values
    final updatedPaths = state.rawPhotoPaths.map((photo) {
      return photo.copyWith(selected: true);
    }).toList();

    state = state.copyWith(rawPhotoPaths: updatedPaths);
  }

  void unSelectAllPhotos() {
    // Map to a brand new list with updated values
    final updatedPaths = state.rawPhotoPaths.map((photo) {
      return photo.copyWith(selected: false);
    }).toList();

    state = state.copyWith(rawPhotoPaths: updatedPaths);
  }

  Future<void> setSelectedDirectory(Directory selectedDir) async {
    List<RawPhoto> paths = await selectedDir
        .list(recursive: false, followLinks: false)
        .where((entity) {
      if (entity is! File) return false;
      final ext = p.extension(entity.path).toLowerCase();
      return rawExtensions.contains(ext);
    })
        .map((file) => RawPhoto(filePath: file.path))
        .toList();

    print('  ## Set state with $paths');
    state = state.copyWith(
      currentPhoto: 0,
      directory: selectedDir,
      rawPhotoPaths: paths
    );
  }
}

final rawPhotosProvider = NotifierProvider<RawPhotosNotifier, RawPhotos>(RawPhotosNotifier.new);