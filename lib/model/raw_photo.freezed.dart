// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RawPhoto {

 String get filePath; bool get selected; bool get loaded; RawPhotoInfo get info;
/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPhotoCopyWith<RawPhoto> get copyWith => _$RawPhotoCopyWithImpl<RawPhoto>(this as RawPhoto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPhoto&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,filePath,selected,loaded,info);

@override
String toString() {
  return 'RawPhoto(filePath: $filePath, selected: $selected, loaded: $loaded, info: $info)';
}


}

/// @nodoc
abstract mixin class $RawPhotoCopyWith<$Res>  {
  factory $RawPhotoCopyWith(RawPhoto value, $Res Function(RawPhoto) _then) = _$RawPhotoCopyWithImpl;
@useResult
$Res call({
 String filePath, bool selected, bool loaded, RawPhotoInfo info
});


$RawPhotoInfoCopyWith<$Res> get info;

}
/// @nodoc
class _$RawPhotoCopyWithImpl<$Res>
    implements $RawPhotoCopyWith<$Res> {
  _$RawPhotoCopyWithImpl(this._self, this._then);

  final RawPhoto _self;
  final $Res Function(RawPhoto) _then;

/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filePath = null,Object? selected = null,Object? loaded = null,Object? info = null,}) {
  return _then(_self.copyWith(
filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,loaded: null == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RawPhotoInfo,
  ));
}
/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<$Res> get info {
  
  return $RawPhotoInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [RawPhoto].
extension RawPhotoPatterns on RawPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawPhoto value)  $default,){
final _that = this;
switch (_that) {
case _RawPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _RawPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filePath,  bool selected,  bool loaded,  RawPhotoInfo info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPhoto() when $default != null:
return $default(_that.filePath,_that.selected,_that.loaded,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filePath,  bool selected,  bool loaded,  RawPhotoInfo info)  $default,) {final _that = this;
switch (_that) {
case _RawPhoto():
return $default(_that.filePath,_that.selected,_that.loaded,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filePath,  bool selected,  bool loaded,  RawPhotoInfo info)?  $default,) {final _that = this;
switch (_that) {
case _RawPhoto() when $default != null:
return $default(_that.filePath,_that.selected,_that.loaded,_that.info);case _:
  return null;

}
}

}

/// @nodoc


class _RawPhoto extends RawPhoto {
  const _RawPhoto({required this.filePath, this.selected = false, this.loaded = false, this.info = const RawPhotoInfo()}): super._();
  

@override final  String filePath;
@override@JsonKey() final  bool selected;
@override@JsonKey() final  bool loaded;
@override@JsonKey() final  RawPhotoInfo info;

/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPhotoCopyWith<_RawPhoto> get copyWith => __$RawPhotoCopyWithImpl<_RawPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPhoto&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,filePath,selected,loaded,info);

@override
String toString() {
  return 'RawPhoto(filePath: $filePath, selected: $selected, loaded: $loaded, info: $info)';
}


}

/// @nodoc
abstract mixin class _$RawPhotoCopyWith<$Res> implements $RawPhotoCopyWith<$Res> {
  factory _$RawPhotoCopyWith(_RawPhoto value, $Res Function(_RawPhoto) _then) = __$RawPhotoCopyWithImpl;
@override @useResult
$Res call({
 String filePath, bool selected, bool loaded, RawPhotoInfo info
});


@override $RawPhotoInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$RawPhotoCopyWithImpl<$Res>
    implements _$RawPhotoCopyWith<$Res> {
  __$RawPhotoCopyWithImpl(this._self, this._then);

  final _RawPhoto _self;
  final $Res Function(_RawPhoto) _then;

/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filePath = null,Object? selected = null,Object? loaded = null,Object? info = null,}) {
  return _then(_RawPhoto(
filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,loaded: null == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RawPhotoInfo,
  ));
}

/// Create a copy of RawPhoto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<$Res> get info {
  
  return $RawPhotoInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
