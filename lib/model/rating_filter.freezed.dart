// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RatingFilter {

 Set<int?> get ratings; Set<RatingColor?> get colors; bool? get selected; bool? get rejected; bool? get notSelectedOrRejected;
/// Create a copy of RatingFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingFilterCopyWith<RatingFilter> get copyWith => _$RatingFilterCopyWithImpl<RatingFilter>(this as RatingFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingFilter&&const DeepCollectionEquality().equals(other.ratings, ratings)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rejected, rejected) || other.rejected == rejected)&&(identical(other.notSelectedOrRejected, notSelectedOrRejected) || other.notSelectedOrRejected == notSelectedOrRejected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ratings),const DeepCollectionEquality().hash(colors),selected,rejected,notSelectedOrRejected);

@override
String toString() {
  return 'RatingFilter(ratings: $ratings, colors: $colors, selected: $selected, rejected: $rejected, notSelectedOrRejected: $notSelectedOrRejected)';
}


}

/// @nodoc
abstract mixin class $RatingFilterCopyWith<$Res>  {
  factory $RatingFilterCopyWith(RatingFilter value, $Res Function(RatingFilter) _then) = _$RatingFilterCopyWithImpl;
@useResult
$Res call({
 Set<int?> ratings, Set<RatingColor?> colors, bool? selected, bool? rejected, bool? notSelectedOrRejected
});




}
/// @nodoc
class _$RatingFilterCopyWithImpl<$Res>
    implements $RatingFilterCopyWith<$Res> {
  _$RatingFilterCopyWithImpl(this._self, this._then);

  final RatingFilter _self;
  final $Res Function(RatingFilter) _then;

/// Create a copy of RatingFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ratings = null,Object? colors = null,Object? selected = freezed,Object? rejected = freezed,Object? notSelectedOrRejected = freezed,}) {
  return _then(_self.copyWith(
ratings: null == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as Set<int?>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as Set<RatingColor?>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool?,rejected: freezed == rejected ? _self.rejected : rejected // ignore: cast_nullable_to_non_nullable
as bool?,notSelectedOrRejected: freezed == notSelectedOrRejected ? _self.notSelectedOrRejected : notSelectedOrRejected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingFilter].
extension RatingFilterPatterns on RatingFilter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingFilter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingFilter value)  $default,){
final _that = this;
switch (_that) {
case _RatingFilter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingFilter value)?  $default,){
final _that = this;
switch (_that) {
case _RatingFilter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<int?> ratings,  Set<RatingColor?> colors,  bool? selected,  bool? rejected,  bool? notSelectedOrRejected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingFilter() when $default != null:
return $default(_that.ratings,_that.colors,_that.selected,_that.rejected,_that.notSelectedOrRejected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<int?> ratings,  Set<RatingColor?> colors,  bool? selected,  bool? rejected,  bool? notSelectedOrRejected)  $default,) {final _that = this;
switch (_that) {
case _RatingFilter():
return $default(_that.ratings,_that.colors,_that.selected,_that.rejected,_that.notSelectedOrRejected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<int?> ratings,  Set<RatingColor?> colors,  bool? selected,  bool? rejected,  bool? notSelectedOrRejected)?  $default,) {final _that = this;
switch (_that) {
case _RatingFilter() when $default != null:
return $default(_that.ratings,_that.colors,_that.selected,_that.rejected,_that.notSelectedOrRejected);case _:
  return null;

}
}

}

/// @nodoc


class _RatingFilter extends RatingFilter {
  const _RatingFilter({final  Set<int?> ratings = const {}, final  Set<RatingColor?> colors = const {}, this.selected = null, this.rejected = null, this.notSelectedOrRejected = null}): _ratings = ratings,_colors = colors,super._();
  

 final  Set<int?> _ratings;
@override@JsonKey() Set<int?> get ratings {
  if (_ratings is EqualUnmodifiableSetView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_ratings);
}

 final  Set<RatingColor?> _colors;
@override@JsonKey() Set<RatingColor?> get colors {
  if (_colors is EqualUnmodifiableSetView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_colors);
}

@override@JsonKey() final  bool? selected;
@override@JsonKey() final  bool? rejected;
@override@JsonKey() final  bool? notSelectedOrRejected;

/// Create a copy of RatingFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingFilterCopyWith<_RatingFilter> get copyWith => __$RatingFilterCopyWithImpl<_RatingFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingFilter&&const DeepCollectionEquality().equals(other._ratings, _ratings)&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rejected, rejected) || other.rejected == rejected)&&(identical(other.notSelectedOrRejected, notSelectedOrRejected) || other.notSelectedOrRejected == notSelectedOrRejected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ratings),const DeepCollectionEquality().hash(_colors),selected,rejected,notSelectedOrRejected);

@override
String toString() {
  return 'RatingFilter(ratings: $ratings, colors: $colors, selected: $selected, rejected: $rejected, notSelectedOrRejected: $notSelectedOrRejected)';
}


}

/// @nodoc
abstract mixin class _$RatingFilterCopyWith<$Res> implements $RatingFilterCopyWith<$Res> {
  factory _$RatingFilterCopyWith(_RatingFilter value, $Res Function(_RatingFilter) _then) = __$RatingFilterCopyWithImpl;
@override @useResult
$Res call({
 Set<int?> ratings, Set<RatingColor?> colors, bool? selected, bool? rejected, bool? notSelectedOrRejected
});




}
/// @nodoc
class __$RatingFilterCopyWithImpl<$Res>
    implements _$RatingFilterCopyWith<$Res> {
  __$RatingFilterCopyWithImpl(this._self, this._then);

  final _RatingFilter _self;
  final $Res Function(_RatingFilter) _then;

/// Create a copy of RatingFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ratings = null,Object? colors = null,Object? selected = freezed,Object? rejected = freezed,Object? notSelectedOrRejected = freezed,}) {
  return _then(_RatingFilter(
ratings: null == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as Set<int?>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as Set<RatingColor?>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool?,rejected: freezed == rejected ? _self.rejected : rejected // ignore: cast_nullable_to_non_nullable
as bool?,notSelectedOrRejected: freezed == notSelectedOrRejected ? _self.notSelectedOrRejected : notSelectedOrRejected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
