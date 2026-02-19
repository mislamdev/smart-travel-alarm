import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_gradient_background.dart';
import '../../../common_widgets/gradient_button.dart';
import '../../../main.dart';
import '../../alarm/presentation/alarm_controller.dart';
import 'location_controller.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationControllerProvider);

    return Scaffold(
      body: AppGradientBackground(
        useSafeArea: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const Text(
                "Welcome! Your Smart\nTravel Alarm",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Stay on schedule and enjoy every\nmoment of your journey.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.35,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),

              const SizedBox(height: 60),

              // Image area (same layout as your screenshot)
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.asset(
                  "assets/images/location_page.jpg",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Loading/Error UI (non-blocking)
              const SizedBox(height: 18),
              if (state.isLoading)
                const SizedBox(
                  width: double.infinity,
                  child: LinearProgressIndicator(minHeight: 3),
                ),
              if (state.hasError) ...[
                const SizedBox(height: 10),
                Text(
                  "${state.error}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent.withValues(alpha: 0.9),
                    fontSize: 13,
                  ),
                ),
              ],

              const Spacer(),

              // ✅ WORKING: Use Current Location -> fetch -> set provider -> go alarms
              GradientButton(
                text: "Use Current Location",
                icon: Icons.location_on_outlined,
                iconOnRight: true,
                outlined: true,
                onTap: state.isLoading
                    ? () {}
                    : () async {
                  try {
                    final loc = await ref
                        .read(locationControllerProvider.notifier)
                        .fetch();

                    // store for alarms screen display
                    ref.read(selectedLocationProvider.notifier).state =
                        loc.label;

                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.alarms,
                      );
                    }
                  } catch (_) {
                    // Error already exposed by provider; keep silent here
                  }
                },
              ),

              const SizedBox(height: 16),

              // ✅ WORKING: Home -> go alarms directly
              GradientButton(
                text: "Home",
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.alarms);
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}