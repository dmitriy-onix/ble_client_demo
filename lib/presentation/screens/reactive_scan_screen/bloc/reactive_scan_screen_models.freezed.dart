// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactive_scan_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReactiveScanScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveScanScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenEvent()';
}


}

/// @nodoc
class $ReactiveScanScreenEventCopyWith<$Res>  {
$ReactiveScanScreenEventCopyWith(ReactiveScanScreenEvent _, $Res Function(ReactiveScanScreenEvent) __);
}


/// Adds pattern-matching-related methods to [ReactiveScanScreenEvent].
extension ReactiveScanScreenEventPatterns on ReactiveScanScreenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitEvent value)?  init,TResult Function( StartScanEvent value)?  startScan,TResult Function( StopScanEvent value)?  stopScan,TResult Function( ConnectDeviceEvent value)?  connectDevice,TResult Function( UpdateScanResultsEvent value)?  updateScanResults,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case StartScanEvent() when startScan != null:
return startScan(_that);case StopScanEvent() when stopScan != null:
return stopScan(_that);case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitEvent value)  init,required TResult Function( StartScanEvent value)  startScan,required TResult Function( StopScanEvent value)  stopScan,required TResult Function( ConnectDeviceEvent value)  connectDevice,required TResult Function( UpdateScanResultsEvent value)  updateScanResults,}){
final _that = this;
switch (_that) {
case InitEvent():
return init(_that);case StartScanEvent():
return startScan(_that);case StopScanEvent():
return stopScan(_that);case ConnectDeviceEvent():
return connectDevice(_that);case UpdateScanResultsEvent():
return updateScanResults(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitEvent value)?  init,TResult? Function( StartScanEvent value)?  startScan,TResult? Function( StopScanEvent value)?  stopScan,TResult? Function( ConnectDeviceEvent value)?  connectDevice,TResult? Function( UpdateScanResultsEvent value)?  updateScanResults,}){
final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init(_that);case StartScanEvent() when startScan != null:
return startScan(_that);case StopScanEvent() when stopScan != null:
return stopScan(_that);case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  startScan,TResult Function()?  stopScan,TResult Function( String deviceId)?  connectDevice,TResult Function( List<DiscoveredDevice> results)?  updateScanResults,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.deviceId);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  startScan,required TResult Function()  stopScan,required TResult Function( String deviceId)  connectDevice,required TResult Function( List<DiscoveredDevice> results)  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent():
return init();case StartScanEvent():
return startScan();case StopScanEvent():
return stopScan();case ConnectDeviceEvent():
return connectDevice(_that.deviceId);case UpdateScanResultsEvent():
return updateScanResults(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  startScan,TResult? Function()?  stopScan,TResult? Function( String deviceId)?  connectDevice,TResult? Function( List<DiscoveredDevice> results)?  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.deviceId);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements ReactiveScanScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenEvent.init()';
}


}




/// @nodoc


class StartScanEvent implements ReactiveScanScreenEvent {
  const StartScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenEvent.startScan()';
}


}




/// @nodoc


class StopScanEvent implements ReactiveScanScreenEvent {
  const StopScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenEvent.stopScan()';
}


}




/// @nodoc


class ConnectDeviceEvent implements ReactiveScanScreenEvent {
  const ConnectDeviceEvent(this.deviceId);
  

 final  String deviceId;

/// Create a copy of ReactiveScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectDeviceEventCopyWith<ConnectDeviceEvent> get copyWith => _$ConnectDeviceEventCopyWithImpl<ConnectDeviceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectDeviceEvent&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'ReactiveScanScreenEvent.connectDevice(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $ConnectDeviceEventCopyWith<$Res> implements $ReactiveScanScreenEventCopyWith<$Res> {
  factory $ConnectDeviceEventCopyWith(ConnectDeviceEvent value, $Res Function(ConnectDeviceEvent) _then) = _$ConnectDeviceEventCopyWithImpl;
@useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class _$ConnectDeviceEventCopyWithImpl<$Res>
    implements $ConnectDeviceEventCopyWith<$Res> {
  _$ConnectDeviceEventCopyWithImpl(this._self, this._then);

  final ConnectDeviceEvent _self;
  final $Res Function(ConnectDeviceEvent) _then;

/// Create a copy of ReactiveScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deviceId = null,}) {
  return _then(ConnectDeviceEvent(
null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateScanResultsEvent implements ReactiveScanScreenEvent {
  const UpdateScanResultsEvent(final  List<DiscoveredDevice> results): _results = results;
  

 final  List<DiscoveredDevice> _results;
 List<DiscoveredDevice> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ReactiveScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateScanResultsEventCopyWith<UpdateScanResultsEvent> get copyWith => _$UpdateScanResultsEventCopyWithImpl<UpdateScanResultsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateScanResultsEvent&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ReactiveScanScreenEvent.updateScanResults(results: $results)';
}


}

/// @nodoc
abstract mixin class $UpdateScanResultsEventCopyWith<$Res> implements $ReactiveScanScreenEventCopyWith<$Res> {
  factory $UpdateScanResultsEventCopyWith(UpdateScanResultsEvent value, $Res Function(UpdateScanResultsEvent) _then) = _$UpdateScanResultsEventCopyWithImpl;
@useResult
$Res call({
 List<DiscoveredDevice> results
});




}
/// @nodoc
class _$UpdateScanResultsEventCopyWithImpl<$Res>
    implements $UpdateScanResultsEventCopyWith<$Res> {
  _$UpdateScanResultsEventCopyWithImpl(this._self, this._then);

  final UpdateScanResultsEvent _self;
  final $Res Function(UpdateScanResultsEvent) _then;

/// Create a copy of ReactiveScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(UpdateScanResultsEvent(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<DiscoveredDevice>,
  ));
}


}

/// @nodoc
mixin _$ReactiveScanScreenState {

 BleConnectionState get connectionState; List<DiscoveredDevice> get scanResults;
/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactiveScanScreenStateCopyWith<ReactiveScanScreenState> get copyWith => _$ReactiveScanScreenStateCopyWithImpl<ReactiveScanScreenState>(this as ReactiveScanScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other.scanResults, scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(scanResults));

@override
String toString() {
  return 'ReactiveScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class $ReactiveScanScreenStateCopyWith<$Res>  {
  factory $ReactiveScanScreenStateCopyWith(ReactiveScanScreenState value, $Res Function(ReactiveScanScreenState) _then) = _$ReactiveScanScreenStateCopyWithImpl;
@useResult
$Res call({
 BleConnectionState connectionState, List<DiscoveredDevice> scanResults
});


$BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class _$ReactiveScanScreenStateCopyWithImpl<$Res>
    implements $ReactiveScanScreenStateCopyWith<$Res> {
  _$ReactiveScanScreenStateCopyWithImpl(this._self, this._then);

  final ReactiveScanScreenState _self;
  final $Res Function(ReactiveScanScreenState) _then;

/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_self.copyWith(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<DiscoveredDevice>,
  ));
}
/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleConnectionStateCopyWith<$Res> get connectionState {
  
  return $BleConnectionStateCopyWith<$Res>(_self.connectionState, (value) {
    return _then(_self.copyWith(connectionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReactiveScanScreenState].
extension ReactiveScanScreenStatePatterns on ReactiveScanScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactiveScanScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactiveScanScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactiveScanScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ReactiveScanScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactiveScanScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ReactiveScanScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<DiscoveredDevice> scanResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReactiveScanScreenState() when $default != null:
return $default(_that.connectionState,_that.scanResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<DiscoveredDevice> scanResults)  $default,) {final _that = this;
switch (_that) {
case _ReactiveScanScreenState():
return $default(_that.connectionState,_that.scanResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleConnectionState connectionState,  List<DiscoveredDevice> scanResults)?  $default,) {final _that = this;
switch (_that) {
case _ReactiveScanScreenState() when $default != null:
return $default(_that.connectionState,_that.scanResults);case _:
  return null;

}
}

}

/// @nodoc


class _ReactiveScanScreenState implements ReactiveScanScreenState {
  const _ReactiveScanScreenState({required this.connectionState, final  List<DiscoveredDevice> scanResults = const []}): _scanResults = scanResults;
  

@override final  BleConnectionState connectionState;
 final  List<DiscoveredDevice> _scanResults;
@override@JsonKey() List<DiscoveredDevice> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}


/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactiveScanScreenStateCopyWith<_ReactiveScanScreenState> get copyWith => __$ReactiveScanScreenStateCopyWithImpl<_ReactiveScanScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactiveScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other._scanResults, _scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(_scanResults));

@override
String toString() {
  return 'ReactiveScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class _$ReactiveScanScreenStateCopyWith<$Res> implements $ReactiveScanScreenStateCopyWith<$Res> {
  factory _$ReactiveScanScreenStateCopyWith(_ReactiveScanScreenState value, $Res Function(_ReactiveScanScreenState) _then) = __$ReactiveScanScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleConnectionState connectionState, List<DiscoveredDevice> scanResults
});


@override $BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class __$ReactiveScanScreenStateCopyWithImpl<$Res>
    implements _$ReactiveScanScreenStateCopyWith<$Res> {
  __$ReactiveScanScreenStateCopyWithImpl(this._self, this._then);

  final _ReactiveScanScreenState _self;
  final $Res Function(_ReactiveScanScreenState) _then;

/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_ReactiveScanScreenState(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<DiscoveredDevice>,
  ));
}

/// Create a copy of ReactiveScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleConnectionStateCopyWith<$Res> get connectionState {
  
  return $BleConnectionStateCopyWith<$Res>(_self.connectionState, (value) {
    return _then(_self.copyWith(connectionState: value));
  });
}
}

/// @nodoc
mixin _$ReactiveScanScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactiveScanScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenSR()';
}


}

/// @nodoc
class $ReactiveScanScreenSRCopyWith<$Res>  {
$ReactiveScanScreenSRCopyWith(ReactiveScanScreenSR _, $Res Function(ReactiveScanScreenSR) __);
}


/// Adds pattern-matching-related methods to [ReactiveScanScreenSR].
extension ReactiveScanScreenSRPatterns on ReactiveScanScreenSR {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DeviceConnected value)?  deviceConnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceConnected() when deviceConnected != null:
return deviceConnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DeviceConnected value)  deviceConnected,}){
final _that = this;
switch (_that) {
case _DeviceConnected():
return deviceConnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DeviceConnected value)?  deviceConnected,}){
final _that = this;
switch (_that) {
case _DeviceConnected() when deviceConnected != null:
return deviceConnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  deviceConnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceConnected() when deviceConnected != null:
return deviceConnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  deviceConnected,}) {final _that = this;
switch (_that) {
case _DeviceConnected():
return deviceConnected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  deviceConnected,}) {final _that = this;
switch (_that) {
case _DeviceConnected() when deviceConnected != null:
return deviceConnected();case _:
  return null;

}
}

}

/// @nodoc


class _DeviceConnected implements ReactiveScanScreenSR {
  const _DeviceConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReactiveScanScreenSR.deviceConnected()';
}


}




// dart format on
