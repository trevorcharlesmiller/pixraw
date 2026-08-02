

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/rating_filter.dart';
import '../util/rating_color.dart';

class RatingFilterNotifier extends Notifier<RatingFilter> {
  @override
  RatingFilter build() {
    return RatingFilter();
  }

  void addRating(int rating) {
    final ratings = Set<int>.from(state.ratings);
    ratings.add(rating);
    state = state.copyWith(ratings: ratings);
  }

  void addRatingColor(RatingColor ratingColor) {
    final ratings = Set<RatingColor>.from(state.colors);
    ratings.add(ratingColor);
    state = state.copyWith(colors: ratings);
  }

  void clearRatings() {
    state = state.copyWith(ratings: {});
  }
  void clearRatingColors() {
    state = state.copyWith(colors: {});
  }

}

final ratingFilterProvider = NotifierProvider<RatingFilterNotifier, RatingFilter>(RatingFilterNotifier.new);