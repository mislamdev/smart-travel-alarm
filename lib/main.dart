import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/app_theme.dart';
import 'features/alarm/data/notification_service.dart';
import 'features/alarm/presentation/alarms_screen.dart';
import 'features/location/presentation/location_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init notifications + timezone (required for scheduled notifications)
  await NotificationService.instance.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Travel Alarm',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (_) => const OnboardingScreen(),
        AppRoutes.location: (_) => const LocationScreen(),
        AppRoutes.alarms: (_) => const AlarmsScreen(),
      },
    );
  }
}

class AppRoutes {
  static const onboarding = '/onboarding';
  static const location = '/location';
  static const alarms = '/alarms';
}
