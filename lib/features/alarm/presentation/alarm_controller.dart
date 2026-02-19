import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/location/data/location_service.dart';
import '../data/notification_service.dart';
import '../domain/alarm.dart';

final selectedLocationProvider = StateProvider<String?>((ref) => null);

final alarmsControllerProvider =
    StateNotifierProvider<AlarmsController, List<Alarm>>(
      (ref) => AlarmsController(ref)..loadAlarms(),
    );

class AlarmsController extends StateNotifier<List<Alarm>> {
  AlarmsController(this._ref) : super(const []);

  final Ref _ref;
  final _locationService = LocationService();
  final _alarmsBox = Hive.box<Alarm>('alarms');

  // Load alarms from Hive on initialization
  void loadAlarms() {
    final alarms = _alarmsBox.values.toList();
    alarms.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    state = alarms;
  }

  int _nextId() {
    // In production: use incrementing id or UUID->hash.
    return Random().nextInt(1 << 30);
  }

  Future<void> fetchCurrentLocation() async {
    final result = await _locationService.getCurrentLocation();
    // Update the selected location provider
    final locationString =
        'Lat: ${result.latitude.toStringAsFixed(4)}, '
        'Lng: ${result.longitude.toStringAsFixed(4)}';

    _ref.read(selectedLocationProvider.notifier).state = locationString;
  }

  Future<void> addAlarm(
    DateTime dt, {
    String? title,
    String? description,
    String? location,
  }) async {
    final alarm = Alarm(
      id: _nextId(),
      scheduledAt: dt,
      enabled: true,
      title: title,
      description: description,
      location: location,
    );

    // Save to Hive
    await _alarmsBox.put(alarm.id, alarm);

    // Update state
    state = [...state, alarm]
      ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    await NotificationService.instance.scheduleAlarm(
      id: alarm.id,
      dateTime: alarm.scheduledAt,
      title: title ?? 'Travel Alarm',
      body: description ?? "It's time! (${alarm.scheduledAt})",
    );
  }

  Future<void> toggleAlarm(int id, bool enabled) async {
    final idx = state.indexWhere((a) => a.id == id);
    if (idx == -1) return;

    final updated = state[idx].copyWith(enabled: enabled);

    // Update in Hive
    await _alarmsBox.put(id, updated);

    // Update state
    final newList = [...state];
    newList[idx] = updated;
    state = newList;

    if (!enabled) {
      await NotificationService.instance.cancel(id);
    } else {
      await NotificationService.instance.scheduleAlarm(
        id: id,
        dateTime: updated.scheduledAt,
        title: 'Travel Alarm',
        body: "It's time! (${updated.scheduledAt})",
      );
    }
  }

  Future<void> deleteAlarm(int id) async {
    // Delete from Hive
    await _alarmsBox.delete(id);

    // Update state
    state = state.where((a) => a.id != id).toList();

    await NotificationService.instance.cancel(id);
  }

  Future<void> updateAlarm(Alarm updatedAlarm) async {
    final idx = state.indexWhere((a) => a.id == updatedAlarm.id);
    if (idx == -1) return;

    // Update in Hive
    await _alarmsBox.put(updatedAlarm.id, updatedAlarm);

    // Update state
    final newList = [...state];
    newList[idx] = updatedAlarm;
    state = newList..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    // Cancel old notification and reschedule if enabled
    await NotificationService.instance.cancel(updatedAlarm.id);
    if (updatedAlarm.enabled) {
      await NotificationService.instance.scheduleAlarm(
        id: updatedAlarm.id,
        dateTime: updatedAlarm.scheduledAt,
        title: updatedAlarm.title ?? 'Travel Alarm',
        body:
            updatedAlarm.description ??
            "It's time! (${updatedAlarm.scheduledAt})",
      );
    }
  }

  Future<void> restoreAlarm(Alarm alarm) async {
    // Restore to Hive
    await _alarmsBox.put(alarm.id, alarm);

    // Update state
    state = [...state, alarm]
      ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    // Reschedule notification if alarm was enabled
    if (alarm.enabled) {
      await NotificationService.instance.scheduleAlarm(
        id: alarm.id,
        dateTime: alarm.scheduledAt,
        title: 'Travel Alarm',
        body: "It's time! (${alarm.scheduledAt})",
      );
    }
  }
}
