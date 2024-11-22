import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:safasughar/features/map/providers/map_provider.dart';
import 'package:safasughar/features/map/views/widgets/map_layers/map_markers_layer.dart';
import 'package:safasughar/features/map/views/widgets/map_layers/map_tile_layer.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView>
    with TickerProviderStateMixin {
  late AnimatedMapController _animatedMapController;

  @override
  void initState() {
    super.initState();
    _animatedMapController = AnimatedMapController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(providerOfMap.notifier)
          .updateMapController(_animatedMapController),
    );
  }

  @override
  void dispose() {
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _animatedMapController.mapController,
      options: MapOptions(
        initialCenter: const LatLng(
          27.6887045,
          85.2485811,
        ),
        onTap: _onMapTap,
      ),
      children: const [
        MapTileLayer(),
        MapMarkersLayer(),
      ],
    );
  }

  void _onMapTap(final TapPosition tapPosition, final LatLng point) {
    FocusScope.of(context).unfocus();
    ref.read(providerOfMap.notifier).updateSelectedLocation(null);
  }
}
