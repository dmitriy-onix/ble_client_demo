// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectedScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent()';
}


}

/// @nodoc
class $ConnectedScreenEventCopyWith<$Res>  {
$ConnectedScreenEventCopyWith(ConnectedScreenEvent _, $Res Function(ConnectedScreenEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectedScreenEvent].
extension ConnectedScreenEventPatterns on ConnectedScreenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitEvent value)?  init,TResult Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult Function( ToggleLedEvent value)?  toggleLed,TResult Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult Function( DisconnectEvent value)?  disconnect,TResult Function( CreateBondEvent value)?  createBond,TResult Function( RemoveBondEvent value)?  removeBond,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo(_that);case ToggleLedEvent() when toggleLed != null:
return toggleLed(_that);case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand(_that);case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus(_that);case DisconnectEvent() when disconnect != null:
return disconnect(_that);case CreateBondEvent() when createBond != null:
return createBond(_that);case RemoveBondEvent() when removeBond != null:
return removeBond(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitEvent value)  init,required TResult Function( UpdateDeviceDataEvent value)  updateDeviceData,required TResult Function( ReadDeviceInfoEvent value)  readDeviceInfo,required TResult Function( ToggleLedEvent value)  toggleLed,required TResult Function( SendRandomCommandEvent value)  sendRandomCommand,required TResult Function( UpdateRandomStatusEvent value)  updateRandomStatus,required TResult Function( DisconnectEvent value)  disconnect,required TResult Function( CreateBondEvent value)  createBond,required TResult Function( RemoveBondEvent value)  removeBond,}){
final _that = this;
switch (_that) {
case InitEvent():
return init(_that);case UpdateDeviceDataEvent():
return updateDeviceData(_that);case ReadDeviceInfoEvent():
return readDeviceInfo(_that);case ToggleLedEvent():
return toggleLed(_that);case SendRandomCommandEvent():
return sendRandomCommand(_that);case UpdateRandomStatusEvent():
return updateRandomStatus(_that);case DisconnectEvent():
return disconnect(_that);case CreateBondEvent():
return createBond(_that);case RemoveBondEvent():
return removeBond(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitEvent value)?  init,TResult? Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult? Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult? Function( ToggleLedEvent value)?  toggleLed,TResult? Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult? Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult? Function( DisconnectEvent value)?  disconnect,TResult? Function( CreateBondEvent value)?  createBond,TResult? Function( RemoveBondEvent value)?  removeBond,}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo(_that);case ToggleLedEvent() when toggleLed != null:
return toggleLed(_that);case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand(_that);case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus(_that);case DisconnectEvent() when disconnect != null:
return disconnect(_that);case CreateBondEvent() when createBond != null:
return createBond(_that);case RemoveBondEvent() when removeBond != null:
return removeBond(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( BleDeviceData deviceData)?  updateDeviceData,TResult Function()?  readDeviceInfo,TResult Function()?  toggleLed,TResult Function()?  sendRandomCommand,TResult Function()?  updateRandomStatus,TResult Function()?  disconnect,TResult Function()?  createBond,TResult Function()?  removeBond,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo();case ToggleLedEvent() when toggleLed != null:
return toggleLed();case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand();case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus();case DisconnectEvent() when disconnect != null:
return disconnect();case CreateBondEvent() when createBond != null:
return createBond();case RemoveBondEvent() when removeBond != null:
return removeBond();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( BleDeviceData deviceData)  updateDeviceData,required TResult Function()  readDeviceInfo,required TResult Function()  toggleLed,required TResult Function()  sendRandomCommand,required TResult Function()  updateRandomStatus,required TResult Function()  disconnect,required TResult Function()  createBond,required TResult Function()  removeBond,}) {final _that = this;
switch (_that) {
case InitEvent():
return init();case UpdateDeviceDataEvent():
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent():
return readDeviceInfo();case ToggleLedEvent():
return toggleLed();case SendRandomCommandEvent():
return sendRandomCommand();case UpdateRandomStatusEvent():
return updateRandomStatus();case DisconnectEvent():
return disconnect();case CreateBondEvent():
return createBond();case RemoveBondEvent():
return removeBond();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( BleDeviceData deviceData)?  updateDeviceData,TResult? Function()?  readDeviceInfo,TResult? Function()?  toggleLed,TResult? Function()?  sendRandomCommand,TResult? Function()?  updateRandomStatus,TResult? Function()?  disconnect,TResult? Function()?  createBond,TResult? Function()?  removeBond,}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo();case ToggleLedEvent() when toggleLed != null:
return toggleLed();case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand();case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus();case DisconnectEvent() when disconnect != null:
return disconnect();case CreateBondEvent() when createBond != null:
return createBond();case RemoveBondEvent() when removeBond != null:
return removeBond();case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements ConnectedScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.init()';
}


}




/// @nodoc


class UpdateDeviceDataEvent implements ConnectedScreenEvent {
  const UpdateDeviceDataEvent(this.deviceData);
  

 final  BleDeviceData deviceData;

/// Create a copy of ConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDeviceDataEventCopyWith<UpdateDeviceDataEvent> get copyWith => _$UpdateDeviceDataEventCopyWithImpl<UpdateDeviceDataEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDeviceDataEvent&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'ConnectedScreenEvent.updateDeviceData(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $UpdateDeviceDataEventCopyWith<$Res> implements $ConnectedScreenEventCopyWith<$Res> {
  factory $UpdateDeviceDataEventCopyWith(UpdateDeviceDataEvent value, $Res Function(UpdateDeviceDataEvent) _then) = _$UpdateDeviceDataEventCopyWithImpl;
@useResult
$Res call({
 BleDeviceData deviceData
});


$BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class _$UpdateDeviceDataEventCopyWithImpl<$Res>
    implements $UpdateDeviceDataEventCopyWith<$Res> {
  _$UpdateDeviceDataEventCopyWithImpl(this._self, this._then);

  final UpdateDeviceDataEvent _self;
  final $Res Function(UpdateDeviceDataEvent) _then;

/// Create a copy of ConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(UpdateDeviceDataEvent(
null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of ConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<$Res> get deviceData {
  
  return $BleDeviceDataCopyWith<$Res>(_self.deviceData, (value) {
    return _then(_self.copyWith(deviceData: value));
  });
}
}

/// @nodoc


class ReadDeviceInfoEvent implements ConnectedScreenEvent {
  const ReadDeviceInfoEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadDeviceInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.readDeviceInfo()';
}


}




/// @nodoc


class ToggleLedEvent implements ConnectedScreenEvent {
  const ToggleLedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleLedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.toggleLed()';
}


}




/// @nodoc


class SendRandomCommandEvent implements ConnectedScreenEvent {
  const SendRandomCommandEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendRandomCommandEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.sendRandomCommand()';
}


}




/// @nodoc


class UpdateRandomStatusEvent implements ConnectedScreenEvent {
  const UpdateRandomStatusEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRandomStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.updateRandomStatus()';
}


}




/// @nodoc


class DisconnectEvent implements ConnectedScreenEvent {
  const DisconnectEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.disconnect()';
}


}




/// @nodoc


class CreateBondEvent implements ConnectedScreenEvent {
  const CreateBondEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBondEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.createBond()';
}


}




/// @nodoc


class RemoveBondEvent implements ConnectedScreenEvent {
  const RemoveBondEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveBondEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenEvent.removeBond()';
}


}




/// @nodoc
mixin _$ConnectedScreenState {

 BleDeviceData get deviceData;
/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedScreenStateCopyWith<ConnectedScreenState> get copyWith => _$ConnectedScreenStateCopyWithImpl<ConnectedScreenState>(this as ConnectedScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'ConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $ConnectedScreenStateCopyWith<$Res>  {
  factory $ConnectedScreenStateCopyWith(ConnectedScreenState value, $Res Function(ConnectedScreenState) _then) = _$ConnectedScreenStateCopyWithImpl;
@useResult
$Res call({
 BleDeviceData deviceData
});


$BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class _$ConnectedScreenStateCopyWithImpl<$Res>
    implements $ConnectedScreenStateCopyWith<$Res> {
  _$ConnectedScreenStateCopyWithImpl(this._self, this._then);

  final ConnectedScreenState _self;
  final $Res Function(ConnectedScreenState) _then;

/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceData = null,}) {
  return _then(_self.copyWith(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}
/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<$Res> get deviceData {
  
  return $BleDeviceDataCopyWith<$Res>(_self.deviceData, (value) {
    return _then(_self.copyWith(deviceData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectedScreenState].
extension ConnectedScreenStatePatterns on ConnectedScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectedScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectedScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectedScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ConnectedScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectedScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectedScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleDeviceData deviceData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectedScreenState() when $default != null:
return $default(_that.deviceData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleDeviceData deviceData)  $default,) {final _that = this;
switch (_that) {
case _ConnectedScreenState():
return $default(_that.deviceData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleDeviceData deviceData)?  $default,) {final _that = this;
switch (_that) {
case _ConnectedScreenState() when $default != null:
return $default(_that.deviceData);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectedScreenState implements ConnectedScreenState {
  const _ConnectedScreenState({required this.deviceData});
  

@override final  BleDeviceData deviceData;

/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedScreenStateCopyWith<_ConnectedScreenState> get copyWith => __$ConnectedScreenStateCopyWithImpl<_ConnectedScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'ConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class _$ConnectedScreenStateCopyWith<$Res> implements $ConnectedScreenStateCopyWith<$Res> {
  factory _$ConnectedScreenStateCopyWith(_ConnectedScreenState value, $Res Function(_ConnectedScreenState) _then) = __$ConnectedScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleDeviceData deviceData
});


@override $BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class __$ConnectedScreenStateCopyWithImpl<$Res>
    implements _$ConnectedScreenStateCopyWith<$Res> {
  __$ConnectedScreenStateCopyWithImpl(this._self, this._then);

  final _ConnectedScreenState _self;
  final $Res Function(_ConnectedScreenState) _then;

/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(_ConnectedScreenState(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of ConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<$Res> get deviceData {
  
  return $BleDeviceDataCopyWith<$Res>(_self.deviceData, (value) {
    return _then(_self.copyWith(deviceData: value));
  });
}
}

/// @nodoc
mixin _$ConnectedScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenSR()';
}


}

/// @nodoc
class $ConnectedScreenSRCopyWith<$Res>  {
$ConnectedScreenSRCopyWith(ConnectedScreenSR _, $Res Function(ConnectedScreenSR) __);
}


/// Adds pattern-matching-related methods to [ConnectedScreenSR].
extension ConnectedScreenSRPatterns on ConnectedScreenSR {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Disconnected value)?  disconnected,TResult Function( _CommandSent value)?  commandSent,TResult Function( _BondingSuccess value)?  bondingSuccess,TResult Function( _RemoveBondSuccess value)?  removeBond,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _BondingSuccess() when bondingSuccess != null:
return bondingSuccess(_that);case _RemoveBondSuccess() when removeBond != null:
return removeBond(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Disconnected value)  disconnected,required TResult Function( _CommandSent value)  commandSent,required TResult Function( _BondingSuccess value)  bondingSuccess,required TResult Function( _RemoveBondSuccess value)  removeBond,}){
final _that = this;
switch (_that) {
case _Disconnected():
return disconnected(_that);case _CommandSent():
return commandSent(_that);case _BondingSuccess():
return bondingSuccess(_that);case _RemoveBondSuccess():
return removeBond(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Disconnected value)?  disconnected,TResult? Function( _CommandSent value)?  commandSent,TResult? Function( _BondingSuccess value)?  bondingSuccess,TResult? Function( _RemoveBondSuccess value)?  removeBond,}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _BondingSuccess() when bondingSuccess != null:
return bondingSuccess(_that);case _RemoveBondSuccess() when removeBond != null:
return removeBond(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  disconnected,TResult Function( String command)?  commandSent,TResult Function()?  bondingSuccess,TResult Function()?  removeBond,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _BondingSuccess() when bondingSuccess != null:
return bondingSuccess();case _RemoveBondSuccess() when removeBond != null:
return removeBond();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  disconnected,required TResult Function( String command)  commandSent,required TResult Function()  bondingSuccess,required TResult Function()  removeBond,}) {final _that = this;
switch (_that) {
case _Disconnected():
return disconnected();case _CommandSent():
return commandSent(_that.command);case _BondingSuccess():
return bondingSuccess();case _RemoveBondSuccess():
return removeBond();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  disconnected,TResult? Function( String command)?  commandSent,TResult? Function()?  bondingSuccess,TResult? Function()?  removeBond,}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _BondingSuccess() when bondingSuccess != null:
return bondingSuccess();case _RemoveBondSuccess() when removeBond != null:
return removeBond();case _:
  return null;

}
}

}

/// @nodoc


class _Disconnected implements ConnectedScreenSR {
  const _Disconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenSR.disconnected()';
}


}




/// @nodoc


class _CommandSent implements ConnectedScreenSR {
  const _CommandSent(this.command);
  

 final  String command;

/// Create a copy of ConnectedScreenSR
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandSentCopyWith<_CommandSent> get copyWith => __$CommandSentCopyWithImpl<_CommandSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandSent&&(identical(other.command, command) || other.command == command));
}


@override
int get hashCode => Object.hash(runtimeType,command);

@override
String toString() {
  return 'ConnectedScreenSR.commandSent(command: $command)';
}


}

/// @nodoc
abstract mixin class _$CommandSentCopyWith<$Res> implements $ConnectedScreenSRCopyWith<$Res> {
  factory _$CommandSentCopyWith(_CommandSent value, $Res Function(_CommandSent) _then) = __$CommandSentCopyWithImpl;
@useResult
$Res call({
 String command
});




}
/// @nodoc
class __$CommandSentCopyWithImpl<$Res>
    implements _$CommandSentCopyWith<$Res> {
  __$CommandSentCopyWithImpl(this._self, this._then);

  final _CommandSent _self;
  final $Res Function(_CommandSent) _then;

/// Create a copy of ConnectedScreenSR
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? command = null,}) {
  return _then(_CommandSent(
null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BondingSuccess implements ConnectedScreenSR {
  const _BondingSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BondingSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenSR.bondingSuccess()';
}


}




/// @nodoc


class _RemoveBondSuccess implements ConnectedScreenSR {
  const _RemoveBondSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveBondSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectedScreenSR.removeBond()';
}


}




// dart format on
