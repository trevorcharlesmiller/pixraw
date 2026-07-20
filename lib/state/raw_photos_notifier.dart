import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pixraw/model/raw_photos.dart';

import '../model/raw_photo.dart';
import '../model/raw_photo_load_result.dart';
import '../raw/raw_photo_loader.dart';
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
      final updatedPaths = List<RawPhoto>.from(state.rawPhotoPaths);
      final current = updatedPaths[state.currentPhoto];

      updatedPaths[state.currentPhoto] = current.copyWith(
          selected: !current.selected
      );

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
    state = state.copyWith(
      currentPhoto: 0,
      directory: selectedDir,
      rawPhotoPaths: paths
    );
  }

  Future<RawPhotoResult> loadThumbnail(int index) async {
    RawPhotoResult result = await RawPhotoLoader().loadRawPhotoThumbnail(state.rawPhotoPaths[index]);
    if (result.info != null && state.rawPhotoPaths.isNotEmpty) {
      final updatedPaths = List<RawPhoto>.from(state.rawPhotoPaths);
      final current = updatedPaths[state.currentPhoto];

      updatedPaths[state.currentPhoto] = current.copyWith(
          info: result.info!
      );

      state = state.copyWith(rawPhotoPaths: updatedPaths);
    }
    return result;
  }
}

final rawPhotosProvider = NotifierProvider<RawPhotosNotifier, RawPhotos>(RawPhotosNotifier.new);