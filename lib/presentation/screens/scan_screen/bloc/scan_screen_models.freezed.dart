// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenEvent()';
}


}

/// @nodoc
class $ScanScreenEventCopyWith<$Res>  {
$ScanScreenEventCopyWith(ScanScreenEvent _, $Res Function(ScanScreenEvent) __);
}


/// Adds pattern-matching-related methods to [ScanScreenEvent].
extension ScanScreenEventPatterns on ScanScreenEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  startScan,TResult Function()?  stopScan,TResult Function( BluetoothDevice device)?  connectDevice,TResult Function( List<ScanResult> results)?  updateScanResults,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.device);case UpdateScanResultsEvent() when updateScanResults != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  startScan,required TResult Function()  stopScan,required TResult Function( BluetoothDevice device)  connectDevice,required TResult Function( List<ScanResult> results)  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent():
return init();case StartScanEvent():
return startScan();case StopScanEvent():
return stopScan();case ConnectDeviceEvent():
return connectDevice(_that.device);case UpdateScanResultsEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  startScan,TResult? Function()?  stopScan,TResult? Function( BluetoothDevice device)?  connectDevice,TResult? Function( List<ScanResult> results)?  updateScanResults,}) {final _that = this;
switch (_that) {
case InitEvent() when init != null:
return init();case StartScanEvent() when startScan != null:
return startScan();case StopScanEvent() when stopScan != null:
return stopScan();case ConnectDeviceEvent() when connectDevice != null:
return connectDevice(_that.device);case UpdateScanResultsEvent() when updateScanResults != null:
return updateScanResults(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class InitEvent implements ScanScreenEvent {
  const InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenEvent.init()';
}


}




/// @nodoc


class StartScanEvent implements ScanScreenEvent {
  const StartScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenEvent.startScan()';
}


}




/// @nodoc


class StopScanEvent implements ScanScreenEvent {
  const StopScanEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenEvent.stopScan()';
}


}




/// @nodoc


class ConnectDeviceEvent implements ScanScreenEvent {
  const ConnectDeviceEvent(this.device);
  

 final  BluetoothDevice device;

/// Create a copy of ScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectDeviceEventCopyWith<ConnectDeviceEvent> get copyWith => _$ConnectDeviceEventCopyWithImpl<ConnectDeviceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectDeviceEvent&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'ScanScreenEvent.connectDevice(device: $device)';
}


}

/// @nodoc
abstract mixin class $ConnectDeviceEventCopyWith<$Res> implements $ScanScreenEventCopyWith<$Res> {
  factory $ConnectDeviceEventCopyWith(ConnectDeviceEvent value, $Res Function(ConnectDeviceEvent) _then) = _$ConnectDeviceEventCopyWithImpl;
@useResult
$Res call({
 BluetoothDevice device
});




}
/// @nodoc
class _$ConnectDeviceEventCopyWithImpl<$Res>
    implements $ConnectDeviceEventCopyWith<$Res> {
  _$ConnectDeviceEventCopyWithImpl(this._self, this._then);

  final ConnectDeviceEvent _self;
  final $Res Function(ConnectDeviceEvent) _then;

/// Create a copy of ScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(ConnectDeviceEvent(
null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as BluetoothDevice,
  ));
}


}

/// @nodoc


class UpdateScanResultsEvent implements ScanScreenEvent {
  const UpdateScanResultsEvent(final  List<ScanResult> results): _results = results;
  

 final  List<ScanResult> _results;
 List<ScanResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ScanScreenEvent
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
  return 'ScanScreenEvent.updateScanResults(results: $results)';
}


}

/// @nodoc
abstract mixin class $UpdateScanResultsEventCopyWith<$Res> implements $ScanScreenEventCopyWith<$Res> {
  factory $UpdateScanResultsEventCopyWith(UpdateScanResultsEvent value, $Res Function(UpdateScanResultsEvent) _then) = _$UpdateScanResultsEventCopyWithImpl;
@useResult
$Res call({
 List<ScanResult> results
});




}
/// @nodoc
class _$UpdateScanResultsEventCopyWithImpl<$Res>
    implements $UpdateScanResultsEventCopyWith<$Res> {
  _$UpdateScanResultsEventCopyWithImpl(this._self, this._then);

  final UpdateScanResultsEvent _self;
  final $Res Function(UpdateScanResultsEvent) _then;

/// Create a copy of ScanScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(UpdateScanResultsEvent(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ScanResult>,
  ));
}


}

/// @nodoc
mixin _$ScanScreenState {

 BleConnectionState get connectionState; List<ScanResult> get scanResults;
/// Create a copy of ScanScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanScreenStateCopyWith<ScanScreenState> get copyWith => _$ScanScreenStateCopyWithImpl<ScanScreenState>(this as ScanScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other.scanResults, scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(scanResults));

@override
String toString() {
  return 'ScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class $ScanScreenStateCopyWith<$Res>  {
  factory $ScanScreenStateCopyWith(ScanScreenState value, $Res Function(ScanScreenState) _then) = _$ScanScreenStateCopyWithImpl;
@useResult
$Res call({
 BleConnectionState connectionState, List<ScanResult> scanResults
});


$BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class _$ScanScreenStateCopyWithImpl<$Res>
    implements $ScanScreenStateCopyWith<$Res> {
  _$ScanScreenStateCopyWithImpl(this._self, this._then);

  final ScanScreenState _self;
  final $Res Function(ScanScreenState) _then;

/// Create a copy of ScanScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_self.copyWith(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<ScanResult>,
  ));
}
/// Create a copy of ScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BleConnectionStateCopyWith<$Res> get connectionState {
  
  return $BleConnectionStateCopyWith<$Res>(_self.connectionState, (value) {
    return _then(_self.copyWith(connectionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScanScreenState].
extension ScanScreenStatePatterns on ScanScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ScanScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ScanScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<ScanResult> scanResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanScreenState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<ScanResult> scanResults)  $default,) {final _that = this;
switch (_that) {
case _ScanScreenState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleConnectionState connectionState,  List<ScanResult> scanResults)?  $default,) {final _that = this;
switch (_that) {
case _ScanScreenState() when $default != null:
return $default(_that.connectionState,_that.scanResults);case _:
  return null;

}
}

}

/// @nodoc


class _ScanScreenState implements ScanScreenState {
  const _ScanScreenState({required this.connectionState, final  List<ScanResult> scanResults = const []}): _scanResults = scanResults;
  

@override final  BleConnectionState connectionState;
 final  List<ScanResult> _scanResults;
@override@JsonKey() List<ScanResult> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}


/// Create a copy of ScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanScreenStateCopyWith<_ScanScreenState> get copyWith => __$ScanScreenStateCopyWithImpl<_ScanScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanScreenState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other._scanResults, _scanResults));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(_scanResults));

@override
String toString() {
  return 'ScanScreenState(connectionState: $connectionState, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class _$ScanScreenStateCopyWith<$Res> implements $ScanScreenStateCopyWith<$Res> {
  factory _$ScanScreenStateCopyWith(_ScanScreenState value, $Res Function(_ScanScreenState) _then) = __$ScanScreenStateCopyWithImpl;
@override @useResult
$Res call({
 BleConnectionState connectionState, List<ScanResult> scanResults
});


@override $BleConnectionStateCopyWith<$Res> get connectionState;

}
/// @nodoc
class __$ScanScreenStateCopyWithImpl<$Res>
    implements _$ScanScreenStateCopyWith<$Res> {
  __$ScanScreenStateCopyWithImpl(this._self, this._then);

  final _ScanScreenState _self;
  final $Res Function(_ScanScreenState) _then;

/// Create a copy of ScanScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionState = null,Object? scanResults = null,}) {
  return _then(_ScanScreenState(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<ScanResult>,
  ));
}

/// Create a copy of ScanScreenState
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
mixin _$ScanScreenSR {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanScreenSR);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenSR()';
}


}

/// @nodoc
class $ScanScreenSRCopyWith<$Res>  {
$ScanScreenSRCopyWith(ScanScreenSR _, $Res Function(ScanScreenSR) __);
}


/// Adds pattern-matching-related methods to [ScanScreenSR].
extension ScanScreenSRPatterns on ScanScreenSR {
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


class _DeviceConnected implements ScanScreenSR {
  const _DeviceConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanScreenSR.deviceConnected()';
}


}




// dart format on
