import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/model/rating_filter.dart';

import 'package:pixraw/model/raw_photos.dart';
import 'package:pixraw/util/rating_color.dart';

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
      final updatedPaths = List<RawPhoto>.from(state.rawPhotos);
      final current = updatedPaths[state.currentPhoto];

      updatedPaths[state.currentPhoto] = current.copyWith(
          selected: (current.selected==null || current.selected==false) ? true : null
      );

      state = state.copyWith(rawPhotos: updatedPaths);
    }
  }

  void toggleCurrentPhotoRejected() {
    if (state.rawPhotoPaths.isNotEmpty) {
      final updatedPaths = List<RawPhoto>.from(state.rawPhotos);
      final current = updatedPaths[state.currentPhoto];

      updatedPaths[state.currentPhoto] = current.copyWith(
          selected: (current.selected==null || current.selected==true) ? false : null
      );

      state = state.copyWith(rawPhotos: updatedPaths);
    }
  }

  void selectAllPhotos() {
    // Map to a brand new list with updated values
    final updatedPaths = state.rawPhotos.map((photo) {
      return photo.copyWith(selected: true);
    }).toList();

    state = state.copyWith(rawPhotos: updatedPaths);
  }

  void unSelectAllPhotos() {
    // Map to a brand new list with updated values
    final updatedPaths = state.rawPhotos.map((photo) {
      return photo.copyWith(selected: null);
    }).toList();

    state = state.copyWith(rawPhotos: updatedPaths);
  }

  void setRating(int? rating, {int? index}) {
    int i = index ?? state.currentPhoto;
    if(state.rawPhotoPaths.isNotEmpty) {
      final updatedPaths = List<RawPhoto>.from(state.rawPhotos);
      final current = updatedPaths[i];

      updatedPaths[i] = current.copyWith(
          rating: rating
      );

      state = state.copyWith(rawPhotos: updatedPaths);
    }
  }

  void setColor(RatingColor? color, {int? index}) {
    int i = index ?? state.currentPhoto;
    if(state.rawPhotoPaths.isNotEmpty) {
      final updatedPaths = List<RawPhoto>.from(state.rawPhotos);
      final current = updatedPaths[i];

      updatedPaths[i] = current.copyWith(
          color: color
      );

      state = state.copyWith(rawPhotos: updatedPaths);
    }
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
      rawPhotos: paths,
      ratingFilter: RatingFilter()
    );
  }

  Future<RawPhotoResult> loadThumbnail(int index) async {
    RawPhotoResult result = await RawPhotoLoader().loadRawPhotoThumbnail(state.rawPhotoPaths[index].filePath);
    if(result.hasError) {
      throw Exception('Failed to read raw file');
    }
    if (result.info != null && state.rawPhotoPaths.isNotEmpty) {
      final updatedPaths = List<RawPhoto>.from(state.rawPhotos);
      final current = updatedPaths[index];

      updatedPaths[index] = current.copyWith(
          info: result.info!,
          loaded: true
      );

      state = state.copyWith(rawPhotos: updatedPaths);
    }
    return result;
  }

  void toggleColorRatingFilter(RatingColor? color) {
    if(!state.ratingFilter.colors.contains(color)) {
      final colors = Set<RatingColor?>.from(state.ratingFilter.colors);
      colors.add(color);
      RatingFilter filter = state.ratingFilter.copyWith(colors: colors);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    } else {
      final colors = Set<RatingColor?>.from(state.ratingFilter.colors);
      colors.remove(color);
      RatingFilter filter = state.ratingFilter.copyWith(colors: colors);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    }
  }

  void toggleRatingFilter(int? rating) {
    if(!state.ratingFilter.ratings.contains(rating)) {
      final ratings = Set<int?>.from(state.ratingFilter.ratings);
      ratings.add(rating);
      RatingFilter filter = state.ratingFilter.copyWith(ratings: ratings);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    } else {
      final ratings = Set<int?>.from(state.ratingFilter.ratings);
      ratings.remove(rating);
      RatingFilter filter = state.ratingFilter.copyWith(ratings: ratings);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    }
  }

  void toggleRatingSelected() {
    if(state.ratingFilter.selected != null) {
      RatingFilter filter = state.ratingFilter.copyWith(selected: null);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    } else {
      RatingFilter filter = state.ratingFilter.copyWith(selected: true);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    }
  }
  void toggleRatingRejected() {
    if(state.ratingFilter.rejected != null) {
      RatingFilter filter = state.ratingFilter.copyWith(rejected: null);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    } else {
      RatingFilter filter = state.ratingFilter.copyWith(rejected: true);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    }
  }
  void toggleRatingNotRejectedOrSelected() {
    if(state.ratingFilter.notSelectedOrRejected != null) {
      RatingFilter filter = state.ratingFilter.copyWith(notSelectedOrRejected: null);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    } else {
      RatingFilter filter = state.ratingFilter.copyWith(notSelectedOrRejected: true);
      state = state.copyWith(ratingFilter: filter, currentPhoto: 0);
    }
  }

  void clearFilter() {
    state = state.copyWith(ratingFilter: RatingFilter());
  }

}

final rawPhotosProvider = NotifierProvider<RawPhotosNotifier, RawPhotos>(RawPhotosNotifier.new);