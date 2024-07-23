
# Mini Home Automation App

A Flutter application for home automation featuring a streamlined interface with a Dashboard to monitor and control devices and a Settings page to adjust user preferences.

## Features

- **Dashboard Screen:**
  - Control switch for devices like lights and fans.
  - Display real-time data to show consumption (e.g., water, gas).

- **Settings Screen:**
  - Options for theme changes (light/dark mode).
  - Notification settings to enable or disable notifications.
  - User profile modifications (if applicable).

## Architecture

The app follows the MVVM (Model-View-ViewModel) pattern combined with the Provider for state management.

- **Model:** Represents data models (e.g., `Device`) and data handling logic (`DataService`).
- **View:** Represents the UI layer (e.g., `DashboardScreen`, `SettingsScreen`).
- **ViewModel:** Manages the state and business logic (`ThemeNotifier`).

## Dependencies

The app uses the following dependencies:

- **provider:** State management library for Flutter that makes it easier to manage and propagate state changes across the app.

  ```yaml
  dependencies:
    provider: ^6.0.0
  ```

- **shared_preferences:** Flutter plugin for reading and writing simple key-value pairs. Used for persisting user settings such as theme preference and notification settings.

  ```yaml
  dependencies:
    shared_preferences: ^2.0.13
  ```

- **json_annotation:** Provides annotations to help with JSON serialization.

  ```yaml
  dependencies:
    json_annotation: ^4.3.0
  ```

- **build_runner:** A build system for Dart code generation that helps to run code generation tasks.

  ```yaml
  dev_dependencies:
    build_runner: ^2.1.7
  ```

- **json_serializable:** Generates code for JSON serialization and deserialization.

  ```yaml
  dev_dependencies:
    json_serializable: ^6.1.4
  ```

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/saumysinha31/Home-Automation-System/.git
   cd home_automation_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the build runner to generate JSON serialization code:**

   ```bash
   flutter pub run build_runner build
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

### File Structure

```plaintext
lib/
├── main.dart
├── models/
│   └── device.dart
├── screens/
│   ├── dashboard_screen.dart
│   └── settings_screen.dart
├── services/
│   └── data_service.dart
└── theme_notifier.dart
assets/
└── devices.json
```

### Detailed Explanation of Key Files

- **`main.dart`:** Entry point of the app. Sets up the theme and navigation.
- **`theme_notifier.dart`:** Manages the theme state and provides methods to toggle and persist the theme.
- **`screens/dashboard_screen.dart`:** Defines the UI for the Dashboard screen, displaying device data.
- **`screens/settings_screen.dart`:** Defines the UI for the Settings screen, allowing theme changes and notification toggles.
- **`models/device.dart`:** Defines the `Device` data model, with JSON serialization/deserialization.
- **`services/data_service.dart`:** Handles data fetching and parsing from a local JSON file (`assets/devices.json`).
- **`assets/devices.json`:** Simulated device data for the app.

## Running the App

- **Start the app:** Ensure you have an emulator or physical device connected and run:

  ```bash
  flutter run
  ```

## Contributing

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

