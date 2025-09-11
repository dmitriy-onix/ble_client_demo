// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactive_connected_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReactiveConnectedScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveConnectedScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent()';
}


}

/// @nodoc
class $ReactiveConnectedScreenEventCopyWith<$Res>  {
$ReactiveConnectedScreenEventCopyWith(ReactiveConnectedScreenEvent _, $Res Function(ReactiveConnectedScreenEvent) __);
}


/// Adds pattern-matching-related methods to [ReactiveConnectedScreenEvent].
extension ReactiveConnectedScreenEventPatterns on ReactiveConnectedScreenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitEvent value)?  init,TResult Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult Function( ToggleLedEvent value)?  toggleLed,TResult Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult Function( DisconnectEvent value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo(_that);case ToggleLedEvent() when toggleLed != null:
return toggleLed(_that);case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand(_that);case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus(_that);case DisconnectEvent() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitEvent value)  init,required TResult Function( UpdateDeviceDataEvent value)  updateDeviceData,required TResult Function( ReadDeviceInfoEvent value)  readDeviceInfo,required TResult Function( ToggleLedEvent value)  toggleLed,required TResult Function( SendRandomCommandEvent value)  sendRandomCommand,required TResult Function( UpdateRandomStatusEvent value)  updateRandomStatus,required TResult Function( DisconnectEvent value)  disconnect,}){
final _that = this;
switch (_that) {
case InitEvent():
return init(_that);case UpdateDeviceDataEvent():
return updateDeviceData(_that);case ReadDeviceInfoEvent():
return readDeviceInfo(_that);case ToggleLedEvent():
return toggleLed(_that);case SendRandomCommandEvent():
return sendRandomCommand(_that);case UpdateRandomStatusEvent():
return updateRandomStatus(_that);case DisconnectEvent():
return disconnect(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitEvent value)?  init,TResult? Function( UpdateDeviceDataEvent value)?  updateDeviceData,TResult? Function( ReadDeviceInfoEvent value)?  readDeviceInfo,TResult? Function( ToggleLedEvent value)?  toggleLed,TResult? Function( SendRandomCommandEvent value)?  sendRandomCommand,TResult? Function( UpdateRandomStatusEvent value)?  updateRandomStatus,TResult? Function( DisconnectEvent value)?  disconnect,}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo(_that);case ToggleLedEvent() when toggleLed != null:
return toggleLed(_that);case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand(_that);case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus(_that);case DisconnectEvent() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( BleDeviceData deviceData)?  updateDeviceData,TResult Function()?  readDeviceInfo,TResult Function()?  toggleLed,TResult Function()?  sendRandomCommand,TResult Function()?  updateRandomStatus,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo();case ToggleLedEvent() when toggleLed != null:
return toggleLed();case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand();case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus();case DisconnectEvent() when disconnect != null:
return disconnect();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( BleDeviceData deviceData)  updateDeviceData,required TResult Function()  readDeviceInfo,required TResult Function()  toggleLed,required TResult Function()  sendRandomCommand,required TResult Function()  updateRandomStatus,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case InitEvent():
return init();case UpdateDeviceDataEvent():
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent():
return readDeviceInfo();case ToggleLedEvent():
return toggleLed();case SendRandomCommandEvent():
return sendRandomCommand();case UpdateRandomStatusEvent():
return updateRandomStatus();case DisconnectEvent():
return disconnect();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( BleDeviceData deviceData)?  updateDeviceData,TResult? Function()?  readDeviceInfo,TResult? Function()?  toggleLed,TResult? Function()?  sendRandomCommand,TResult? Function()?  updateRandomStatus,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case UpdateDeviceDataEvent() when updateDeviceData != null:
return updateDeviceData(_that.deviceData);case ReadDeviceInfoEvent() when readDeviceInfo != null:
return readDeviceInfo();case ToggleLedEvent() when toggleLed != null:
return toggleLed();case SendRandomCommandEvent() when sendRandomCommand != null:
return sendRandomCommand();case UpdateRandomStatusEvent() when updateRandomStatus != null:
return updateRandomStatus();case DisconnectEvent() when disconnect != null:
return disconnect();case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements ReactiveConnectedScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.init()';
}


}




/// @nodoc


class UpdateDeviceDataEvent implements ReactiveConnectedScreenEvent {
  const UpdateDeviceDataEvent(this.deviceData);
  

 final  BleDeviceData deviceData;

/// Create a copy of ReactiveConnectedScreenEvent
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
  return 'ReactiveConnectedScreenEvent.updateDeviceData(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $UpdateDeviceDataEventCopyWith<$Res> implements $ReactiveConnectedScreenEventCopyWith<$Res> {
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

/// Create a copy of ReactiveConnectedScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(UpdateDeviceDataEvent(
null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of ReactiveConnectedScreenEvent
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


class ReadDeviceInfoEvent implements ReactiveConnectedScreenEvent {
  const ReadDeviceInfoEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadDeviceInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.readDeviceInfo()';
}


}




/// @nodoc


class ToggleLedEvent implements ReactiveConnectedScreenEvent {
  const ToggleLedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleLedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.toggleLed()';
}


}




/// @nodoc


class SendRandomCommandEvent implements ReactiveConnectedScreenEvent {
  const SendRandomCommandEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendRandomCommandEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.sendRandomCommand()';
}


}




/// @nodoc


class UpdateRandomStatusEvent implements ReactiveConnectedScreenEvent {
  const UpdateRandomStatusEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRandomStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.updateRandomStatus()';
}


}




/// @nodoc


class DisconnectEvent implements ReactiveConnectedScreenEvent {
  const DisconnectEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenEvent.disconnect()';
}


}




/// @nodoc
mixin _$ReactiveConnectedScreenState {

 BleDeviceData get deviceData;
/// Create a copy of ReactiveConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactiveConnectedScreenStateCopyWith<ReactiveConnectedScreenState> get copyWith => _$ReactiveConnectedScreenStateCopyWithImpl<ReactiveConnectedScreenState>(this as ReactiveConnectedScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'ReactiveConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class $ReactiveConnectedScreenStateCopyWith<$Res>  {
  factory $ReactiveConnectedScreenStateCopyWith(ReactiveConnectedScreenState value, $Res Function(ReactiveConnectedScreenState) _then) = _$ReactiveConnectedScreenStateCopyWithImpl;
@useResult
$Res call({
 BleDeviceData deviceData
});


$BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class _$ReactiveConnectedScreenStateCopyWithImpl<$Res>
    implements $ReactiveConnectedScreenStateCopyWith<$Res> {
  _$ReactiveConnectedScreenStateCopyWithImpl(this._self, this._then);

  final ReactiveConnectedScreenState _self;
  final $Res Function(ReactiveConnectedScreenState) _then;

/// Create a copy of ReactiveConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceData = null,}) {
  return _then(_self.copyWith(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}
/// Create a copy of ReactiveConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleDeviceDataCopyWith<$Res> get deviceData {
  
  return $BleDeviceDataCopyWith<$Res>(_self.deviceData, (value) {
    return _then(_self.copyWith(deviceData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReactiveConnectedScreenState].
extension ReactiveConnectedScreenStatePatterns on ReactiveConnectedScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactiveConnectedScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactiveConnectedScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactiveConnectedScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ReactiveConnectedScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactiveConnectedScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ReactiveConnectedScreenState() when $default != null:
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
case _ReactiveConnectedScreenState() when $default != null:
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
case _ReactiveConnectedScreenState():
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
case _ReactiveConnectedScreenState() when $default != null:
return $default(_that.deviceData);case _:
  return null;

}
}

}

/// @nodoc


class _ReactiveConnectedScreenState implements ReactiveConnectedScreenState {
  const _ReactiveConnectedScreenState({required this.deviceData});
  

@override final  BleDeviceData deviceData;

/// Create a copy of ReactiveConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactiveConnectedScreenStateCopyWith<_ReactiveConnectedScreenState> get copyWith => __$ReactiveConnectedScreenStateCopyWithImpl<_ReactiveConnectedScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactiveConnectedScreenState&&(identical(other.deviceData, deviceData) || other.deviceData == deviceData));
}


@override
int get hashCode => Object.hash(runtimeType,deviceData);

@override
String toString() {
  return 'ReactiveConnectedScreenState(deviceData: $deviceData)';
}


}

/// @nodoc
abstract mixin class _$ReactiveConnectedScreenStateCopyWith<$Res> implements $ReactiveConnectedScreenStateCopyWith<$Res> {
  factory _$ReactiveConnectedScreenStateCopyWith(_ReactiveConnectedScreenState value, $Res Function(_ReactiveConnectedScreenState) _then) = __$ReactiveConnectedScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleDeviceData deviceData
});


@override $BleDeviceDataCopyWith<$Res> get deviceData;

}
/// @nodoc
class __$ReactiveConnectedScreenStateCopyWithImpl<$Res>
    implements _$ReactiveConnectedScreenStateCopyWith<$Res> {
  __$ReactiveConnectedScreenStateCopyWithImpl(this._self, this._then);

  final _ReactiveConnectedScreenState _self;
  final $Res Function(_ReactiveConnectedScreenState) _then;

/// Create a copy of ReactiveConnectedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceData = null,}) {
  return _then(_ReactiveConnectedScreenState(
deviceData: null == deviceData ? _self.deviceData : deviceData // ignore: cast_nullable_to_non_nullable
as BleDeviceData,
  ));
}

/// Create a copy of ReactiveConnectedScreenState
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
mixin _$ReactiveConnectedScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveConnectedScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenSR()';
}


}

/// @nodoc
class $ReactiveConnectedScreenSRCopyWith<$Res>  {
$ReactiveConnectedScreenSRCopyWith(ReactiveConnectedScreenSR _, $Res Function(ReactiveConnectedScreenSR) __);
}


/// Adds pattern-matching-related methods to [ReactiveConnectedScreenSR].
extension ReactiveConnectedScreenSRPatterns on ReactiveConnectedScreenSR {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Disconnected value)?  disconnected,TResult Function( _CommandSent value)?  commandSent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Disconnected value)  disconnected,required TResult Function( _CommandSent value)  commandSent,}){
final _that = this;
switch (_that) {
case _Disconnected():
return disconnected(_that);case _CommandSent():
return commandSent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Disconnected value)?  disconnected,TResult? Function( _CommandSent value)?  commandSent,}){
final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected(_that);case _CommandSent() when commandSent != null:
return commandSent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  disconnected,TResult Function( String command)?  commandSent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  disconnected,required TResult Function( String command)  commandSent,}) {final _that = this;
switch (_that) {
case _Disconnected():
return disconnected();case _CommandSent():
return commandSent(_that.command);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  disconnected,TResult? Function( String command)?  commandSent,}) {final _that = this;
switch (_that) {
case _Disconnected() when disconnected != null:
return disconnected();case _CommandSent() when commandSent != null:
return commandSent(_that.command);case _:
  return null;

}
}

}

/// @nodoc


class _Disconnected implements ReactiveConnectedScreenSR {
  const _Disconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveConnectedScreenSR.disconnected()';
}


}




/// @nodoc


class _CommandSent implements ReactiveConnectedScreenSR {
  const _CommandSent(this.command);
  

 final  String command;

/// Create a copy of ReactiveConnectedScreenSR
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
  return 'ReactiveConnectedScreenSR.commandSent(command: $command)';
}


}

/// @nodoc
abstract mixin class _$CommandSentCopyWith<$Res> implements $ReactiveConnectedScreenSRCopyWith<$Res> {
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

/// Create a copy of ReactiveConnectedScreenSR
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? command = null,}) {
  return _then(_CommandSent(
null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
