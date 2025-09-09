# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter BLE (Bluetooth Low Energy) client demo application that connects to custom BLE servers. The app features a complete BLE client implementation with device scanning, connection management, and real-time sensor data monitoring. The project uses clean architecture with BLoC pattern for state management, Freezed for immutable data models, and modular widget organization.

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

### Code Generation Commands
- `dart run build_runner build` - Generate Freezed and other code generation files
- `dart run build_runner build --delete-conflicting-outputs` - Force regenerate all generated files
- `dart run build_runner clean` - Clean generated files cache

### Device Management
- `flutter devices` - List available devices/emulators
- `flutter emulators` - List available emulators
- `flutter emulators --launch <emulator_id>` - Launch specific emulator

## Architecture Overview

The app follows a clean architecture pattern with the BLoC pattern for state management. The BLE functionality is implemented using `flutter_blue_plus` package.

### Core Architecture Components

**Dependency Injection**: Uses GetIt for singleton service management
- `BleService` is registered as a singleton in `service_locator.dart`
- Initialized in `main.dart` before app startup
- Accessed via `getIt<BleService>()` throughout the app

**State Management**: BLoC Architecture with OnixFlutterTeam's enhanced BLoC classes
- Uses custom `BaseBloc` and `BaseCubit` for enhanced functionality
- Includes Single Result events for one-time UI interactions (navigation, toasts, etc.)
- Progress and failure stream mixins for consistent loading/error handling
- Stream-based reactive updates with proper lifecycle management

**Navigation**: Two-screen flow with centralized route management
- Scan Screen (`/scan`) - Device discovery and connection
- Connected Screen (`/connected`) - Device interaction and control
- Routes defined in `AppRoutes` class for type safety

**Widget Organization**: Modular widget structure
- Main screens broken into smaller, reusable widgets
- Organized in dedicated `widgets/` folders for maintainability
- Each widget has focused responsibility

### Enhanced BLoC Architecture

The project includes a complete BLoC architecture setup from OnixFlutterTeam with:

**Base Classes** (`lib/arch/bloc/`)
- `BaseBloc<Event, State, SR>` - Enhanced BLoC with Single Result support
- `BaseCubit<State, SR>` - Enhanced Cubit with Single Result support
- `BaseState<S, B, SR, W>` - Base state class for BLoC-powered screens
- `BaseCubitState<S, C, SR, W>` - Base state class for Cubit-powered screens

**Mixins** (`lib/arch/bloc/mixins/`)
- `SingleResultBlocMixin` - Adds Single Result capability to BLoCs
- `SingleResultCubitMixin` - Adds Single Result capability to Cubits
- `ProgressStreamMixin` - Handles loading states with progress streams
- `FailureStreamMixin` - Manages error states with failure streams
- `BlocBuildersMixin` - Provides convenient builder methods for BLoC widgets

**Utilities**
- `AppBlocObserver` - Debug observer for BLoC events and errors
- `StreamListener<T>` - Widget for managing stream lifecycle
- Type definitions for common BLoC callback functions

### Data Models

**Freezed Integration**: All data models use Freezed for immutability
- `BleDeviceData` - Device information with Freezed copyWith and equality
- `BleConnectionState` - Connection state management with Freezed
- Automatic code generation for data classes with proper serialization

## Key Services and Models

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

### BLE Bonding and Pairing
- **Device Bonding**: Supports BLE device bonding for enhanced security
- **Pairing Management**: Create and remove bonds between the client and BLE devices
- **Control Service Access**: Some services (like Control Service) require device bonding
- **Security Indicators**: Visual feedback for bonded vs. unbonded device states
- **Bond Status Tracking**: Real-time monitoring of device bond status

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
  - `flutter_blue_plus: ^1.35.10` - BLE functionality
  - `get_it: ^8.2.0` - Dependency injection
  - `flutter_bloc: ^9.1.1` - State management
  - `freezed_annotation: ^3.1.0` - Code generation annotations
  - `loader_overlay: ^5.0.0` - Loading overlay support
  - `flutter_lints: ^6.0.0` - Static analysis rules
- Dev Dependencies:
  - `freezed: ^3.2.0` - Code generation for data classes
  - `build_runner: ^2.7.1` - Code generation runner
- Platform Support: Android, iOS (macOS/Web have limited BLE support)
- Android: Requires location permissions for BLE scanning
- iOS: Requires Bluetooth usage descriptions in Info.plist

## File Organization

```
lib/
├── main.dart                          # App initialization and GetIt setup
├── app.dart                           # MaterialApp configuration and routing
├── arch/                              # Architecture components
│   ├── bloc/                          # BLoC architecture classes
│   │   ├── base_bloc/                 # Enhanced BLoC classes
│   │   │   ├── base_bloc.dart         # Base BLoC with mixins
│   │   │   ├── base_bloc_state.dart   # Base state for BLoC screens
│   │   │   └── sr_bloc_mixin.dart     # Single Result mixin for BLoCs
│   │   ├── base_cubit/                # Enhanced Cubit classes
│   │   │   ├── base_cubit.dart        # Base Cubit with mixins
│   │   │   ├── base_cubit_state.dart  # Base state for Cubit screens
│   │   │   └── sr_cubit_mixin.dart    # Single Result mixin for Cubits
│   │   ├── mixins/                    # BLoC utility mixins
│   │   │   ├── bloc_builders_mixin.dart # Builder convenience methods
│   │   │   ├── failure_stream_mixin.dart # Error handling
│   │   │   └── progress_stream_mixin.dart # Loading states
│   │   ├── app_bloc_observer.dart     # Debug observer
│   │   ├── bloc_typedefs.dart         # Type definitions
│   │   └── stream_listener.dart       # Stream lifecycle widget
│   ├── domain/                        # Domain layer components
│   │   ├── failure/                   # Error handling models
│   │   └── progress_state/            # Loading state models
│   └── models/                        # Core architecture models
│       └── core_models.dart           # Base models for architecture
├── core/
│   ├── service_locator.dart           # GetIt dependency injection setup
│   └── app_routes.dart                # Centralized route constants
├── constants/
│   └── ble_uuids.dart                # BLE service and characteristic UUIDs
├── models/                            # Data models (Freezed)
│   ├── ble_device_data.dart          # Device data model with display formatters
│   ├── ble_device_data.freezed.dart  # Generated Freezed code
│   ├── ble_connection_state.dart     # Connection state management
│   └── ble_connection_state.freezed.dart # Generated Freezed code
├── services/
│   └── ble_service.dart              # Core BLE service implementation
└── presentation/screens/
    ├── connected_screen/
    │   ├── ble_connected_screen.dart      # Main connected screen
    │   ├── bloc/                          # Connected screen BLoC
    │   │   ├── connected_screen_bloc.dart # Connected screen business logic
    │   │   ├── connected_screen_models.dart # Connected screen state/event models
    │   │   └── connected_screen_models.freezed.dart # Generated Freezed code
    │   ├── failures/                      # Connected screen failure models
    │   │   └── connected_failures.dart   # Error types for connected screen
    │   └── widgets/                       # Modular UI components
    │       ├── device_info_card.dart      # Device information display
    │       ├── sensor_data_card.dart      # Sensor readings display
    │       ├── control_card.dart          # Device controls
    │       ├── actions_card.dart          # Action buttons
    │       └── bonding_card.dart          # Device bonding and pairing controls
    └── scan_screen/
        ├── ble_scan_screen.dart           # Device scanning and connection UI
        ├── bloc/                          # Scan screen BLoC
        │   ├── scan_screen_bloc.dart      # Scan screen business logic
        │   ├── scan_screen_models.dart    # Scan screen state/event models
        │   └── scan_screen_models.freezed.dart # Generated Freezed code
        └── failures/                      # Scan screen failure models
            └── scan_failures.dart         # Error types for scan screen
```

## BLoC Screen Implementation

Both Scan and Connected screens implement complete BLoC patterns:

**Screen Structure** (Both screens follow this pattern)
- `Screen.dart` - Main screen widget extending BaseState
- `bloc/` - Business logic components
  - `ScreenBloc` - Main BLoC handling events and state changes
  - `ScreenModels` - Freezed models for states and events
  - `ScreenModels.freezed.dart` - Generated Freezed code
- `failures/` - Screen-specific failure models
- Each screen manages its own state and communicates with BleService

**BLoC Benefits in this project:**
- Reactive UI updates from BLE service streams
- Proper separation of business logic from presentation
- Type-safe event/state handling with Freezed models
- Single Result events for navigation and one-time UI feedback
- Progress and failure stream management for loading states
- Consistent error handling across screens

## Important Notes

- BLE permissions are pre-configured for Android and iOS in manifest files
- The app maintains BLE connection state across screen navigation via singleton service
- Debug prints are enabled in BleService for development troubleshooting
- Connection state and device data are managed separately for better state isolation
- UI uses Material 3 design system with reactive card-based layouts
- All data models use Freezed for immutability and code generation
- Enhanced BLoC architecture supports Single Result events for one-time UI actions
- Widget organization follows modular patterns for better maintainability
- Stream-based reactive programming with proper lifecycle management
- BLE bonding functionality is integrated for secure device pairing
- Each screen has its own BLoC for independent state management
- Failure models are defined per screen for specific error handling