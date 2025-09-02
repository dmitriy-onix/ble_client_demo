class BleUuids {
  // Device Information Service
  static const String deviceInfoService =
      "12345678-1234-1234-1234-123456789abc";
  static const String deviceNameCharacteristic =
      "12345678-1234-1234-1234-123456789ab1";
  static const String firmwareVersionCharacteristic =
      "12345678-1234-1234-1234-123456789ab2";

  // Sensor Data Service
  static const String sensorDataService =
      "87654321-4321-4321-4321-cba987654321";
  static const String temperatureCharacteristic =
      "87654321-4321-4321-4321-cba987654322";
  static const String humidityCharacteristic =
      "87654321-4321-4321-4321-cba987654323";
  static const String batteryLevelCharacteristic =
      "87654321-4321-4321-4321-cba987654324";

  // Control Service
  static const String controlService = "abcdef12-3456-7890-abcd-ef1234567890";
  static const String ledControlCharacteristic =
      "abcdef12-3456-7890-abcd-ef1234567891";
  static const String commandCharacteristic =
      "abcdef12-3456-7890-abcd-ef1234567892";
  static const String statusCharacteristic =
      "abcdef12-3456-7890-abcd-ef1234567893";
}
