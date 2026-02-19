import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_gradient_background.dart';
import '../../../common_widgets/gradient_button.dart';
import '../../../helpers/date_time_formatters.dart';
import 'alarm_controller.dart';
import 'widgets/alarm_tile.dart';

class AlarmsScreen extends ConsumerWidget {
  const AlarmsScreen({super.key});

  Future<DateTime?> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      initialDate: now,
    );
    if (date == null) return null;

    if (!context.mounted) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now.add(const Duration(minutes: 1))),
    );
    if (time == null) return null;

    final dt = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    if (dt.isBefore(DateTime.now())) return null;

    return dt;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarms = ref.watch(alarmsControllerProvider);
    final locationLabel = ref.watch(selectedLocationProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),

      // ✅ Styled FAB but same behavior as before
      floatingActionButton: GestureDetector(
        onTap: () async {
          final dt = await _pickDateTime(context);
          if (dt == null) return;

          await ref.read(alarmsControllerProvider.notifier).addAlarm(dt);

          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Alarm added')));
          }
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF6A00FF), Color(0xFF9C00FF)],
            ),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),

      body: AppGradientBackground(
        useSafeArea: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selected Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Location "pill" input look - tappable to open map picker
              GestureDetector(
                onTap: () async {
                  // TODO: Open map picker to select location
                  // For now, navigate to location screen
                  Navigator.of(context).pushReplacementNamed('/location');
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white.withValues(alpha: 0.75),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          locationLabel ?? 'Add your location',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.white.withValues(alpha: 0.5),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              GradientButton(
                text: "Use Current Location",
                icon: Icons.location_on_outlined,
                iconOnRight: true,
                outlined: true,
                onTap: () async {
                  try {
                    // Show loading indicator
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fetching current location...'),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Fetch current location using the controller
                    await ref
                        .read(alarmsControllerProvider.notifier)
                        .fetchCurrentLocation();

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Location updated successfully'),
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${e.toString()}'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  }
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Alarms',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 14),

              Expanded(
                child: alarms.isEmpty
                    ? Center(
                        child: Text(
                          'No alarms yet.\nTap + to add one.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 120),
                        itemCount: alarms.length,
                        itemBuilder: (_, i) {
                          final alarm = alarms[i];
                          return Theme(
                            // Make AlarmTile "glass" consistent even if it uses default theme
                            data: Theme.of(context).copyWith(
                              switchTheme: SwitchThemeData(
                                thumbColor: WidgetStateProperty.resolveWith((
                                  s,
                                ) {
                                  if (s.contains(WidgetState.selected)) {
                                    return const Color(0xFF6A00FF);
                                  }
                                  return Colors.white.withValues(alpha: 0.65);
                                }),
                                trackColor: WidgetStateProperty.resolveWith((
                                  s,
                                ) {
                                  if (s.contains(WidgetState.selected)) {
                                    return const Color(
                                      0xFF9C00FF,
                                    ).withValues(alpha: 0.5);
                                  }
                                  return Colors.white.withValues(alpha: 0.18);
                                }),
                              ),
                            ),
                            child: Opacity(
                              opacity: alarm.enabled ? 1 : 0.75,
                              child: AlarmTile(
                                alarm: alarm,
                                onToggle: (v) => ref
                                    .read(alarmsControllerProvider.notifier)
                                    .toggleAlarm(alarm.id, v),
                                onDelete: () async {
                                  final shouldDelete = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Alarm'),
                                      content: Text(
                                        'Are you sure you want to delete the alarm scheduled for ${DateTimeFormatters.time(alarm.scheduledAt)} on ${DateTimeFormatters.date(alarm.scheduledAt)}?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.red,
                                          ),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (shouldDelete == true) {
                                    ref
                                        .read(alarmsControllerProvider.notifier)
                                        .deleteAlarm(alarm.id);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
