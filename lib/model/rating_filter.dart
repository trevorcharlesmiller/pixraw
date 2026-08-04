import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixraw/model/raw_photo.dart';

import '../util/rating_color.dart';

part 'rating_filter.freezed.dart';

@freezed
abstract class RatingFilter with _$RatingFilter {
  const RatingFilter._(); // Required for adding custom getters/methods

  const factory RatingFilter({
    @Default({}) Set<int?> ratings,
    @Default({}) Set<RatingColor?> colors,
    @Default(null) bool? selected,
    @Default(null) bool? rejected,
    @Default(null) bool? notSelectedOrRejected,
  }) = _RatingFilter;

  /// Returns true if and only if both sets are empty.
  bool get isEmpty =>
      (ratings.isEmpty && colors.isEmpty && selected==null && rejected==null && notSelectedOrRejected==null);

  /// Returns true if at least one set contains items.
  bool get isNotEmpty => !isEmpty;

  bool isMatch(RawPhoto rawPhoto) {
    if(isEmpty) {
      return true;
    }
    if(
      ratings.contains(rawPhoto.rating) 
      || colors.contains(rawPhoto.color)
      || (notSelectedOrRejected != null && notSelectedOrRejected==true && rawPhoto.selected==null)
      || (selected != null && selected==true && rawPhoto.selected==true)
      || (rejected != null && rejected==true && rawPhoto.selected==false)
    ) {
      return true;
    }

    return false;
  }
}