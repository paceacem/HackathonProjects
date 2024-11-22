import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/map/providers/map_provider.dart';
import 'package:safasughar/features/map/views/providers/map_search_results_provider.dart';
import 'package:safasughar/features/map/views/widgets/map_result_tile.dart';
import 'package:safasughar/features/map/views/widgets/map_view.dart';
import 'package:safasughar/features/shared/views/widgets/searchbar.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(providerOfMapSearchResults.select((value) => null));
    ref.watch(providerOfMap.select((value) => null));

    return const Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: MapView(),
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            child: SafeArea(
              child: Searchbar(),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 20.0,
            right: 20.0,
            child: SafeArea(
              child: MapResultTile(),
            ),
          ),
        ],
      ),
    );
  }
}
