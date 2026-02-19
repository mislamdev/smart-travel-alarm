# Smart Travel Alarm 🌍⏰

A modern Flutter mobile application designed to help travelers set location-based alarms, ensuring they never miss their destination during their journey. Perfect for bus/train commuters, road trips, and exploring new cities!

[![Flutter Version](https://img.shields.io/badge/Flutter-3.32.6-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.8.1-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## ✨ Features

### Core Functionality
- **📍 Location-Based Alarms**: Set alarms based on GPS coordinates or manually selected locations
- **🎯 Current Location Detection**: Quickly fetch and use your current GPS location with a single tap
- **🗺️ Interactive Location Selection**: Choose destinations from an interactive map interface
- **⏰ Multiple Alarm Management**: Create, enable/disable, and delete multiple travel alarms
- **🔔 Smart Notifications**: Reliable alarm notifications with timezone support

### UI/UX Features
- **🎨 Beautiful Gradient Design**: Modern, sleek interface with gradient backgrounds
- **🎬 Video Onboarding**: Engaging video-based onboarding experience
- **✏️ Poppins Typography**: Clean, modern font family throughout the app
- **🌈 Immersive Experience**: Status bar transparency for full-screen media
- **📱 Responsive Layout**: Optimized for various screen sizes

### Platform Support
- ✅ **Android** (API 21+ / Android 5.0+)
- ✅ **iOS** (iOS 12.0+)
- 🔧 **Linux** (Development/Testing with mock implementations)

## 🛠️ Tech Stack

### Framework & Language
- **Flutter**: 3.32.6
- **Dart**: 3.8.1

### Key Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_riverpod` | 2.6.1 | State management |
| `geolocator` | 12.0.0 | GPS location services |
| `flutter_local_notifications` | 17.2.4 | Local push notifications |
| `video_player` | 2.10.1 | Video playback for onboarding |
| `timezone` | 0.9.4 | Timezone handling for alarms |
| `intl` | 0.19.0 | Date/time formatting |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>= 3.8.1)
- Android Studio / Xcode / VS Code
- Android/iOS device or emulator
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/smart_travel_alarm.git
   cd smart_travel_alarm
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For a specific device
   flutter devices
   flutter run -d <device-id>
   ```

4. **Build APK (Android)**
   ```bash
   flutter build apk --release
   ```

5. **Build iOS**
   ```bash
   flutter build ios --release
   ```

## 📐 Project Architecture

The app follows a **feature-first architecture** with clean separation of concerns:

```
lib/
├── common_widgets/           # Reusable UI components
│   ├── app_gradient_background.dart
│   ├── gradient_button.dart
│   └── primary_button.dart
├── constants/                # App-wide constants
│   ├── app_assets.dart
│   └── app_theme.dart
├── features/
│   ├── alarm/               # Alarm management feature
│   │   ├── data/
│   │   │   └── notification_service.dart
│   │   ├── domain/
│   │   │   └── alarm.dart
│   │   └── presentation/
│   │       ├── alarm_controller.dart
│   │       └── alarms_screen.dart
│   ├── location/            # Location services feature
│   │   ├── data/
│   │   │   └── location_service.dart
│   │   ├── domain/
│   │   │   └── location_result.dart
│   │   └── presentation/
│   │       ├── location_controller.dart
│   │       └── location_screen.dart
│   └── onboarding/          # User onboarding feature
│       ├── data/
│       │   └── onboarding_slide.dart
│       └── presentation/
│           ├── onboarding_screen.dart
│           └── widgets/
│               └── onboarding_media.dart
├── helpers/                 # Utility functions
│   └── date_time_formatters.dart
└── main.dart               # App entry point
```

## 🎯 Key Components

### 1. **AppGradientBackground**
Reusable gradient background widget with optional SafeArea support.

```dart
AppGradientBackground(
  useSafeArea: true,  // Optional, defaults to true
  child: YourWidget(),
)
```

### 2. **GradientButton**
Customizable button with gradient/outline styles and optional icons.

```dart
GradientButton(
  text: "Use Current Location",
  icon: Icons.location_on_outlined,
  iconOnRight: true,  // Icon position (left/right)
  outlined: true,     // Outlined or filled style
  onTap: () {},
)
```

### 3. **LocationService**
Handles GPS location fetching with platform-specific implementations.
- Android/iOS: Real GPS coordinates
- Linux: Mock coordinates for development

### 4. **NotificationService**
Manages scheduled alarm notifications with timezone support.
- Android/iOS: Full notification support
- Linux: Mock notifications (console logs)

### 5. **AlarmsController (Riverpod)**
State management for alarm CRUD operations.

```dart
final alarmsControllerProvider = StateNotifierProvider<AlarmsController, List<Alarm>>(...)
```

## 🎨 Design Features

### Color Scheme
- **Primary Gradient**: Purple (`#6A00FF` → `#9C00FF`)
- **Background Gradient**: Dark blue (`#082257` → `#0B0024`)
- **Typography**: Poppins font family

### UI Patterns
- **Immersive Onboarding**: Full-screen video with transparent status bar
- **Pill-shaped Containers**: Rounded input fields with 40px border radius
- **Floating Action Button**: Quick alarm creation
- **Modular Text Limits**: Title (2 lines max), Subtitle (3 lines max)

## 🔧 Configuration

### Android Configuration
The app requires the following permissions (automatically handled):

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

**NDK Version**: 27.0.12077973 (configured in `android/app/build.gradle.kts`)

### iOS Configuration
Add location permissions to `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to set travel alarms</string>
```

## 📱 User Flow

1. **Onboarding** (3 video slides)
   - Discover → Explore → See
   - Skip or Next through slides

2. **Location Selection**
   - Fetch current GPS location
   - Or manually add location from map

3. **Alarms Management**
   - View selected location
   - Create multiple alarms (+ FAB)
   - Enable/disable alarms
   - Delete alarms (swipe)

## 🐛 Troubleshooting

### Linux Development Issues

**Problem**: Build fails with clang++ libstdc++ error
**Solution**: Use gcc/g++ compiler (already configured in `linux/CMakeLists.txt`)

**Problem**: App crashes on Linux
**Solution**: Platform checks are in place for notifications and location services

### Common Issues

1. **Location not fetching**: Check device location services are enabled
2. **Notifications not showing**: Check app notification permissions
3. **Build errors**: Run `flutter clean && flutter pub get`

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**M Islam**

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for Poppins typography
- Riverpod community for excellent state management
- All contributors and testers

## 📞 Support

For issues and feature requests, please use the [GitHub Issues](https://github.com/yourusername/smart_travel_alarm/issues) page.

---

**Made with ❤️ and Flutter**

*Never miss your stop again! 🚆🚌🚗*
