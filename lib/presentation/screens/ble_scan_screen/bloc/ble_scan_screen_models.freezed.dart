// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_scan_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleScanScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleScanScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenEvent()';
}


}

/// @nodoc
class $BleScanScreenEventCopyWith<$Res>  {
$BleScanScreenEventCopyWith(BleScanScreenEvent _, $Res Function(BleScanScreenEvent) __);
}


/// Adds pattern-matching-related methods to [BleScanScreenEvent].
extension BleScanScreenEventPatterns on BleScanScreenEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  startScan,TResult Function()?  stopScan,TResult Function( Peripheral peripheral)?  connectDevice,TResult Function( List<DiscoveredEventArgs> results)?  updateScanResults,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.peripheral);case UpdateScanResultsEvent() when updateScanResults != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  startScan,required TResult Function()  stopScan,required TResult Function( Peripheral peripheral)  connectDevice,required TResult Function( List<DiscoveredEventArgs> results)  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent():
return init();case StartScanEvent():
return startScan();case StopScanEvent():
return stopScan();case ConnectDeviceEvent():
return connectDevice(_that.peripheral);case UpdateScanResultsEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  startScan,TResult? Function()?  stopScan,TResult? Function( Peripheral peripheral)?  connectDevice,TResult? Function( List<DiscoveredEventArgs> results)?  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.peripheral);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements BleScanScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenEvent.init()';
}


}




/// @nodoc


class StartScanEvent implements BleScanScreenEvent {
  const StartScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenEvent.startScan()';
}


}




/// @nodoc


class StopScanEvent implements BleScanScreenEvent {
  const StopScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenEvent.stopScan()';
}


}




/// @nodoc


class ConnectDeviceEvent implements BleScanScreenEvent {
  const ConnectDeviceEvent(this.peripheral);
  

 final  Peripheral peripheral;

/// Create a copy of BleScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectDeviceEventCopyWith<ConnectDeviceEvent> get copyWith => _$ConnectDeviceEventCopyWithImpl<ConnectDeviceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectDeviceEvent&&(identical(other.peripheral, peripheral) || other.peripheral == peripheral));
}


@override
int get hashCode => Object.hash(runtimeType,peripheral);

@override
String toString() {
  return 'BleScanScreenEvent.connectDevice(peripheral: $peripheral)';
}


}

/// @nodoc
abstract mixin class $ConnectDeviceEventCopyWith<$Res> implements $BleScanScreenEventCopyWith<$Res> {
  factory $ConnectDeviceEventCopyWith(ConnectDeviceEvent value, $Res Function(ConnectDeviceEvent) _then) = _$ConnectDeviceEventCopyWithImpl;
@useResult
$Res call({
 Peripheral peripheral
});




}
/// @nodoc
class _$ConnectDeviceEventCopyWithImpl<$Res>
    implements $ConnectDeviceEventCopyWith<$Res> {
  _$ConnectDeviceEventCopyWithImpl(this._self, this._then);

  final ConnectDeviceEvent _self;
  final $Res Function(ConnectDeviceEvent) _then;

/// Create a copy of BleScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? peripheral = null,}) {
  return _then(ConnectDeviceEvent(
null == peripheral ? _self.peripheral : peripheral // ignore: cast_nullable_to_non_nullable
as Peripheral,
  ));
}


}

/// @nodoc


class UpdateScanResultsEvent implements BleScanScreenEvent {
  const UpdateScanResultsEvent(final  List<DiscoveredEventArgs> results): _results = results;
  

 final  List<DiscoveredEventArgs> _results;
 List<DiscoveredEventArgs> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of BleScanScreenEvent
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
  return 'BleScanScreenEvent.updateScanResults(results: $results)';
}


}

/// @nodoc
abstract mixin class $UpdateScanResultsEventCopyWith<$Res> implements $BleScanScreenEventCopyWith<$Res> {
  factory $UpdateScanResultsEventCopyWith(UpdateScanResultsEvent value, $Res Function(UpdateScanResultsEvent) _then) = _$UpdateScanResultsEventCopyWithImpl;
@useResult
$Res call({
 List<DiscoveredEventArgs> results
});




}
/// @nodoc
class _$UpdateScanResultsEventCopyWithImpl<$Res>
    implements $UpdateScanResultsEventCopyWith<$Res> {
  _$UpdateScanResultsEventCopyWithImpl(this._self, this._then);

  final UpdateScanResultsEvent _self;
  final $Res Function(UpdateScanResultsEvent) _then;

/// Create a copy of BleScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(UpdateScanResultsEvent(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<DiscoveredEventArgs>,
  ));
}


}

/// @nodoc
mixin _$BleScanScreenState {

 BleConnectionState get connectionState; List<DiscoveredEventArgs> get scanResults;
/// Create a copy of BleScanScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleScanScreenStateCopyWith<BleScanScreenState> get copyWith => _$BleScanScreenStateCopyWithImpl<BleScanScreenState>(this as BleScanScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other.scanResults, scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(scanResults));

@override
String toString() {
  return 'BleScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class $BleScanScreenStateCopyWith<$Res>  {
  factory $BleScanScreenStateCopyWith(BleScanScreenState value, $Res Function(BleScanScreenState) _then) = _$BleScanScreenStateCopyWithImpl;
@useResult
$Res call({
 BleConnectionState connectionState, List<DiscoveredEventArgs> scanResults
});


$BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class _$BleScanScreenStateCopyWithImpl<$Res>
    implements $BleScanScreenStateCopyWith<$Res> {
  _$BleScanScreenStateCopyWithImpl(this._self, this._then);

  final BleScanScreenState _self;
  final $Res Function(BleScanScreenState) _then;

/// Create a copy of BleScanScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_self.copyWith(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<DiscoveredEventArgs>,
  ));
}
/// Create a copy of BleScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleConnectionStateCopyWith<$Res> get connectionState {
  
  return $BleConnectionStateCopyWith<$Res>(_self.connectionState, (value) {
    return _then(_self.copyWith(connectionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [BleScanScreenState].
extension BleScanScreenStatePatterns on BleScanScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleScanScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleScanScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleScanScreenState value)  $default,){
final _that = this;
switch (_that) {
case _BleScanScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleScanScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _BleScanScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<DiscoveredEventArgs> scanResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleScanScreenState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<DiscoveredEventArgs> scanResults)  $default,) {final _that = this;
switch (_that) {
case _BleScanScreenState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleConnectionState connectionState,  List<DiscoveredEventArgs> scanResults)?  $default,) {final _that = this;
switch (_that) {
case _BleScanScreenState() when $default != null:
return $default(_that.connectionState,_that.scanResults);case _:
  return null;

}
}

}

/// @nodoc


class _BleScanScreenState implements BleScanScreenState {
  const _BleScanScreenState({required this.connectionState, final  List<DiscoveredEventArgs> scanResults = const []}): _scanResults = scanResults;
  

@override final  BleConnectionState connectionState;
 final  List<DiscoveredEventArgs> _scanResults;
@override@JsonKey() List<DiscoveredEventArgs> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}


/// Create a copy of BleScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleScanScreenStateCopyWith<_BleScanScreenState> get copyWith => __$BleScanScreenStateCopyWithImpl<_BleScanScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other._scanResults, _scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(_scanResults));

@override
String toString() {
  return 'BleScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class _$BleScanScreenStateCopyWith<$Res> implements $BleScanScreenStateCopyWith<$Res> {
  factory _$BleScanScreenStateCopyWith(_BleScanScreenState value, $Res Function(_BleScanScreenState) _then) = __$BleScanScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleConnectionState connectionState, List<DiscoveredEventArgs> scanResults
});


@override $BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class __$BleScanScreenStateCopyWithImpl<$Res>
    implements _$BleScanScreenStateCopyWith<$Res> {
  __$BleScanScreenStateCopyWithImpl(this._self, this._then);

  final _BleScanScreenState _self;
  final $Res Function(_BleScanScreenState) _then;

/// Create a copy of BleScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_BleScanScreenState(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<DiscoveredEventArgs>,
  ));
}

/// Create a copy of BleScanScreenState
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
mixin _$BleScanScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleScanScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenSR()';
}


}

/// @nodoc
class $BleScanScreenSRCopyWith<$Res>  {
$BleScanScreenSRCopyWith(BleScanScreenSR _, $Res Function(BleScanScreenSR) __);
}


/// Adds pattern-matching-related methods to [BleScanScreenSR].
extension BleScanScreenSRPatterns on BleScanScreenSR {
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


class _DeviceConnected implements BleScanScreenSR {
  const _DeviceConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BleScanScreenSR.deviceConnected()';
}


}




// dart format on
