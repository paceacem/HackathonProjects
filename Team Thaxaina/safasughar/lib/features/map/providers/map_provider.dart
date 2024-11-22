import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:safasughar/features/map/providers/states/map_provider_state.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

final providerOfMap =
    StateNotifierProvider.autoDispose<MapProvider, MapProviderState>((ref) {
  return MapProvider(
    ref: ref,
    state: const MapProviderState(),
  );
});

class MapProvider extends StateNotifier<MapProviderState> {
  MapProvider({
    required final Ref ref,
    required final MapProviderState state,
  }) : super(state);

  void moveMapToLocation({
    required final LatLng destination,
  }) {
    state.animatedMapController?.animateTo(
      dest: destination,
    );
  }

  void updateMapController(final AnimatedMapController controller) {
    state = state.copyWith(
      animatedMapController: controller,
    );
  }

  void updateSelectedLocation(final Location? location) {
    state = state.copyWith(
      selectedLocation: location,
    );
  }
}
