# Changelog

All notable changes to Smart Travel Alarm will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2026-02-20

### Added
- **Inline Alarm Editing** - Edit alarms directly on the details page without opening new windows
- **Enhanced Location Input** - Three methods to add location:
  - Use Current GPS Location (fetch real-time coordinates)
  - Enter Place Name (manual text entry)
  - Enter GPS Coordinates (exact latitude/longitude input)
- **Location Options Modal** - Beautiful bottom sheet with three location input methods
- **Swipe to Delete** - Swipe left gesture to delete alarms with confirmation
- **Undo Delete** - 4-second window to restore accidentally deleted alarms
- **About & Contact Page** - Developer information with clickable social media links
- **Font Awesome Icons** - 2000+ professional icons including brand logos
- **Icon Reference Guide** - Complete guide at `lib/constants/font_awesome_icons_guide.dart`
- **URL Launcher Integration** - Direct links to email, GitHub, LinkedIn, Twitter, website
- **Android 12+ Exact Alarm Support** - Added `SCHEDULE_EXACT_ALARM` and `USE_EXACT_ALARM` permissions
- **Alarm Details Fields** - Title, description, and location fields for rich alarm information
- **Location Button** - Purple button beside location field for quick access to options
- **GPS Coordinates Dialog** - Dedicated dialog for latitude/longitude input

### Changed
- **Alarm Tile Layout** - Time and date now displayed in single line
- **Smart Display Logic** - Shows title OR time prominently based on available data
- **About Button Position** - Moved beside "Selected Location" instead of separate menu
- **Gradient Ratio** - Updated background gradient to 70:30 ratio
- **Switch Styling** - Consistent white thumb color in both ON and OFF states
- **Edit Mode UI** - Purple borders indicate editable fields
- **AppBar Actions** - Context-aware buttons (Edit/Delete in view mode, Cancel/Save in edit mode)

### Fixed
- **Edit Mode State Management** - Fixed edit mode not exiting after save
- **Data Display After Save** - Fixed updated data not showing after saving changes
- **Alarm Update Logic** - Fixed alarm getting new ID on update (now maintains original ID)
- **Toggle Button Sizing** - Fixed switch shrinking in OFF state and enlarging in ON state
- **Exact Alarms Permission** - Fixed "exact_alarms_not_permitted" error on Android 12+
- **State Synchronization** - Improved state management with local `_currentAlarm` tracking
- **Database Updates** - Proper `updateAlarm()` method that preserves alarm ID
- **Notification Rescheduling** - Correctly reschedules notifications after alarm update

### Technical
- Updated `flutter_riverpod` to 2.6.1
- Added `font_awesome_flutter` 10.7.0
- Added `url_launcher` 6.2.5
- Updated Alarm model with new fields (title, description, location)
- Regenerated Hive type adapters
- Enhanced notification service with exact alarm support
- Improved alarm controller with `updateAlarm()` and `restoreAlarm()` methods

### Documentation
- Updated README.md with comprehensive documentation
- Added RELEASE_NOTES.md with detailed release information
- Added GITHUB_RELEASE.md for GitHub release page
- Added CHANGELOG.md (this file)
- Updated feature list with 25+ documented features
- Added troubleshooting section
- Added developer information and contact links

## [2.0.0] - 2026-01-15

### Added
- Initial public release
- **Alarm Management** - Create, view, enable/disable, and delete alarms
- **GPS Location Support** - Fetch current location for travel alarms
- **Video Onboarding** - Three-slide onboarding with video playback
- **Hive Database** - Local persistent storage for alarms
- **Flutter Local Notifications** - Timezone-aware alarm notifications
- **Gradient UI** - Beautiful purple gradient interface
- **Poppins Typography** - Custom font family throughout the app
- **Riverpod State Management** - Reactive state management
- **Location Services** - GPS location fetching with permission handling
- **Custom Widgets** - Gradient buttons, background, and UI components

### Technical
- Flutter SDK 3.8.1
- Dart SDK 3.8.1
- Platform support: Android (API 21+), iOS (12.0+), Linux (dev/testing)
- Dependencies: geolocator, flutter_local_notifications, hive, video_player, timezone
- Feature-first architecture with clean separation of concerns
- Mock implementations for Linux development

### Documentation
- Initial README.md
- Project structure documentation
- Setup and installation instructions
- Basic usage guide

## [1.0.0-beta] - 2025-12

### Added
- Beta release for testing
- Core alarm functionality
- Basic location services
- Simple onboarding flow

### Technical
- Initial Flutter setup
- Basic state management
- Simple UI components

---

## Version History Summary

| Version | Release Date | Major Changes |
|---------|-------------|---------------|
| 2.1.0 | 2026-02-20 | Enhanced editing, location options, swipe-to-delete, Font Awesome icons |
| 2.0.0 | 2026-01-15 | Initial release with core alarm and location features |
| 1.0.0-beta | 2025-12 | Beta testing version |

---

## Upgrade Guide

### From 2.0.0 to 2.1.0

1. **Update the app** from store or install new APK/IPA
2. **Grant new permissions** when prompted:
   - Exact alarms permission (Android 12+)
3. **Existing data** - All alarms automatically migrated
4. **New features** - Available immediately after update

No manual migration required. All existing alarms remain functional.

---

## Links

- **Repository:** https://github.com/mislamdev/smart_travel_alarm
- **Issues:** https://github.com/mislamdev/smart_travel_alarm/issues
- **Releases:** https://github.com/mislamdev/smart_travel_alarm/releases

---

**Maintained by:** M Islam ([@mislamdev](https://github.com/mislamdev))

