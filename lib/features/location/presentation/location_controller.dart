import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/location_service.dart';
import '../domain/location_result.dart';

final locationServiceProvider = Provider<LocationService>(
  (ref) => LocationService(),
);

final locationControllerProvider =
    StateNotifierProvider<LocationController, AsyncValue<LocationResult?>>(
      (ref) => LocationController(ref.read(locationServiceProvider)),
    );

class LocationController extends StateNotifier<AsyncValue<LocationResult?>> {
  final LocationService _service;

  LocationController(this._service) : super(const AsyncValue.data(null));

  Future<LocationResult> fetch() async {
    state = const AsyncValue.loading();
    try {
      final result = await _service.getCurrentLocation();
      state = AsyncValue.data(result);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
