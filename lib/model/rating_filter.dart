import 'package:freezed_annotation/freezed_annotation.dart';

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
      (ratings.isEmpty && colors.isEmpty && selected==null && rejected==null);

  /// Returns true if at least one set contains items.
  bool get isNotEmpty => !isEmpty;
}