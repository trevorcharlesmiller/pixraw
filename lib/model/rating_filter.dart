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
    if (isEmpty) {
      return true;
    }

    // 1. Ratings Check (OR within ratings, if any are selected)
    // If the ratings set is not empty, the photo's rating must be in the set.
    // If it is empty, this condition is skipped (passes).
    final bool matchesRatings = ratings.isEmpty || ratings.contains(rawPhoto.rating);

    // 2. Colors Check (OR within colors, if any are selected)
    final bool matchesColors = colors.isEmpty || colors.contains(rawPhoto.color);

    // 3. Selection / Rejection / Not Selected-or-Rejected Checks
    // For each boolean flag, if it is explicitly set to true, the photo must match it.
    // If the flag is null, we ignore it.
    final bool matchesSelected = selected == null || (selected! && rawPhoto.selected == true);
    final bool matchesRejected = rejected == null || (rejected! && rawPhoto.selected == false);
    final bool matchesNotSelectedOrRejected = notSelectedOrRejected == null || 
        (notSelectedOrRejected! && rawPhoto.selected == null);

    // Combine all active categories with an AND operation.
    return matchesRatings && 
           matchesColors && 
           matchesSelected && 
           matchesRejected && 
           matchesNotSelectedOrRejected;
  }
}