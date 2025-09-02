# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter BLE (Bluetooth Low Energy) client demo application that connects to custom BLE servers. The app features a complete BLE client implementation with device scanning, connection management, and real-time sensor data monitoring.

## Development Commands

### Core Flutter Commands
- `flutter run` - Run the app on connected device/emulator
- `flutter run -d chrome` - Run in web browser (limited BLE support)
- `flutter run -d macos` - Run on macOS (if supported)
- `flutter hot reload` - Press 'r' in terminal or save files for hot reload
- `flutter hot restart` - Press 'R' in terminal for full restart

### Build Commands
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app (requires Xcode)
- `flutter build web` - Build for web deployment

### Development Tools
- `flutter analyze` - Run static analysis (uses analysis_options.yaml)
- `flutter test` - Run all tests in test/ directory
- `flutter test test/widget_test.dart` - Run specific test file
- `flutter pub get` - Install/update dependencies after CLAUDE.md or pubspec.yaml changes
- `flutter pub upgrade` - Upgrade dependencies to latest versions
- `flutter clean` - Clean build artifacts (recommended after major changes)

### Device Management
- `flutter devices` - List available devices/emulators
- `flutter emulators` - List available emulators
- `flutter emulators --launch <emulator_id>` - Launch specific emulator

## Architecture Overview

The app follows a clean architecture pattern with dependency injection using GetIt. The BLE functionality is implemented using `flutter_blue_plus` package.

### Core Architecture Components

**Dependency Injection**: Uses GetIt for singleton service management
- `BleService` is registered as a singleton in `service_locator.dart`
- Initialized in `main.dart` before app startup
- Accessed via `getIt<BleService>()` throughout the app

**Navigation**: Two-screen flow with centralized route management
- Scan Screen (`/scan`) - Device discovery and connection
- Connected Screen (`/connected`) - Device interaction and control
- Routes defined in `AppRoutes` class for type safety

**State Management**: StatefulWidget with Stream-based reactive updates
- BLE service provides data streams for real-time updates
- UI components listen to streams for automatic state updates
- Connection state managed independently from device data

### Key Services and Models

**BleService** (`lib/services/ble_service.dart`)
- Singleton service handling all BLE operations
- Manages device scanning, connection, and characteristic operations
- Provides reactive streams for device data updates
- Handles four custom BLE services defined in UUID constants

**BLE UUID Organization** (`lib/constants/ble_uuids.dart`)
- Device Information Service: name, firmware version
- Sensor Data Service: temperature, humidity, battery level
- Control Service: LED control, commands, status updates
- Centralized UUID management prevents errors and improves maintainability

## BLE Implementation Details

### Supported BLE Services
The app connects to devices implementing these custom services:
1. **Device Information Service** - Read device name and firmware version
2. **Sensor Data Service** - Temperature, humidity, battery level (read + notify)
3. **Control Service** - LED control (write), commands (write), status (read/write/notify)
4. **Data Logger Service** - Log data retrieval and management

### BLE Server Testing
Use the included `Creating a BLE Server with nRF Connect.md` guide to set up a test BLE server using nRF Connect Mobile app. The app scans specifically for devices named "TestDevice".

### Data Parsing
- Temperature: Parsed from 2-byte values (integer + fractional parts)
- Humidity: Single byte percentage value
- Battery: Single byte percentage value
- Text data: UTF-8 encoded strings for names, status, commands

## Development Environment

- Flutter SDK: Uses stable channel (^3.8.1)
- Dart SDK: ^3.8.1
- Key Dependencies:
  - `flutter_blue_plus: ^1.35.5` - BLE functionality
  - `get_it: ^7.6.7` - Dependency injection
- Platform Support: Android, iOS (macOS/Web have limited BLE support)
- Android: Requires location permissions for BLE scanning
- iOS: Requires Bluetooth usage descriptions in Info.plist

## File Organization

```
lib/
├── main.dart                     # App initialization and GetIt setup
├── app.dart                      # MaterialApp configuration and routing
├── core/
│   ├── service_locator.dart      # GetIt dependency injection setup
│   └── app_routes.dart           # Centralized route constants
├── constants/
│   └── ble_uuids.dart           # BLE service and characteristic UUIDs
├── models/
│   ├── ble_device_data.dart     # Device data model with display formatters
│   └── ble_connection_state.dart # Connection state management
├── services/
│   └── ble_service.dart         # Core BLE service implementation
└── presentation/screens/
    ├── ble_scan_screen.dart     # Device scanning and connection UI
    └── ble_connected_screen.dart # Device interaction and control UI
```

## Important Notes

- BLE permissions are pre-configured for Android and iOS in manifest files
- The app maintains BLE connection state across screen navigation via singleton service
- Debug prints are enabled in BleService for development troubleshooting
- Connection state and device data are managed separately for better state isolation
- UI uses Material 3 design system with reactive card-based layouts