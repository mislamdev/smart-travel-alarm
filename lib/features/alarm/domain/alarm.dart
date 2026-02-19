class Alarm {
  final int id;
  final DateTime scheduledAt;
  final bool enabled;

  const Alarm({
    required this.id,
    required this.scheduledAt,
    required this.enabled,
  });

  Alarm copyWith({DateTime? scheduledAt, bool? enabled}) {
    return Alarm(
      id: id,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      enabled: enabled ?? this.enabled,
    );
  }
}
