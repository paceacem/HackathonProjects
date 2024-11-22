import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/demo_data.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

final providerOfMapSearchResults =
    StateNotifierProvider.autoDispose<MapSearchResultsProvider, List<Location>>(
  (ref) => MapSearchResultsProvider(),
);

class MapSearchResultsProvider extends StateNotifier<List<Location>> {
  MapSearchResultsProvider() : super(<Location>[]) {
    state = disposalLocations;
  }

  void filterResults(final String searchString) {
    if (searchString.isEmpty) {
      state = disposalLocations;
      return;
    }

    state = disposalLocations.where((element) {
      final titles = element.title.toLowerCase().split(' ');
      final addresses = element.address.toLowerCase().split(' ');
      return titles
              .any((element) => element.contains(searchString.toLowerCase())) ||
          addresses
              .any((element) => element.contains(searchString.toLowerCase()));
    }).toList();
  }
}
