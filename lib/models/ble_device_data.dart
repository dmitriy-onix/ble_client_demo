import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_device_data.freezed.dart';

@freezed
abstract class BleDeviceData with _$BleDeviceData {
  const factory BleDeviceData({
    String? deviceName,
    String? firmwareVersion,
    double? temperature,
    int? humidity,
    int? batteryLevel,
    String? status,
    @Default(false) bool ledState,
    String? logData,
  }) = _BleDeviceData;

  const BleDeviceData._();

  String get temperatureDisplay =>
      temperature != null ? '${temperature!.toStringAsFixed(1)}°C' : 'N/A';

  String get humidityDisplay => humidity != null ? '$humidity%' : 'N/A';

  String get batteryDisplay => batteryLevel != null ? '$batteryLevel%' : 'N/A';
}
