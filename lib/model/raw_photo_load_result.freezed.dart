// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_photo_load_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RawPhotoResult {

 Uint8List? get bytes; bool get hasError; RawPhotoInfo? get info; int get quarterTurns;
/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPhotoResultCopyWith<RawPhotoResult> get copyWith => _$RawPhotoResultCopyWithImpl<RawPhotoResult>(this as RawPhotoResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPhotoResult&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.info, info) || other.info == info)&&(identical(other.quarterTurns, quarterTurns) || other.quarterTurns == quarterTurns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bytes),hasError,info,quarterTurns);

@override
String toString() {
  return 'RawPhotoResult(bytes: $bytes, hasError: $hasError, info: $info, quarterTurns: $quarterTurns)';
}


}

/// @nodoc
abstract mixin class $RawPhotoResultCopyWith<$Res>  {
  factory $RawPhotoResultCopyWith(RawPhotoResult value, $Res Function(RawPhotoResult) _then) = _$RawPhotoResultCopyWithImpl;
@useResult
$Res call({
 Uint8List? bytes, bool hasError, RawPhotoInfo? info, int quarterTurns
});


$RawPhotoInfoCopyWith<$Res>? get info;

}
/// @nodoc
class _$RawPhotoResultCopyWithImpl<$Res>
    implements $RawPhotoResultCopyWith<$Res> {
  _$RawPhotoResultCopyWithImpl(this._self, this._then);

  final RawPhotoResult _self;
  final $Res Function(RawPhotoResult) _then;

/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bytes = freezed,Object? hasError = null,Object? info = freezed,Object? quarterTurns = null,}) {
  return _then(_self.copyWith(
bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RawPhotoInfo?,quarterTurns: null == quarterTurns ? _self.quarterTurns : quarterTurns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $RawPhotoInfoCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [RawPhotoResult].
extension RawPhotoResultPatterns on RawPhotoResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawPhotoResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawPhotoResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawPhotoResult value)  $default,){
final _that = this;
switch (_that) {
case _RawPhotoResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawPhotoResult value)?  $default,){
final _that = this;
switch (_that) {
case _RawPhotoResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List? bytes,  bool hasError,  RawPhotoInfo? info,  int quarterTurns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPhotoResult() when $default != null:
return $default(_that.bytes,_that.hasError,_that.info,_that.quarterTurns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List? bytes,  bool hasError,  RawPhotoInfo? info,  int quarterTurns)  $default,) {final _that = this;
switch (_that) {
case _RawPhotoResult():
return $default(_that.bytes,_that.hasError,_that.info,_that.quarterTurns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List? bytes,  bool hasError,  RawPhotoInfo? info,  int quarterTurns)?  $default,) {final _that = this;
switch (_that) {
case _RawPhotoResult() when $default != null:
return $default(_that.bytes,_that.hasError,_that.info,_that.quarterTurns);case _:
  return null;

}
}

}

/// @nodoc


class _RawPhotoResult implements RawPhotoResult {
  const _RawPhotoResult({this.bytes = null, this.hasError = false, this.info = null, this.quarterTurns = 0});
  

@override@JsonKey() final  Uint8List? bytes;
@override@JsonKey() final  bool hasError;
@override@JsonKey() final  RawPhotoInfo? info;
@override@JsonKey() final  int quarterTurns;

/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPhotoResultCopyWith<_RawPhotoResult> get copyWith => __$RawPhotoResultCopyWithImpl<_RawPhotoResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPhotoResult&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.info, info) || other.info == info)&&(identical(other.quarterTurns, quarterTurns) || other.quarterTurns == quarterTurns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bytes),hasError,info,quarterTurns);

@override
String toString() {
  return 'RawPhotoResult(bytes: $bytes, hasError: $hasError, info: $info, quarterTurns: $quarterTurns)';
}


}

/// @nodoc
abstract mixin class _$RawPhotoResultCopyWith<$Res> implements $RawPhotoResultCopyWith<$Res> {
  factory _$RawPhotoResultCopyWith(_RawPhotoResult value, $Res Function(_RawPhotoResult) _then) = __$RawPhotoResultCopyWithImpl;
@override @useResult
$Res call({
 Uint8List? bytes, bool hasError, RawPhotoInfo? info, int quarterTurns
});


@override $RawPhotoInfoCopyWith<$Res>? get info;

}
/// @nodoc
class __$RawPhotoResultCopyWithImpl<$Res>
    implements _$RawPhotoResultCopyWith<$Res> {
  __$RawPhotoResultCopyWithImpl(this._self, this._then);

  final _RawPhotoResult _self;
  final $Res Function(_RawPhotoResult) _then;

/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bytes = freezed,Object? hasError = null,Object? info = freezed,Object? quarterTurns = null,}) {
  return _then(_RawPhotoResult(
bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RawPhotoInfo?,quarterTurns: null == quarterTurns ? _self.quarterTurns : quarterTurns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RawPhotoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawPhotoInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $RawPhotoInfoCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
