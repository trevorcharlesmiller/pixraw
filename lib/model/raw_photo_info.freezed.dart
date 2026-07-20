// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_photo_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RawPhotoInfo {

 int get flip;
/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<RawPhotoInfo> get copyWith => _$RawPhotoInfoCopyWithImpl<RawPhotoInfo>(this as RawPhotoInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPhotoInfo&&(identical(other.flip, flip) || other.flip == flip));
}


@override
int get hashCode => Object.hash(runtimeType,flip);

@override
String toString() {
  return 'RawPhotoInfo(flip: $flip)';
}


}

/// @nodoc
abstract mixin class $RawPhotoInfoCopyWith<$Res>  {
  factory $RawPhotoInfoCopyWith(RawPhotoInfo value, $Res Function(RawPhotoInfo) _then) = _$RawPhotoInfoCopyWithImpl;
@useResult
$Res call({
 int flip
});




}
/// @nodoc
class _$RawPhotoInfoCopyWithImpl<$Res>
    implements $RawPhotoInfoCopyWith<$Res> {
  _$RawPhotoInfoCopyWithImpl(this._self, this._then);

  final RawPhotoInfo _self;
  final $Res Function(RawPhotoInfo) _then;

/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flip = null,}) {
  return _then(_self.copyWith(
flip: null == flip ? _self.flip : flip // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RawPhotoInfo].
extension RawPhotoInfoPatterns on RawPhotoInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawPhotoInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawPhotoInfo value)  $default,){
final _that = this;
switch (_that) {
case _RawPhotoInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawPhotoInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int flip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
return $default(_that.flip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int flip)  $default,) {final _that = this;
switch (_that) {
case _RawPhotoInfo():
return $default(_that.flip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int flip)?  $default,) {final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
return $default(_that.flip);case _:
  return null;

}
}

}

/// @nodoc


class _RawPhotoInfo implements RawPhotoInfo {
  const _RawPhotoInfo({this.flip = 0});
  

@override@JsonKey() final  int flip;

/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPhotoInfoCopyWith<_RawPhotoInfo> get copyWith => __$RawPhotoInfoCopyWithImpl<_RawPhotoInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPhotoInfo&&(identical(other.flip, flip) || other.flip == flip));
}


@override
int get hashCode => Object.hash(runtimeType,flip);

@override
String toString() {
  return 'RawPhotoInfo(flip: $flip)';
}


}

/// @nodoc
abstract mixin class _$RawPhotoInfoCopyWith<$Res> implements $RawPhotoInfoCopyWith<$Res> {
  factory _$RawPhotoInfoCopyWith(_RawPhotoInfo value, $Res Function(_RawPhotoInfo) _then) = __$RawPhotoInfoCopyWithImpl;
@override @useResult
$Res call({
 int flip
});




}
/// @nodoc
class __$RawPhotoInfoCopyWithImpl<$Res>
    implements _$RawPhotoInfoCopyWith<$Res> {
  __$RawPhotoInfoCopyWithImpl(this._self, this._then);

  final _RawPhotoInfo _self;
  final $Res Function(_RawPhotoInfo) _then;

/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flip = null,}) {
  return _then(_RawPhotoInfo(
flip: null == flip ? _self.flip : flip // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
