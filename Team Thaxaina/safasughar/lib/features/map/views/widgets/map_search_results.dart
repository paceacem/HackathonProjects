import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/map/views/providers/map_search_results_provider.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

class MapSearchResults extends ConsumerStatefulWidget {
  const MapSearchResults({
    super.key,
    this.onPressedMapResult,
  });

  final void Function(Location)? onPressedMapResult;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapSearchResultsState();
}

class _MapSearchResultsState extends ConsumerState<MapSearchResults> {
  @override
  Widget build(BuildContext context) {
    final results = ref.watch(providerOfMapSearchResults);

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: results.isEmpty
            ? _emptyBuilder()
            : SizedBox(
                height: 250.0,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return _searchResultsItem(results[index]);
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _emptyBuilder() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'No results for the search text!',
      ),
    );
  }

  Widget _searchResultsItem(final Location location) {
    return ListTile(
      onTap: () => widget.onPressedMapResult?.call(location),
      title: Text(
        location.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        location.address,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
