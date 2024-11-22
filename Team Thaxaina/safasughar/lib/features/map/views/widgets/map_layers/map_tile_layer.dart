import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapTileLayer extends ConsumerStatefulWidget {
  const MapTileLayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapTileLayerState();
}

class _MapTileLayerState extends ConsumerState<MapTileLayer> {
  late Dio _dio;

  @override
  void initState() {
    super.initState();
    _dio = Dio(
      BaseOptions(
        headers: Map<String, String>.from(
          // {"Authorization": "Stadia-Auth 815e7d38-9874-42b2-a4db-07a991a02bc4"},
          {"Authorization": "Stadia-Auth 426e21c1-63ae-47c6-9853-eb38e77cb497"},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate:
          'https://tiles.stadiamaps.com/tiles/outdoors/{z}/{x}/{y}{r}.png',
      retinaMode: RetinaMode.isHighDensity(context),
      tileProvider: CancellableNetworkTileProvider(
        dioClient: _dio,
      ),
    );
  }
}
