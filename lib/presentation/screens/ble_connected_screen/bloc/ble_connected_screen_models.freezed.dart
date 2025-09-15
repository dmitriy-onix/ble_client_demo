// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_connected_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleConnectedScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleConnectedScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent()';
}


}

/// @nodoc
class $BleConnectedScreenEventCopyWith<$Res>  {
$BleConnectedScreenEventCopyWith(BleConnectedScreenEvent _, $Res Function(BleConnectedScreenEvent) __);
}


/// Adds pattern-matching-related methods to [BleConnectedScreenEvent].
extension BleConnectedScreenEventPatterns on BleConnectedScreenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitEvent value)?  init,TResult Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult Function( ToggleLedEvent value)?  toggleLed,TResult Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult Function( DisconnectEvent value)?  disconnect,TResult Function( CreateBondEvent value)?  createBond,TResult Function( RemoveBondEvent value)?  removeBond,TResult Function( UpdateBondStateEvent value)?  updateBondState,required TResult orElse(),}){
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
return removeBond(_that);case UpdateBondStateEvent() when updateBondState != null:
return updateBondState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitEvent value)  init,required TResult Function( UpdateDeviceDataEvent value)  updateDeviceData,required TResult Function( ReadDeviceInfoEvent value)  readDeviceInfo,required TResult Function( ToggleLedEvent value)  toggleLed,required TResult Function( SendRandomCommandEvent value)  sendRandomCommand,required TResult Function( UpdateRandomStatusEvent value)  updateRandomStatus,required TResult Function( DisconnectEvent value)  disconnect,required TResult Function( CreateBondEvent value)  createBond,required TResult Function( RemoveBondEvent value)  removeBond,required TResult Function( UpdateBondStateEvent value)  updateBondState,}){
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
return removeBond(_that);case UpdateBondStateEvent():
return updateBondState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitEvent value)?  init,TResult? Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult? Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult? Function( ToggleLedEvent value)?  toggleLed,TResult? Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult? Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult? Function( DisconnectEvent value)?  disconnect,TResult? Function( CreateBondEvent value)?  createBond,TResult? Function( RemoveBondEvent value)?  removeBond,TResult? Function( UpdateBondStateEvent value)?  updateBondState,}){
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
return removeBond(_that);case UpdateBondStateEvent() when updateBondState != null:
return updateBondState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( BleDeviceData deviceData)?  updateDeviceData,TResult Function()?  readDeviceInfo,TResult Function()?  toggleLed,TResult Function()?  sendRandomCommand,TResult Function()?  updateRandomStatus,TResult Function()?  disconnect,TResult Function()?  createBond,TResult Function()?  removeBond,TResult Function( bool bonded)?  updateBondState,required TResult orElse(),}) {final _that = this;
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
return removeBond();case UpdateBondStateEvent() when updateBondState != null:
return updateBondState(_that.bonded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( BleDeviceData deviceData)  updateDeviceData,required TResult Function()  readDeviceInfo,required TResult Function()  toggleLed,required TResult Function()  sendRandomCommand,required TResult Function()  updateRandomStatus,required TResult Function()  disconnect,required TResult Function()  createBond,required TResult Function()  removeBond,required TResult Function( bool bonded)  updateBondState,}) {final _that = this;
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
return removeBond();case UpdateBondStateEvent():
return updateBondState(_that.bonded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( BleDeviceData deviceData)?  updateDeviceData,TResult? Function()?  readDeviceInfo,TResult? Function()?  toggleLed,TResult? Function()?  sendRandomCommand,TResult? Function()?  updateRandomStatus,TResult? Function()?  disconnect,TResult? Function()?  createBond,TResult? Function()?  removeBond,TResult? Function( bool bonded)?  updateBondState,}) {final _that = this;
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
return removeBond();case UpdateBondStateEvent() when updateBondState != null:
return updateBondState(_that.bonded);case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements BleConnectedScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.init()';
}


}




/// @nodoc


class UpdateDeviceDataEvent implements BleConnectedScreenEvent {
  const UpdateDeviceDataEvent(this.deviceData);
  

 final  BleDeviceData deviceData;

/// Create a copy of BleConnectedScreenEvent
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
  return 'BleConnectedScreenEvent.updateDeviceData(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $UpdateDeviceDataEventCopyWith<$Res> implements $BleConnectedScreenEventCopyWith<$Res> {
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

/// Create a copy of BleConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(UpdateDeviceDataEvent(
null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of BleConnectedScreenEvent
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


class ReadDeviceInfoEvent implements BleConnectedScreenEvent {
  const ReadDeviceInfoEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadDeviceInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.readDeviceInfo()';
}


}




/// @nodoc


class ToggleLedEvent implements BleConnectedScreenEvent {
  const ToggleLedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleLedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.toggleLed()';
}


}




/// @nodoc


class SendRandomCommandEvent implements BleConnectedScreenEvent {
  const SendRandomCommandEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendRandomCommandEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.sendRandomCommand()';
}


}




/// @nodoc


class UpdateRandomStatusEvent implements BleConnectedScreenEvent {
  const UpdateRandomStatusEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRandomStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.updateRandomStatus()';
}


}




/// @nodoc


class DisconnectEvent implements BleConnectedScreenEvent {
  const DisconnectEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.disconnect()';
}


}




/// @nodoc


class CreateBondEvent implements BleConnectedScreenEvent {
  const CreateBondEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBondEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.createBond()';
}


}




/// @nodoc


class RemoveBondEvent implements BleConnectedScreenEvent {
  const RemoveBondEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveBondEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenEvent.removeBond()';
}


}




/// @nodoc


class UpdateBondStateEvent implements BleConnectedScreenEvent {
  const UpdateBondStateEvent(this.bonded);
  

 final  bool bonded;

/// Create a copy of BleConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBondStateEventCopyWith<UpdateBondStateEvent> get copyWith => _$UpdateBondStateEventCopyWithImpl<UpdateBondStateEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBondStateEvent&&(identical(other.bonded, bonded) || other.bonded == bonded));
}


@override
int get hashCode => Object.hash(runtimeType,bonded);

@override
String toString() {
  return 'BleConnectedScreenEvent.updateBondState(bonded: $bonded)';
}


}

/// @nodoc
abstract mixin class $UpdateBondStateEventCopyWith<$Res> implements $BleConnectedScreenEventCopyWith<$Res> {
  factory $UpdateBondStateEventCopyWith(UpdateBondStateEvent value, $Res Function(UpdateBondStateEvent) _then) = _$UpdateBondStateEventCopyWithImpl;
@useResult
$Res call({
 bool bonded
});




}
/// @nodoc
class _$UpdateBondStateEventCopyWithImpl<$Res>
    implements $UpdateBondStateEventCopyWith<$Res> {
  _$UpdateBondStateEventCopyWithImpl(this._self, this._then);

  final UpdateBondStateEvent _self;
  final $Res Function(UpdateBondStateEvent) _then;

/// Create a copy of BleConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bonded = null,}) {
  return _then(UpdateBondStateEvent(
null == bonded ? _self.bonded : bonded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BleConnectedScreenState {

 BleDeviceData get deviceData;
/// Create a copy of BleConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleConnectedScreenStateCopyWith<BleConnectedScreenState> get copyWith => _$BleConnectedScreenStateCopyWithImpl<BleConnectedScreenState>(this as BleConnectedScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'BleConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $BleConnectedScreenStateCopyWith<$Res>  {
  factory $BleConnectedScreenStateCopyWith(BleConnectedScreenState value, $Res Function(BleConnectedScreenState) _then) = _$BleConnectedScreenStateCopyWithImpl;
@useResult
$Res call({
 BleDeviceData deviceData
});


$BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class _$BleConnectedScreenStateCopyWithImpl<$Res>
    implements $BleConnectedScreenStateCopyWith<$Res> {
  _$BleConnectedScreenStateCopyWithImpl(this._self, this._then);

  final BleConnectedScreenState _self;
  final $Res Function(BleConnectedScreenState) _then;

/// Create a copy of BleConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceData = null,}) {
  return _then(_self.copyWith(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}
/// Create a copy of BleConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<$Res> get deviceData {
  
  return $BleDeviceDataCopyWith<$Res>(_self.deviceData, (value) {
    return _then(_self.copyWith(deviceData: value));
  });
}
}


/// Adds pattern-matching-related methods to [BleConnectedScreenState].
extension BleConnectedScreenStatePatterns on BleConnectedScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleConnectedScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleConnectedScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleConnectedScreenState value)  $default,){
final _that = this;
switch (_that) {
case _BleConnectedScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleConnectedScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _BleConnectedScreenState() when $default != null:
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
case _BleConnectedScreenState() when $default != null:
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
case _BleConnectedScreenState():
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
case _BleConnectedScreenState() when $default != null:
return $default(_that.deviceData);case _:
  return null;

}
}

}

/// @nodoc


class _BleConnectedScreenState implements BleConnectedScreenState {
  const _BleConnectedScreenState({required this.deviceData});
  

@override final  BleDeviceData deviceData;

/// Create a copy of BleConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleConnectedScreenStateCopyWith<_BleConnectedScreenState> get copyWith => __$BleConnectedScreenStateCopyWithImpl<_BleConnectedScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'BleConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class _$BleConnectedScreenStateCopyWith<$Res> implements $BleConnectedScreenStateCopyWith<$Res> {
  factory _$BleConnectedScreenStateCopyWith(_BleConnectedScreenState value, $Res Function(_BleConnectedScreenState) _then) = __$BleConnectedScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleDeviceData deviceData
});


@override $BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class __$BleConnectedScreenStateCopyWithImpl<$Res>
    implements _$BleConnectedScreenStateCopyWith<$Res> {
  __$BleConnectedScreenStateCopyWithImpl(this._self, this._then);

  final _BleConnectedScreenState _self;
  final $Res Function(_BleConnectedScreenState) _then;

/// Create a copy of BleConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(_BleConnectedScreenState(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of BleConnectedScreenState
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
mixin _$BleConnectedScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleConnectedScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenSR()';
}


}

/// @nodoc
class $BleConnectedScreenSRCopyWith<$Res>  {
$BleConnectedScreenSRCopyWith(BleConnectedScreenSR _, $Res Function(BleConnectedScreenSR) __);
}


/// Adds pattern-matching-related methods to [BleConnectedScreenSR].
extension BleConnectedScreenSRPatterns on BleConnectedScreenSR {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Disconnected value)?  disconnected,TResult Function( _CommandSent value)?  commandSent,TResult Function( _BondCreated value)?  bondCreated,TResult Function( _BondRemoved value)?  bondRemoved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _BondCreated() when bondCreated != null:
return bondCreated(_that);case _BondRemoved() when bondRemoved != null:
return bondRemoved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Disconnected value)  disconnected,required TResult Function( _CommandSent value)  commandSent,required TResult Function( _BondCreated value)  bondCreated,required TResult Function( _BondRemoved value)  bondRemoved,}){
final _that = this;
switch (_that) {
case _Disconnected():
return disconnected(_that);case _CommandSent():
return commandSent(_that);case _BondCreated():
return bondCreated(_that);case _BondRemoved():
return bondRemoved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Disconnected value)?  disconnected,TResult? Function( _CommandSent value)?  commandSent,TResult? Function( _BondCreated value)?  bondCreated,TResult? Function( _BondRemoved value)?  bondRemoved,}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _BondCreated() when bondCreated != null:
return bondCreated(_that);case _BondRemoved() when bondRemoved != null:
return bondRemoved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  disconnected,TResult Function( String command)?  commandSent,TResult Function()?  bondCreated,TResult Function()?  bondRemoved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _BondCreated() when bondCreated != null:
return bondCreated();case _BondRemoved() when bondRemoved != null:
return bondRemoved();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  disconnected,required TResult Function( String command)  commandSent,required TResult Function()  bondCreated,required TResult Function()  bondRemoved,}) {final _that = this;
switch (_that) {
case _Disconnected():
return disconnected();case _CommandSent():
return commandSent(_that.command);case _BondCreated():
return bondCreated();case _BondRemoved():
return bondRemoved();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  disconnected,TResult? Function( String command)?  commandSent,TResult? Function()?  bondCreated,TResult? Function()?  bondRemoved,}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _BondCreated() when bondCreated != null:
return bondCreated();case _BondRemoved() when bondRemoved != null:
return bondRemoved();case _:
  return null;

}
}

}

/// @nodoc


class _Disconnected implements BleConnectedScreenSR {
  const _Disconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenSR.disconnected()';
}


}




/// @nodoc


class _CommandSent implements BleConnectedScreenSR {
  const _CommandSent(this.command);
  

 final  String command;

/// Create a copy of BleConnectedScreenSR
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
  return 'BleConnectedScreenSR.commandSent(command: $command)';
}


}

/// @nodoc
abstract mixin class _$CommandSentCopyWith<$Res> implements $BleConnectedScreenSRCopyWith<$Res> {
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

/// Create a copy of BleConnectedScreenSR
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? command = null,}) {
  return _then(_CommandSent(
null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BondCreated implements BleConnectedScreenSR {
  const _BondCreated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BondCreated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenSR.bondCreated()';
}


}




/// @nodoc


class _BondRemoved implements BleConnectedScreenSR {
  const _BondRemoved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BondRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleConnectedScreenSR.bondRemoved()';
}


}




// dart format on
