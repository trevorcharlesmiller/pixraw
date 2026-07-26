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

 String? get cameraMake; String? get cameraModel; String? get lens; double? get aperture; double? get shutter; int? get iso; int? get focalLength; int? get width; int? get height; DateTime? get timestamp; int get flip;
/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<RawPhotoInfo> get copyWith => _$RawPhotoInfoCopyWithImpl<RawPhotoInfo>(this as RawPhotoInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPhotoInfo&&(identical(other.cameraMake, cameraMake) || other.cameraMake == cameraMake)&&(identical(other.cameraModel, cameraModel) || other.cameraModel == cameraModel)&&(identical(other.lens, lens) || other.lens == lens)&&(identical(other.aperture, aperture) || other.aperture == aperture)&&(identical(other.shutter, shutter) || other.shutter == shutter)&&(identical(other.iso, iso) || other.iso == iso)&&(identical(other.focalLength, focalLength) || other.focalLength == focalLength)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.flip, flip) || other.flip == flip));
}


@override
int get hashCode => Object.hash(runtimeType,cameraMake,cameraModel,lens,aperture,shutter,iso,focalLength,width,height,timestamp,flip);

@override
String toString() {
  return 'RawPhotoInfo(cameraMake: $cameraMake, cameraModel: $cameraModel, lens: $lens, aperture: $aperture, shutter: $shutter, iso: $iso, focalLength: $focalLength, width: $width, height: $height, timestamp: $timestamp, flip: $flip)';
}


}

/// @nodoc
abstract mixin class $RawPhotoInfoCopyWith<$Res>  {
  factory $RawPhotoInfoCopyWith(RawPhotoInfo value, $Res Function(RawPhotoInfo) _then) = _$RawPhotoInfoCopyWithImpl;
@useResult
$Res call({
 String? cameraMake, String? cameraModel, String? lens, double? aperture, double? shutter, int? iso, int? focalLength, int? width, int? height, DateTime? timestamp, int flip
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
@pragma('vm:prefer-inline') @override $Res call({Object? cameraMake = freezed,Object? cameraModel = freezed,Object? lens = freezed,Object? aperture = freezed,Object? shutter = freezed,Object? iso = freezed,Object? focalLength = freezed,Object? width = freezed,Object? height = freezed,Object? timestamp = freezed,Object? flip = null,}) {
  return _then(_self.copyWith(
cameraMake: freezed == cameraMake ? _self.cameraMake : cameraMake // ignore: cast_nullable_to_non_nullable
as String?,cameraModel: freezed == cameraModel ? _self.cameraModel : cameraModel // ignore: cast_nullable_to_non_nullable
as String?,lens: freezed == lens ? _self.lens : lens // ignore: cast_nullable_to_non_nullable
as String?,aperture: freezed == aperture ? _self.aperture : aperture // ignore: cast_nullable_to_non_nullable
as double?,shutter: freezed == shutter ? _self.shutter : shutter // ignore: cast_nullable_to_non_nullable
as double?,iso: freezed == iso ? _self.iso : iso // ignore: cast_nullable_to_non_nullable
as int?,focalLength: freezed == focalLength ? _self.focalLength : focalLength // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,flip: null == flip ? _self.flip : flip // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cameraMake,  String? cameraModel,  String? lens,  double? aperture,  double? shutter,  int? iso,  int? focalLength,  int? width,  int? height,  DateTime? timestamp,  int flip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
return $default(_that.cameraMake,_that.cameraModel,_that.lens,_that.aperture,_that.shutter,_that.iso,_that.focalLength,_that.width,_that.height,_that.timestamp,_that.flip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cameraMake,  String? cameraModel,  String? lens,  double? aperture,  double? shutter,  int? iso,  int? focalLength,  int? width,  int? height,  DateTime? timestamp,  int flip)  $default,) {final _that = this;
switch (_that) {
case _RawPhotoInfo():
return $default(_that.cameraMake,_that.cameraModel,_that.lens,_that.aperture,_that.shutter,_that.iso,_that.focalLength,_that.width,_that.height,_that.timestamp,_that.flip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cameraMake,  String? cameraModel,  String? lens,  double? aperture,  double? shutter,  int? iso,  int? focalLength,  int? width,  int? height,  DateTime? timestamp,  int flip)?  $default,) {final _that = this;
switch (_that) {
case _RawPhotoInfo() when $default != null:
return $default(_that.cameraMake,_that.cameraModel,_that.lens,_that.aperture,_that.shutter,_that.iso,_that.focalLength,_that.width,_that.height,_that.timestamp,_that.flip);case _:
  return null;

}
}

}

/// @nodoc


class _RawPhotoInfo implements RawPhotoInfo {
  const _RawPhotoInfo({this.cameraMake = null, this.cameraModel = null, this.lens = null, this.aperture = null, this.shutter = null, this.iso = null, this.focalLength = null, this.width = null, this.height = null, this.timestamp = null, this.flip = 0});
  

@override@JsonKey() final  String? cameraMake;
@override@JsonKey() final  String? cameraModel;
@override@JsonKey() final  String? lens;
@override@JsonKey() final  double? aperture;
@override@JsonKey() final  double? shutter;
@override@JsonKey() final  int? iso;
@override@JsonKey() final  int? focalLength;
@override@JsonKey() final  int? width;
@override@JsonKey() final  int? height;
@override@JsonKey() final  DateTime? timestamp;
@override@JsonKey() final  int flip;

/// Create a copy of RawPhotoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPhotoInfoCopyWith<_RawPhotoInfo> get copyWith => __$RawPhotoInfoCopyWithImpl<_RawPhotoInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPhotoInfo&&(identical(other.cameraMake, cameraMake) || other.cameraMake == cameraMake)&&(identical(other.cameraModel, cameraModel) || other.cameraModel == cameraModel)&&(identical(other.lens, lens) || other.lens == lens)&&(identical(other.aperture, aperture) || other.aperture == aperture)&&(identical(other.shutter, shutter) || other.shutter == shutter)&&(identical(other.iso, iso) || other.iso == iso)&&(identical(other.focalLength, focalLength) || other.focalLength == focalLength)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.flip, flip) || other.flip == flip));
}


@override
int get hashCode => Object.hash(runtimeType,cameraMake,cameraModel,lens,aperture,shutter,iso,focalLength,width,height,timestamp,flip);

@override
String toString() {
  return 'RawPhotoInfo(cameraMake: $cameraMake, cameraModel: $cameraModel, lens: $lens, aperture: $aperture, shutter: $shutter, iso: $iso, focalLength: $focalLength, width: $width, height: $height, timestamp: $timestamp, flip: $flip)';
}


}

/// @nodoc
abstract mixin class _$RawPhotoInfoCopyWith<$Res> implements $RawPhotoInfoCopyWith<$Res> {
  factory _$RawPhotoInfoCopyWith(_RawPhotoInfo value, $Res Function(_RawPhotoInfo) _then) = __$RawPhotoInfoCopyWithImpl;
@override @useResult
$Res call({
 String? cameraMake, String? cameraModel, String? lens, double? aperture, double? shutter, int? iso, int? focalLength, int? width, int? height, DateTime? timestamp, int flip
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
@override @pragma('vm:prefer-inline') $Res call({Object? cameraMake = freezed,Object? cameraModel = freezed,Object? lens = freezed,Object? aperture = freezed,Object? shutter = freezed,Object? iso = freezed,Object? focalLength = freezed,Object? width = freezed,Object? height = freezed,Object? timestamp = freezed,Object? flip = null,}) {
  return _then(_RawPhotoInfo(
cameraMake: freezed == cameraMake ? _self.cameraMake : cameraMake // ignore: cast_nullable_to_non_nullable
as String?,cameraModel: freezed == cameraModel ? _self.cameraModel : cameraModel // ignore: cast_nullable_to_non_nullable
as String?,lens: freezed == lens ? _self.lens : lens // ignore: cast_nullable_to_non_nullable
as String?,aperture: freezed == aperture ? _self.aperture : aperture // ignore: cast_nullable_to_non_nullable
as double?,shutter: freezed == shutter ? _self.shutter : shutter // ignore: cast_nullable_to_non_nullable
as double?,iso: freezed == iso ? _self.iso : iso // ignore: cast_nullable_to_non_nullable
as int?,focalLength: freezed == focalLength ? _self.focalLength : focalLength // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,flip: null == flip ? _self.flip : flip // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
