import 'package:hive/hive.dart';

part 'alarm.g.dart';

@HiveType(typeId: 0)
class Alarm {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime scheduledAt;

  @HiveField(2)
  final bool enabled;

  @HiveField(3)
  final String? title;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String? location;

  const Alarm({
    required this.id,
    required this.scheduledAt,
    required this.enabled,
    this.title,
    this.description,
    this.location,
  });

  Alarm copyWith({
    DateTime? scheduledAt,
    bool? enabled,
    String? title,
    String? description,
    String? location,
  }) {
    return Alarm(
      id: id,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      enabled: enabled ?? this.enabled,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
    );
  }
}
