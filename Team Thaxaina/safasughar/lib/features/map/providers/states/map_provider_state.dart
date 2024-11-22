import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

part 'map_provider_state.freezed.dart';

@freezed
class MapProviderState with _$MapProviderState {
  const factory MapProviderState({
    final AnimatedMapController? animatedMapController,
    final Location? selectedLocation,
  }) = _MapProviderState;
}
