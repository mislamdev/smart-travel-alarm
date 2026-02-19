import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_gradient_background.dart';
import '../../../helpers/date_time_formatters.dart';
import 'alarm_controller.dart';
import 'alarm_details_screen.dart';
import 'widgets/add_alarm_dialog.dart';
import 'widgets/alarm_tile.dart';

class AlarmsScreen extends ConsumerWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarms = ref.watch(alarmsControllerProvider);
    final locationLabel = ref.watch(selectedLocationProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,

      // ✅ Styled FAB but same behavior as before
      floatingActionButton: GestureDetector(
        onTap: () async {
          final result = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) => const AddAlarmDialog(),
          );

          if (result == null) return;

          await ref
              .read(alarmsControllerProvider.notifier)
              .addAlarm(
                result['dateTime'] as DateTime,
                title: result['title'] as String?,
                location: result['location'] as String?,
                description: result['description'] as String?,
              );

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
              // Selected Location title with About button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selected Location',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/about');
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                    tooltip: 'About',
                  ),
                ],
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
                            child: Dismissible(
                              key: Key(alarm.id.toString()),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              confirmDismiss: (direction) async {
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
                                return shouldDelete ?? false;
                              },
                              onDismissed: (direction) {
                                // Store the deleted alarm for undo functionality
                                final deletedAlarm = alarm;

                                ref
                                    .read(alarmsControllerProvider.notifier)
                                    .deleteAlarm(alarm.id);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Alarm deleted'),
                                    duration: const Duration(seconds: 4),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        // Restore the deleted alarm
                                        ref
                                            .read(
                                              alarmsControllerProvider.notifier,
                                            )
                                            .restoreAlarm(deletedAlarm);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Opacity(
                                opacity: alarm.enabled ? 1 : 0.75,
                                child: AlarmTile(
                                  alarm: alarm,
                                  onToggle: (v) => ref
                                      .read(alarmsControllerProvider.notifier)
                                      .toggleAlarm(alarm.id, v),
                                  onDelete: () {},
                                  // No longer used but keeping for compatibility
                                  onTap: () {
                                    // Navigate to alarm details screen
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AlarmDetailsScreen(alarm: alarm),
                                      ),
                                    );
                                  },
                                ),
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
