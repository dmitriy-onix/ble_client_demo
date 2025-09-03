// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleConnectionState {

 bool get isConnected; bool get isConnecting; bool get isScanning; String? get error;
/// Create a copy of BleConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleConnectionStateCopyWith<BleConnectionState> get copyWith => _$BleConnectionStateCopyWithImpl<BleConnectionState>(this as BleConnectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleConnectionState&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected,isConnecting,isScanning,error);

@override
String toString() {
  return 'BleConnectionState(isConnected: $isConnected, isConnecting: $isConnecting, isScanning: $isScanning, error: $error)';
}


}

/// @nodoc
abstract mixin class $BleConnectionStateCopyWith<$Res>  {
  factory $BleConnectionStateCopyWith(BleConnectionState value, $Res Function(BleConnectionState) _then) = _$BleConnectionStateCopyWithImpl;
@useResult
$Res call({
 bool isConnected, bool isConnecting, bool isScanning, String? error
});




}
/// @nodoc
class _$BleConnectionStateCopyWithImpl<$Res>
    implements $BleConnectionStateCopyWith<$Res> {
  _$BleConnectionStateCopyWithImpl(this._self, this._then);

  final BleConnectionState _self;
  final $Res Function(BleConnectionState) _then;

/// Create a copy of BleConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isConnected = null,Object? isConnecting = null,Object? isScanning = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BleConnectionState].
extension BleConnectionStatePatterns on BleConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleConnectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleConnectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleConnectionState value)  $default,){
final _that = this;
switch (_that) {
case _BleConnectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleConnectionState value)?  $default,){
final _that = this;
switch (_that) {
case _BleConnectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isConnected,  bool isConnecting,  bool isScanning,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleConnectionState() when $default != null:
return $default(_that.isConnected,_that.isConnecting,_that.isScanning,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isConnected,  bool isConnecting,  bool isScanning,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BleConnectionState():
return $default(_that.isConnected,_that.isConnecting,_that.isScanning,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isConnected,  bool isConnecting,  bool isScanning,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BleConnectionState() when $default != null:
return $default(_that.isConnected,_that.isConnecting,_that.isScanning,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BleConnectionState extends BleConnectionState {
  const _BleConnectionState({this.isConnected = false, this.isConnecting = false, this.isScanning = false, this.error}): super._();
  

@override@JsonKey() final  bool isConnected;
@override@JsonKey() final  bool isConnecting;
@override@JsonKey() final  bool isScanning;
@override final  String? error;

/// Create a copy of BleConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleConnectionStateCopyWith<_BleConnectionState> get copyWith => __$BleConnectionStateCopyWithImpl<_BleConnectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleConnectionState&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected,isConnecting,isScanning,error);

@override
String toString() {
  return 'BleConnectionState(isConnected: $isConnected, isConnecting: $isConnecting, isScanning: $isScanning, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BleConnectionStateCopyWith<$Res> implements $BleConnectionStateCopyWith<$Res> {
  factory _$BleConnectionStateCopyWith(_BleConnectionState value, $Res Function(_BleConnectionState) _then) = __$BleConnectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isConnected, bool isConnecting, bool isScanning, String? error
});




}
/// @nodoc
class __$BleConnectionStateCopyWithImpl<$Res>
    implements _$BleConnectionStateCopyWith<$Res> {
  __$BleConnectionStateCopyWithImpl(this._self, this._then);

  final _BleConnectionState _self;
  final $Res Function(_BleConnectionState) _then;

/// Create a copy of BleConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isConnected = null,Object? isConnecting = null,Object? isScanning = null,Object? error = freezed,}) {
  return _then(_BleConnectionState(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
