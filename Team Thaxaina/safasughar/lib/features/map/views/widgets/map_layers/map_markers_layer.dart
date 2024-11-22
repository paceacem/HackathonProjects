import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/demo_data.dart';
import 'package:safasughar/features/map/providers/map_provider.dart';
import 'package:safasughar/features/map/views/widgets/map_marker.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

class MapMarkersLayer extends ConsumerStatefulWidget {
  const MapMarkersLayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapMarkersLayerState();
}

class _MapMarkersLayerState extends ConsumerState<MapMarkersLayer> {
  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers:
          disposalLocations.map((element) => _markerWidget(element)).toList(),
    );
  }

  Marker _markerWidget(final Location location) {
    return Marker(
      point: location.point,
      height: 60.0,
      width: 50.0,
      rotate: true,
      alignment: Alignment.topCenter,
      child: Consumer(builder: (context, ref, child) {
        final isSelected = ref.watch(
          providerOfMap.select(
            (value) => value.selectedLocation == location,
          ),
        );
        return WasteDisposalMarker(
          fill: location.fill,
          color: isSelected ? Colors.green : Colors.blue,
          onTap: () {
            ref.read(providerOfMap.notifier)
              ..updateSelectedLocation(location)
              ..moveMapToLocation(destination: location.point);
          },
        );
      }),
    );
  }
}
