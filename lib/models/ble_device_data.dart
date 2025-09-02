class BleDeviceData {
  final String? deviceName;
  final String? firmwareVersion;
  final double? temperature;
  final int? humidity;
  final int? batteryLevel;
  final String? status;
  final bool ledState;
  final String? logData;

  const BleDeviceData({
    this.deviceName,
    this.firmwareVersion,
    this.temperature,
    this.humidity,
    this.batteryLevel,
    this.status,
    this.ledState = false,
    this.logData,
  });

  BleDeviceData copyWith({
    String? deviceName,
    String? firmwareVersion,
    double? temperature,
    int? humidity,
    int? batteryLevel,
    String? status,
    bool? ledState,
    String? logData,
  }) {
    return BleDeviceData(
      deviceName: deviceName ?? this.deviceName,
      firmwareVersion: firmwareVersion ?? this.firmwareVersion,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      status: status ?? this.status,
      ledState: ledState ?? this.ledState,
      logData: logData ?? this.logData,
    );
  }

  String get temperatureDisplay =>
      temperature != null ? '${temperature!.toStringAsFixed(1)}°C' : 'N/A';

  String get humidityDisplay => humidity != null ? '$humidity%' : 'N/A';

  String get batteryDisplay => batteryLevel != null ? '$batteryLevel%' : 'N/A';
}

