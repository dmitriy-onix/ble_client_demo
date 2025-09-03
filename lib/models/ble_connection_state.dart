import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_connection_state.freezed.dart';

@freezed
abstract class BleConnectionState with _$BleConnectionState {
  const factory BleConnectionState({
    @Default(false) bool isConnected,
    @Default(false) bool isConnecting,
    @Default(false) bool isScanning,
    String? error,
  }) = _BleConnectionState;

  const BleConnectionState._();

  factory BleConnectionState.empty() => const BleConnectionState();
}
