# v2.1.0 - Enhanced Alarm Management & Location Features 🎉

**Release Date:** February 20, 2026  
**Build:** 2.1.0 (210)

## 🎯 What's New

### ✨ Major Features

#### **Inline Alarm Editing**
Edit alarm details directly on the details page without opening new windows. Real-time updates with smooth view/edit mode transitions.

#### **Enhanced Location Input (3 Methods)**
- 📍 **Use Current GPS Location** - Fetch real-time coordinates
- ✏️ **Enter Place Name** - Type location manually (e.g., "Office")
- 🗺️ **Enter GPS Coordinates** - Input exact latitude/longitude

Beautiful bottom sheet modal with three intuitive options.

#### **Swipe to Delete with Undo**
- Swipe left on any alarm to delete
- Confirmation dialog prevents accidents
- 4-second undo window to restore deleted alarms
- Red background animation with delete icon

#### **About & Contact Page**
- Developer information section
- Direct contact links (Email, GitHub, Website, LinkedIn, Twitter)
- Click-to-open URL launcher integration
- Font Awesome icons for professional look

#### **2000+ Font Awesome Icons**
Complete Font Awesome integration with brand logos (Google, Facebook, LinkedIn, GitHub, etc.) and solid/regular icons.

### 🔧 Technical Improvements

- ✅ **Android 12+ Exact Alarm Support** - Added required permissions
- ✅ **Fixed Edit Mode State Management** - Proper state synchronization
- ✅ **Improved Database Operations** - Maintains alarm IDs during updates
- ✅ **Enhanced UI Components** - Redesigned alarm tiles with smart display logic

### 🎨 UI/UX Updates

- **Alarm Tile Redesign:** Time and date in single line, title or time prominently displayed
- **Gradient Update:** 70:30 ratio for better visual balance
- **About Button:** Moved beside "Selected Location" for better UX
- **Consistent Switch Styling:** Fixed toggle button sizing across states

### 🐛 Bug Fixes

1. Fixed edit mode not exiting after save
2. Fixed updated data not displaying after save
3. Fixed alarm getting new ID on update
4. Fixed toggle button size inconsistency
5. Fixed "exact alarms not permitted" error on Android 12+

### 📦 New Dependencies

- `font_awesome_flutter` (10.7.0) - 2000+ professional icons
- `url_launcher` (6.2.5) - External link support

## 📥 Downloads

### Android APK
- **Universal APK:** `smart_travel_alarm-v2.1.0.apk` (25 MB)
- **Split APKs:** Available for arm64-v8a, armeabi-v7a, x86_64 (17-19 MB each)
- **Minimum Android:** 5.0 (API 21)
- **Target Android:** 14 (API 34)

### iOS
- **Minimum iOS:** 12.0
- **Target iOS:** 17.0

## 🔄 Upgrade Notes

### From v2.0.0 → v2.1.0
- New Android 12+ permissions will be requested
- Existing alarms automatically migrated to new schema
- All previous alarms remain functional
- New features available immediately

## ⚠️ Important Notes

### Required Permissions (Android)
- `ACCESS_FINE_LOCATION` - GPS location
- `ACCESS_COARSE_LOCATION` - Network location
- `POST_NOTIFICATIONS` - Notifications (Android 13+)
- `SCHEDULE_EXACT_ALARM` - Exact alarms (Android 12+)
- `USE_EXACT_ALARM` - Exact alarm APIs (Android 12+)

### For Developers
```bash
git clone https://github.com/mislamdev/smart_travel_alarm.git
cd smart_travel_alarm
git checkout v2.1.0
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## 📊 What's Changed

**Full Changelog:** [v2.0.0...v2.1.0](https://github.com/mislamdev/smart_travel_alarm/compare/v2.0.0...v2.1.0)

## 🙏 Acknowledgments

Thanks to all contributors and testers who made this release possible!

## 📞 Support

- **Issues:** [Report bugs](https://github.com/mislamdev/smart_travel_alarm/issues)
- **Email:** mislam.dev@gmail.com
- **Website:** [mislam.dev](https://mislam.dev)

---

Made with ❤️ using Flutter

**Note:** This is a personal project. For commercial use, please contact the developer.

