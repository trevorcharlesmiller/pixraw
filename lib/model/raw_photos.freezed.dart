// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_photos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RawPhotos {

 Directory? get directory; List<RawPhoto> get rawPhotoPaths; int get currentPhoto;
/// Create a copy of RawPhotos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPhotosCopyWith<RawPhotos> get copyWith => _$RawPhotosCopyWithImpl<RawPhotos>(this as RawPhotos, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPhotos&&(identical(other.directory, directory) || other.directory == directory)&&const DeepCollectionEquality().equals(other.rawPhotoPaths, rawPhotoPaths)&&(identical(other.currentPhoto, currentPhoto) || other.currentPhoto == currentPhoto));
}


@override
int get hashCode => Object.hash(runtimeType,directory,const DeepCollectionEquality().hash(rawPhotoPaths),currentPhoto);

@override
String toString() {
  return 'RawPhotos(directory: $directory, rawPhotoPaths: $rawPhotoPaths, currentPhoto: $currentPhoto)';
}


}

/// @nodoc
abstract mixin class $RawPhotosCopyWith<$Res>  {
  factory $RawPhotosCopyWith(RawPhotos value, $Res Function(RawPhotos) _then) = _$RawPhotosCopyWithImpl;
@useResult
$Res call({
 Directory? directory, List<RawPhoto> rawPhotoPaths, int currentPhoto
});




}
/// @nodoc
class _$RawPhotosCopyWithImpl<$Res>
    implements $RawPhotosCopyWith<$Res> {
  _$RawPhotosCopyWithImpl(this._self, this._then);

  final RawPhotos _self;
  final $Res Function(RawPhotos) _then;

/// Create a copy of RawPhotos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? directory = freezed,Object? rawPhotoPaths = null,Object? currentPhoto = null,}) {
  return _then(_self.copyWith(
directory: freezed == directory ? _self.directory : directory // ignore: cast_nullable_to_non_nullable
as Directory?,rawPhotoPaths: null == rawPhotoPaths ? _self.rawPhotoPaths : rawPhotoPaths // ignore: cast_nullable_to_non_nullable
as List<RawPhoto>,currentPhoto: null == currentPhoto ? _self.currentPhoto : currentPhoto // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RawPhotos].
extension RawPhotosPatterns on RawPhotos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawPhotos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawPhotos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawPhotos value)  $default,){
final _that = this;
switch (_that) {
case _RawPhotos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawPhotos value)?  $default,){
final _that = this;
switch (_that) {
case _RawPhotos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Directory? directory,  List<RawPhoto> rawPhotoPaths,  int currentPhoto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPhotos() when $default != null:
return $default(_that.directory,_that.rawPhotoPaths,_that.currentPhoto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Directory? directory,  List<RawPhoto> rawPhotoPaths,  int currentPhoto)  $default,) {final _that = this;
switch (_that) {
case _RawPhotos():
return $default(_that.directory,_that.rawPhotoPaths,_that.currentPhoto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Directory? directory,  List<RawPhoto> rawPhotoPaths,  int currentPhoto)?  $default,) {final _that = this;
switch (_that) {
case _RawPhotos() when $default != null:
return $default(_that.directory,_that.rawPhotoPaths,_that.currentPhoto);case _:
  return null;

}
}

}

/// @nodoc


class _RawPhotos implements RawPhotos {
  const _RawPhotos({this.directory = null, final  List<RawPhoto> rawPhotoPaths = const [], this.currentPhoto = 0}): _rawPhotoPaths = rawPhotoPaths;
  

@override@JsonKey() final  Directory? directory;
 final  List<RawPhoto> _rawPhotoPaths;
@override@JsonKey() List<RawPhoto> get rawPhotoPaths {
  if (_rawPhotoPaths is EqualUnmodifiableListView) return _rawPhotoPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rawPhotoPaths);
}

@override@JsonKey() final  int currentPhoto;

/// Create a copy of RawPhotos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPhotosCopyWith<_RawPhotos> get copyWith => __$RawPhotosCopyWithImpl<_RawPhotos>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPhotos&&(identical(other.directory, directory) || other.directory == directory)&&const DeepCollectionEquality().equals(other._rawPhotoPaths, _rawPhotoPaths)&&(identical(other.currentPhoto, currentPhoto) || other.currentPhoto == currentPhoto));
}


@override
int get hashCode => Object.hash(runtimeType,directory,const DeepCollectionEquality().hash(_rawPhotoPaths),currentPhoto);

@override
String toString() {
  return 'RawPhotos(directory: $directory, rawPhotoPaths: $rawPhotoPaths, currentPhoto: $currentPhoto)';
}


}

/// @nodoc
abstract mixin class _$RawPhotosCopyWith<$Res> implements $RawPhotosCopyWith<$Res> {
  factory _$RawPhotosCopyWith(_RawPhotos value, $Res Function(_RawPhotos) _then) = __$RawPhotosCopyWithImpl;
@override @useResult
$Res call({
 Directory? directory, List<RawPhoto> rawPhotoPaths, int currentPhoto
});




}
/// @nodoc
class __$RawPhotosCopyWithImpl<$Res>
    implements _$RawPhotosCopyWith<$Res> {
  __$RawPhotosCopyWithImpl(this._self, this._then);

  final _RawPhotos _self;
  final $Res Function(_RawPhotos) _then;

/// Create a copy of RawPhotos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? directory = freezed,Object? rawPhotoPaths = null,Object? currentPhoto = null,}) {
  return _then(_RawPhotos(
directory: freezed == directory ? _self.directory : directory // ignore: cast_nullable_to_non_nullable
as Directory?,rawPhotoPaths: null == rawPhotoPaths ? _self._rawPhotoPaths : rawPhotoPaths // ignore: cast_nullable_to_non_nullable
as List<RawPhoto>,currentPhoto: null == currentPhoto ? _self.currentPhoto : currentPhoto // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
