// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_device_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleDeviceData {

 String? get deviceName; String? get firmwareVersion; double? get temperature; int? get humidity; int? get batteryLevel; String? get status; bool get ledState; bool get isBonded; String? get logData;
/// Create a copy of BleDeviceData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<BleDeviceData> get copyWith => _$BleDeviceDataCopyWithImpl<BleDeviceData>(this as BleDeviceData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleDeviceData&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.ledState, ledState) || other.ledState == ledState)&&(identical(other.isBonded, isBonded) || other.isBonded == isBonded)&&(identical(other.logData, logData) || other.logData == logData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceName,firmwareVersion,temperature,humidity,batteryLevel,status,ledState,isBonded,logData);

@override
String toString() {
  return 'BleDeviceData(deviceName: $deviceName, firmwareVersion: $firmwareVersion, temperature: $temperature, humidity: $humidity, batteryLevel: $batteryLevel, status: $status, ledState: $ledState, isBonded: $isBonded, logData: $logData)';
}


}

/// @nodoc
abstract mixin class $BleDeviceDataCopyWith<$Res>  {
  factory $BleDeviceDataCopyWith(BleDeviceData value, $Res Function(BleDeviceData) _then) = _$BleDeviceDataCopyWithImpl;
@useResult
$Res call({
 String? deviceName, String? firmwareVersion, double? temperature, int? humidity, int? batteryLevel, String? status, bool ledState, bool isBonded, String? logData
});




}
/// @nodoc
class _$BleDeviceDataCopyWithImpl<$Res>
    implements $BleDeviceDataCopyWith<$Res> {
  _$BleDeviceDataCopyWithImpl(this._self, this._then);

  final BleDeviceData _self;
  final $Res Function(BleDeviceData) _then;

/// Create a copy of BleDeviceData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceName = freezed,Object? firmwareVersion = freezed,Object? temperature = freezed,Object? humidity = freezed,Object? batteryLevel = freezed,Object? status = freezed,Object? ledState = null,Object? isBonded = null,Object? logData = freezed,}) {
  return _then(_self.copyWith(
deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,firmwareVersion: freezed == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ledState: null == ledState ? _self.ledState : ledState // ignore: cast_nullable_to_non_nullable
as bool,isBonded: null == isBonded ? _self.isBonded : isBonded // ignore: cast_nullable_to_non_nullable
as bool,logData: freezed == logData ? _self.logData : logData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BleDeviceData].
extension BleDeviceDataPatterns on BleDeviceData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleDeviceData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleDeviceData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleDeviceData value)  $default,){
final _that = this;
switch (_that) {
case _BleDeviceData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleDeviceData value)?  $default,){
final _that = this;
switch (_that) {
case _BleDeviceData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? deviceName,  String? firmwareVersion,  double? temperature,  int? humidity,  int? batteryLevel,  String? status,  bool ledState,  bool isBonded,  String? logData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleDeviceData() when $default != null:
return $default(_that.deviceName,_that.firmwareVersion,_that.temperature,_that.humidity,_that.batteryLevel,_that.status,_that.ledState,_that.isBonded,_that.logData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? deviceName,  String? firmwareVersion,  double? temperature,  int? humidity,  int? batteryLevel,  String? status,  bool ledState,  bool isBonded,  String? logData)  $default,) {final _that = this;
switch (_that) {
case _BleDeviceData():
return $default(_that.deviceName,_that.firmwareVersion,_that.temperature,_that.humidity,_that.batteryLevel,_that.status,_that.ledState,_that.isBonded,_that.logData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? deviceName,  String? firmwareVersion,  double? temperature,  int? humidity,  int? batteryLevel,  String? status,  bool ledState,  bool isBonded,  String? logData)?  $default,) {final _that = this;
switch (_that) {
case _BleDeviceData() when $default != null:
return $default(_that.deviceName,_that.firmwareVersion,_that.temperature,_that.humidity,_that.batteryLevel,_that.status,_that.ledState,_that.isBonded,_that.logData);case _:
  return null;

}
}

}

/// @nodoc


class _BleDeviceData extends BleDeviceData {
  const _BleDeviceData({this.deviceName, this.firmwareVersion, this.temperature, this.humidity, this.batteryLevel, this.status, this.ledState = false, this.isBonded = false, this.logData}): super._();
  

@override final  String? deviceName;
@override final  String? firmwareVersion;
@override final  double? temperature;
@override final  int? humidity;
@override final  int? batteryLevel;
@override final  String? status;
@override@JsonKey() final  bool ledState;
@override@JsonKey() final  bool isBonded;
@override final  String? logData;

/// Create a copy of BleDeviceData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleDeviceDataCopyWith<_BleDeviceData> get copyWith => __$BleDeviceDataCopyWithImpl<_BleDeviceData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleDeviceData&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.ledState, ledState) || other.ledState == ledState)&&(identical(other.isBonded, isBonded) || other.isBonded == isBonded)&&(identical(other.logData, logData) || other.logData == logData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceName,firmwareVersion,temperature,humidity,batteryLevel,status,ledState,isBonded,logData);

@override
String toString() {
  return 'BleDeviceData(deviceName: $deviceName, firmwareVersion: $firmwareVersion, temperature: $temperature, humidity: $humidity, batteryLevel: $batteryLevel, status: $status, ledState: $ledState, isBonded: $isBonded, logData: $logData)';
}


}

/// @nodoc
abstract mixin class _$BleDeviceDataCopyWith<$Res> implements $BleDeviceDataCopyWith<$Res> {
  factory _$BleDeviceDataCopyWith(_BleDeviceData value, $Res Function(_BleDeviceData) _then) = __$BleDeviceDataCopyWithImpl;
@override @useResult
$Res call({
 String? deviceName, String? firmwareVersion, double? temperature, int? humidity, int? batteryLevel, String? status, bool ledState, bool isBonded, String? logData
});




}
/// @nodoc
class __$BleDeviceDataCopyWithImpl<$Res>
    implements _$BleDeviceDataCopyWith<$Res> {
  __$BleDeviceDataCopyWithImpl(this._self, this._then);

  final _BleDeviceData _self;
  final $Res Function(_BleDeviceData) _then;

/// Create a copy of BleDeviceData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceName = freezed,Object? firmwareVersion = freezed,Object? temperature = freezed,Object? humidity = freezed,Object? batteryLevel = freezed,Object? status = freezed,Object? ledState = null,Object? isBonded = null,Object? logData = freezed,}) {
  return _then(_BleDeviceData(
deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,firmwareVersion: freezed == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ledState: null == ledState ? _self.ledState : ledState // ignore: cast_nullable_to_non_nullable
as bool,isBonded: null == isBonded ? _self.isBonded : isBonded // ignore: cast_nullable_to_non_nullable
as bool,logData: freezed == logData ? _self.logData : logData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
