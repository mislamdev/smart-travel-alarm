import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/location/data/location_service.dart';
import '../data/notification_service.dart';
import '../domain/alarm.dart';

final selectedLocationProvider = StateProvider<String?>((ref) => null);

final alarmsControllerProvider =
    StateNotifierProvider<AlarmsController, List<Alarm>>(
      (ref) => AlarmsController(ref),
    );

class AlarmsController extends StateNotifier<List<Alarm>> {
  AlarmsController(this._ref) : super(const []);

  final Ref _ref;
  final _locationService = LocationService();

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

  Future<void> addAlarm(DateTime dt) async {
    final alarm = Alarm(id: _nextId(), scheduledAt: dt, enabled: true);
    state = [...state, alarm]
      ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    await NotificationService.instance.scheduleAlarm(
      id: alarm.id,
      dateTime: alarm.scheduledAt,
      title: 'Travel Alarm',
      body: 'It’s time! (${alarm.scheduledAt})',
    );
  }

  Future<void> toggleAlarm(int id, bool enabled) async {
    final idx = state.indexWhere((a) => a.id == id);
    if (idx == -1) return;

    final updated = state[idx].copyWith(enabled: enabled);
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
        body: 'It’s time! (${updated.scheduledAt})',
      );
    }
  }

  Future<void> deleteAlarm(int id) async {
    state = state.where((a) => a.id != id).toList();
    await NotificationService.instance.cancel(id);
  }
}
