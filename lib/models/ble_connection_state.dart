class BleConnectionState {
  final bool isConnected;
  final bool isConnecting;
  final bool isScanning;
  final String? error;

  const BleConnectionState({
    this.isConnected = false,
    this.isConnecting = false,
    this.isScanning = false,
    this.error,
  });

  BleConnectionState copyWith({
    bool? isConnected,
    bool? isConnecting,
    bool? isScanning,
    String? error,
  }) {
    return BleConnectionState(
      isConnected: isConnected ?? this.isConnected,
      isConnecting: isConnecting ?? this.isConnecting,
      isScanning: isScanning ?? this.isScanning,
      error: error ?? this.error,
    );
  }
}
