# Smart Travel Alarm 🌍⏰

A modern Flutter mobile application designed to help travelers set location-based alarms, ensuring they never miss their destination during their journey. Perfect for bus/train commuters, road trips, and exploring new cities!

[![Flutter Version](https://img.shields.io/badge/Flutter-3.8.1-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.8.1-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-2.1.0-brightgreen.svg)](pubspec.yaml)

## ✨ Features

### Core Functionality
- **📍 Location-Based Alarms**: Set alarms based on GPS coordinates or manually selected locations
- **🎯 Current Location Detection**: Quickly fetch and use your current GPS location with a single tap
- **🗺️ Multiple Location Input Methods**:
  - Use current GPS location
  - Enter place name manually
  - Input exact GPS coordinates (latitude/longitude)
- **⏰ Smart Alarm Management**: Create, view, edit, enable/disable, and delete travel alarms
- **🔔 Exact Alarm Scheduling**: Reliable notifications with Android 12+ exact alarm support
- **💾 Persistent Storage**: Alarms saved using Hive database
- **📝 Rich Alarm Details**: Add title, description, and location to each alarm
- **👆 Swipe to Delete**: Intuitive swipe-left gesture to delete alarms with confirmation
- **↩️ Undo Delete**: Restore accidentally deleted alarms

### UI/UX Features
- **🎨 Beautiful Gradient Design**: Modern purple gradient interface (#082257 to #0B0024)
- **🎬 Video Onboarding**: Engaging video-based onboarding experience for first-time users
- **✏️ Inline Editing**: Edit alarm details directly on the details page without opening new windows
- **🔄 Real-time Updates**: Instant UI updates when alarms are modified
- **📱 Responsive Layout**: Optimized for various Android screen sizes
- **🎭 Glass Morphism**: Subtle transparency effects for modern aesthetics
- **🌟 Custom Icons**: 2000+ Font Awesome icons including brand logos
- **✨ Smooth Animations**: Dismissible alarms with animated backgrounds

### Advanced Features
- **ℹ️ About & Contact Page**: Developer information with clickable links
- **🔗 URL Launcher**: Direct links to email, GitHub, LinkedIn, Twitter
- **📍 Location Options Modal**: Beautiful bottom sheet for location input methods
- **📊 Alarm Status Toggle**: Quick enable/disable switch on details page
- **🎯 Smart Display Logic**: Shows title or time prominently based on available data

### Platform Support
- ✅ **Android** (API 21+ / Android 5.0+) with Android 12+ exact alarm support
- ✅ **iOS** (iOS 12.0+)
- 🔧 **Linux** (Development/Testing with mock implementations)

## 🛠️ Tech Stack

### Framework & Language
- **Flutter**: 3.8.1
- **Dart**: 3.8.1

### State Management
- **flutter_riverpod** (2.6.1): Reactive state management

### Location Services
- **geolocator** (12.0.0): GPS location access
- **LocationService**: Custom service wrapper for location operations

### Notifications & Scheduling
- **flutter_local_notifications** (17.2.4): Local push notifications
- **timezone** (0.9.4): Timezone-aware alarm scheduling

### Data Persistence
- **hive** (2.2.3): Fast, lightweight NoSQL database
- **hive_flutter** (1.1.0): Flutter integration for Hive

### UI Components
- **video_player** (2.9.2): Video playback for onboarding
- **font_awesome_flutter** (10.7.0): 2000+ icons (brands, solid, regular)
- **url_launcher** (6.2.5): Open URLs, emails, and external apps

### Formatting & Utilities
- **intl** (0.19.0): Internationalization and date/time formatting

### Development Tools
- **hive_generator** (2.0.1): Code generation for Hive type adapters
- **build_runner** (2.4.8): Build system for code generation
- **flutter_launcher_icons** (0.13.1): Generate app icons for all platforms

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── common_widgets/
│   ├── app_gradient_background.dart   # Reusable gradient background
│   ├── gradient_button.dart           # Custom gradient button
│   └── primary_button.dart            # Primary button widget
├── constants/
│   ├── app_assets.dart                # Asset paths
│   ├── app_theme.dart                 # Theme configuration
│   └── font_awesome_icons_guide.dart  # Icon reference guide
├── helpers/
│   └── date_time_formatters.dart      # Date/time formatting utilities
├── features/
│   ├── about/
│   │   └── presentation/
│   │       └── about_screen.dart      # About & contact page
│   ├── alarm/
│   │   ├── data/
│   │   │   └── notification_service.dart  # Notification handling
│   │   ├── domain/
│   │   │   ├── alarm.dart             # Alarm model
│   │   │   └── alarm.g.dart           # Generated Hive adapter
│   │   └── presentation/
│   │       ├── alarm_controller.dart   # Alarm state management
│   │       ├── alarm_details_screen.dart  # Detailed alarm view & edit
│   │       ├── alarms_screen.dart      # Alarm list view
│   │       └── widgets/
│   │           ├── add_alarm_dialog.dart  # Add alarm modal
│   │           └── alarm_tile.dart     # Alarm list item
│   ├── location/
│   │   ├── data/
│   │   │   └── location_service.dart   # GPS location service
│   │   └── presentation/
│   │       └── location_screen.dart    # Location selection (legacy)
│   └── onboarding/
│       └── presentation/
│           └── onboarding_screen.dart  # First-time user onboarding
└── networks/                          # Network utilities (if any)

assets/
├── fonts/                             # Poppins font family
├── images/
│   ├── app_icon.png                   # Main app icon
│   └── app_icon_foreground.png        # Adaptive icon foreground
└── videos/                            # Onboarding videos

android/
├── app/
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml     # Android configuration & permissions
│           └── res/
│               ├── mipmap-*/           # App icons (all densities)
│               ├── drawable-*/         # Adaptive icon foreground
│               └── values/
│                   └── colors.xml      # Icon background color
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>= 3.8.1)
- Android Studio / Xcode / VS Code
- Android SDK (API 21+) for Android development
- Xcode 12+ for iOS development
- Android/iOS device or emulator

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

3. **Generate Hive type adapters**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Generate app icons** (optional)
   ```bash
   flutter pub run flutter_launcher_icons
   ```

5. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For release build
   flutter build apk --release    # Android
   flutter build ios --release    # iOS
   ```

### Required Permissions

#### Android (AndroidManifest.xml)
- `ACCESS_FINE_LOCATION`: GPS location access
- `ACCESS_COARSE_LOCATION`: Network-based location
- `ACCESS_BACKGROUND_LOCATION`: Background location (Android 10+)
- `POST_NOTIFICATIONS`: Show notifications (Android 13+)
- `SCHEDULE_EXACT_ALARM`: Schedule exact alarms (Android 12+)
- `USE_EXACT_ALARM`: Use exact alarm APIs (Android 12+)
- `INTERNET`: For maps and location services

#### iOS (Info.plist)
- `NSLocationWhenInUseUsageDescription`: Location permission description
- `NSLocationAlwaysAndWhenInUseUsageDescription`: Background location description

## 📖 Usage

### First-Time Setup

1. **Onboarding**: Watch the introductory video explaining how to use the app
2. **Permissions**: Grant location and notification permissions when prompted
3. **Welcome**: You'll be taken to the main alarms screen

### Creating an Alarm

1. **Tap the "+" button** at the bottom of the screen
2. **Select date and time** for the alarm
3. **Add details** (optional but recommended):
   - **Title**: Give your alarm a memorable name (e.g., "Office Stop")
   - **Location**: Choose how to add location:
     - **Use Current GPS Location**: Fetch your current coordinates
     - **Enter Place Name**: Type a location name (e.g., "Central Station")
     - **Enter GPS Coordinates**: Input exact latitude/longitude
   - **Description**: Add notes (e.g., "Get off at 3rd stop")
4. **Tap "Add Alarm"** to create

### Managing Alarms

#### View Alarms
- **Alarm List**: See all your alarms on the main screen
- **Display**: Shows title (or time), date, and enable/disable switch
- **Visual States**: Active alarms are brighter, disabled alarms are dimmed

#### Edit an Alarm
1. **Tap on any alarm** to open details
2. **Tap the Edit button** (✏️) in the top-right
3. **Modify fields**: Change time, title, location, or description
4. **Tap Save (✓)** to update
5. **Or tap Cancel** to discard changes

#### Enable/Disable Alarms
- **Quick Toggle**: Use the switch on the alarm tile
- **Details Toggle**: Use the switch on the alarm details page
- Disabled alarms won't trigger notifications

#### Delete an Alarm
- **Swipe Left** on any alarm in the list
- **Confirm deletion** in the dialog
- **Undo**: Tap "UNDO" in the snackbar to restore

### Location Features

The app offers three ways to add location to your alarms:

#### 1. Use Current GPS Location
- Fetches your real-time GPS coordinates
- Format: `Lat: XX.XXXX, Lng: XX.XXXX`
- Requires location permission

#### 2. Enter Place Name
- Type any location name manually
- Examples: "Office", "Home", "Grand Central Station"
- No internet required

#### 3. Enter GPS Coordinates
- Input exact latitude and longitude
- Useful for precise locations
- Format: Latitude (e.g., 23.8103), Longitude (e.g., 90.4125)

### About & Contact

- **Access**: Tap the info icon (ℹ️) next to "Selected Location"
- **Developer Info**: View app version, developer name, and role
- **Contact Links**: 
  - Email: Opens email client
  - GitHub: Opens developer's GitHub profile
  - Website: Opens developer's website
  - LinkedIn: Opens LinkedIn profile
  - Twitter: Opens Twitter profile

## 🎨 Design System

### Color Palette
```dart
// Gradient Background
Primary Gradient: #082257 → #0B0024

// Accent Colors
Purple Primary: #6A00FF
Purple Secondary: #9C00FF
Purple Light: #5200FF

// Alarm Tile
Background: #201A43
Border: White 10% opacity

// Text
Primary: White (#FFFFFF)
Secondary: White 70% opacity
Tertiary: White 60% opacity
```

### Typography
- **Font Family**: Poppins
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700), ExtraBold (800)

### Components

#### Alarm Tile
- **Layout**: Title/Time, Location/Secondary, Date, Switch
- **Size**: 328dp width × 56dp height
- **Border Radius**: 28dp (rounded ends)
- **Swipe to Delete**: Red background with delete icon

#### Buttons
- **Primary**: Gradient (#6A00FF → #9C00FF), rounded 12dp
- **Location Button**: Purple (#6A00FF), rounded 12dp, icon button
- **Switch**: White thumb, purple track (#5200FF), 37×20dp

#### Dialogs
- **Background**: Dark (#1A1A2E)
- **Border Radius**: 20dp
- **Accent**: Purple focus borders

## 🔧 Configuration

### App Icon
- **Path**: `assets/images/app_icon.png`
- **Adaptive Icon**: Background `#0B0024`, Foreground separate
- **Generated**: All densities (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)

### Onboarding Video
- **Path**: `assets/videos/`
- **Format**: MP4 recommended
- **Autoplay**: Yes
- **Safe Area**: Configurable

### Fonts
- **Location**: `assets/fonts/Poppins-*.ttf`
- **Variants**: Regular, Medium, SemiBold, Bold, ExtraBold

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

### Code Analysis
```bash
flutter analyze
```

### Check for Outdated Packages
```bash
flutter pub outdated
```

## 📦 Building for Production

### Android APK
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APKs by ABI (smaller size)
flutter build apk --split-per-abi
```

### Android App Bundle (AAB)
```bash
flutter build appbundle --release
```

### iOS
```bash
# Debug
flutter build ios --debug

# Release
flutter build ios --release
```

## 🐛 Troubleshooting

### Common Issues

#### "Exact alarms are not permitted" Error
- **Solution**: Permissions added in AndroidManifest.xml (`SCHEDULE_EXACT_ALARM`, `USE_EXACT_ALARM`)
- **Android 12+**: User may need to grant permission in Settings → Apps → Smart Travel Alarm → Alarms & reminders

#### Location Permission Denied
- **Solution**: Grant location permission in app settings
- **Android**: Settings → Apps → Smart Travel Alarm → Permissions → Location
- **iOS**: Settings → Privacy → Location Services → Smart Travel Alarm

#### IDE Shows Red Errors But App Builds
- **Cause**: Stale IDE cache
- **Solution**: 
  - Restart Dart Analysis Server
  - Invalidate Caches and Restart IDE
  - Run `flutter clean && flutter pub get`

#### Notifications Not Showing
- **Check**: Notification permission granted (Android 13+)
- **Check**: Battery optimization disabled for the app
- **Check**: Exact alarm permission granted (Android 12+)

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Run `flutter analyze` before committing
- Format code with `dart format .`

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**M Islam**  
Full Stack Developer

- **Email**: [mislam.dev@gmail.com](mailto:mislam.dev@gmail.com)
- **GitHub**: [@mislamdev](https://github.com/mislamdev)
- **LinkedIn**: [linkedin.com/in/mislamdev](https://linkedin.com/in/mislamdev)
- **Twitter**: [@mislamdev](https://twitter.com/mislamdev)
- **Website**: [mislam.dev](https://mislam.dev)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for Poppins typography
- Riverpod community for state management
- Font Awesome for icon library
- All open source contributors

## 📊 Version History

### Version 2.1.0 (Current)
- ✨ Added inline alarm editing
- ✨ Added About & Contact page
- ✨ Implemented swipe-to-delete with undo
- ✨ Added 2000+ Font Awesome icons
- ✨ Multiple location input methods (GPS, place name, coordinates)
- ✨ Enhanced alarm details page
- ✨ Android 12+ exact alarm support
- 🐛 Fixed edit mode state management
- 🎨 Updated gradient ratio to 70:30
- 🎨 Improved alarm tile layout

### Version 2.0.0
- 🚀 Initial release
- ⏰ Basic alarm creation and management
- 📍 GPS location support
- 🎬 Video onboarding
- 💾 Hive database persistence

---

Made with ❤️ using Flutter

**Note**: This is a personal project. For commercial use, please contact the developer.
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
