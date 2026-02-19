import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/app_theme.dart';
import 'features/about/presentation/about_screen.dart';
import 'features/alarm/data/notification_service.dart';
import 'features/alarm/domain/alarm.dart';
import 'features/alarm/presentation/alarms_screen.dart';
import 'features/location/presentation/location_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(AlarmAdapter());

  // Open boxes
  await Hive.openBox<Alarm>('alarms');
  await Hive.openBox('settings');

  // Init notifications + timezone (required for scheduled notifications)
  await NotificationService.instance.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if onboarding is completed
    final settingsBox = Hive.box('settings');
    final onboardingCompleted = settingsBox.get(
      'onboarding_completed',
      defaultValue: false,
    );

    return MaterialApp(
      title: 'Smart Travel Alarm',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: onboardingCompleted
          ? AppRoutes.alarms
          : AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (_) => const OnboardingScreen(),
        AppRoutes.location: (_) => const LocationScreen(),
        AppRoutes.alarms: (_) => const AlarmsScreen(),
        AppRoutes.about: (_) => const AboutScreen(),
      },
    );
  }
}

class AppRoutes {
  static const onboarding = '/onboarding';
  static const location = '/location';
  static const alarms = '/alarms';
  static const about = '/about';
}
