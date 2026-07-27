// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppConfig {

 ThemeMode get themeMode; bool get isFullScreen; bool get isPanelOpen; bool get isGridView; String? get sourceDirectory; String? get targetDirectory; bool get isFirstRun;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isFullScreen, isFullScreen) || other.isFullScreen == isFullScreen)&&(identical(other.isPanelOpen, isPanelOpen) || other.isPanelOpen == isPanelOpen)&&(identical(other.isGridView, isGridView) || other.isGridView == isGridView)&&(identical(other.sourceDirectory, sourceDirectory) || other.sourceDirectory == sourceDirectory)&&(identical(other.targetDirectory, targetDirectory) || other.targetDirectory == targetDirectory)&&(identical(other.isFirstRun, isFirstRun) || other.isFirstRun == isFirstRun));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,isFullScreen,isPanelOpen,isGridView,sourceDirectory,targetDirectory,isFirstRun);

@override
String toString() {
  return 'AppConfig(themeMode: $themeMode, isFullScreen: $isFullScreen, isPanelOpen: $isPanelOpen, isGridView: $isGridView, sourceDirectory: $sourceDirectory, targetDirectory: $targetDirectory, isFirstRun: $isFirstRun)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool isFullScreen, bool isPanelOpen, bool isGridView, String? sourceDirectory, String? targetDirectory, bool isFirstRun
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? isFullScreen = null,Object? isPanelOpen = null,Object? isGridView = null,Object? sourceDirectory = freezed,Object? targetDirectory = freezed,Object? isFirstRun = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,isFullScreen: null == isFullScreen ? _self.isFullScreen : isFullScreen // ignore: cast_nullable_to_non_nullable
as bool,isPanelOpen: null == isPanelOpen ? _self.isPanelOpen : isPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,isGridView: null == isGridView ? _self.isGridView : isGridView // ignore: cast_nullable_to_non_nullable
as bool,sourceDirectory: freezed == sourceDirectory ? _self.sourceDirectory : sourceDirectory // ignore: cast_nullable_to_non_nullable
as String?,targetDirectory: freezed == targetDirectory ? _self.targetDirectory : targetDirectory // ignore: cast_nullable_to_non_nullable
as String?,isFirstRun: null == isFirstRun ? _self.isFirstRun : isFirstRun // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool isFullScreen,  bool isPanelOpen,  bool isGridView,  String? sourceDirectory,  String? targetDirectory,  bool isFirstRun)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.themeMode,_that.isFullScreen,_that.isPanelOpen,_that.isGridView,_that.sourceDirectory,_that.targetDirectory,_that.isFirstRun);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool isFullScreen,  bool isPanelOpen,  bool isGridView,  String? sourceDirectory,  String? targetDirectory,  bool isFirstRun)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.themeMode,_that.isFullScreen,_that.isPanelOpen,_that.isGridView,_that.sourceDirectory,_that.targetDirectory,_that.isFirstRun);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool isFullScreen,  bool isPanelOpen,  bool isGridView,  String? sourceDirectory,  String? targetDirectory,  bool isFirstRun)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.themeMode,_that.isFullScreen,_that.isPanelOpen,_that.isGridView,_that.sourceDirectory,_that.targetDirectory,_that.isFirstRun);case _:
  return null;

}
}

}

/// @nodoc


class _AppConfig implements AppConfig {
  const _AppConfig({this.themeMode = ThemeMode.system, this.isFullScreen = false, this.isPanelOpen = false, this.isGridView = true, this.sourceDirectory = null, this.targetDirectory = null, this.isFirstRun = true});
  

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool isFullScreen;
@override@JsonKey() final  bool isPanelOpen;
@override@JsonKey() final  bool isGridView;
@override@JsonKey() final  String? sourceDirectory;
@override@JsonKey() final  String? targetDirectory;
@override@JsonKey() final  bool isFirstRun;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isFullScreen, isFullScreen) || other.isFullScreen == isFullScreen)&&(identical(other.isPanelOpen, isPanelOpen) || other.isPanelOpen == isPanelOpen)&&(identical(other.isGridView, isGridView) || other.isGridView == isGridView)&&(identical(other.sourceDirectory, sourceDirectory) || other.sourceDirectory == sourceDirectory)&&(identical(other.targetDirectory, targetDirectory) || other.targetDirectory == targetDirectory)&&(identical(other.isFirstRun, isFirstRun) || other.isFirstRun == isFirstRun));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,isFullScreen,isPanelOpen,isGridView,sourceDirectory,targetDirectory,isFirstRun);

@override
String toString() {
  return 'AppConfig(themeMode: $themeMode, isFullScreen: $isFullScreen, isPanelOpen: $isPanelOpen, isGridView: $isGridView, sourceDirectory: $sourceDirectory, targetDirectory: $targetDirectory, isFirstRun: $isFirstRun)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool isFullScreen, bool isPanelOpen, bool isGridView, String? sourceDirectory, String? targetDirectory, bool isFirstRun
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? isFullScreen = null,Object? isPanelOpen = null,Object? isGridView = null,Object? sourceDirectory = freezed,Object? targetDirectory = freezed,Object? isFirstRun = null,}) {
  return _then(_AppConfig(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,isFullScreen: null == isFullScreen ? _self.isFullScreen : isFullScreen // ignore: cast_nullable_to_non_nullable
as bool,isPanelOpen: null == isPanelOpen ? _self.isPanelOpen : isPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,isGridView: null == isGridView ? _self.isGridView : isGridView // ignore: cast_nullable_to_non_nullable
as bool,sourceDirectory: freezed == sourceDirectory ? _self.sourceDirectory : sourceDirectory // ignore: cast_nullable_to_non_nullable
as String?,targetDirectory: freezed == targetDirectory ? _self.targetDirectory : targetDirectory // ignore: cast_nullable_to_non_nullable
as String?,isFirstRun: null == isFirstRun ? _self.isFirstRun : isFirstRun // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
