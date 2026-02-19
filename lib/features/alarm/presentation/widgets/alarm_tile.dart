import 'package:flutter/material.dart';

import '../../../../helpers/date_time_formatters.dart';
import '../../domain/alarm.dart';

class AlarmTile extends StatelessWidget {
  final Alarm alarm;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;
  final VoidCallback? onTap;

  const AlarmTile({
    super.key,
    required this.alarm,
    required this.onToggle,
    required this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF201A43),
          // Purple background from XML
          borderRadius: BorderRadius.circular(28),
          // Rounded corners (56/2 = 28)
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Left side - Title/Time and optional location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Show title if available, otherwise show time
                  Text(
                    alarm.title?.isNotEmpty == true
                        ? alarm.title!
                        : DateTimeFormatters.time(alarm.scheduledAt),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Show location or time (if title is shown)
                  if ((alarm.location?.isNotEmpty == true) ||
                      (alarm.title?.isNotEmpty == true)) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (alarm.location?.isNotEmpty == true) ...[
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              alarm.location!,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ] else if (alarm.title?.isNotEmpty == true) ...[
                          // If title is shown but no location, display time here
                          Text(
                            DateTimeFormatters.time(alarm.scheduledAt),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Date right-aligned next to switch
            Text(
              DateTimeFormatters.date(alarm.scheduledAt),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(width: 12),

            // Custom styled switch matching XML
            Transform.scale(
              scale: 0.8, // Scale down to match 37x20 dimensions
              child: Switch(
                value: alarm.enabled,
                onChanged: onToggle,
                activeColor: Colors.white,
                // White thumb when ON
                activeTrackColor: const Color(0xFF5200FF),
                // Purple track
                inactiveThumbColor: Colors.white,
                // White thumb when OFF
                inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
