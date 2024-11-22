import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/map/providers/map_provider.dart';
import 'package:safasughar/features/map/views/providers/map_search_results_provider.dart';
import 'package:safasughar/features/map/views/widgets/map_search_results.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

class Searchbar extends ConsumerStatefulWidget {
  const Searchbar({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchbarState();
}

class _SearchbarState extends ConsumerState<Searchbar> {
  final _searchLink = LayerLink();
  final _focusNode = FocusNode();
  OverlayEntry? _searchResultOverlayEntry;
  var _searchString = '';
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _searchString.isEmpty) {
        _hideSearchResultsOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _searchLink,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 239, 239),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for a dumping point...',
                ),
                focusNode: _focusNode,
                onChanged: _handleSearchChanged,
              ),
            ),
            if (_searchString.isNotEmpty)
              GestureDetector(
                child: const Icon(
                  Icons.clear_rounded,
                ),
                onTap: () {
                  _searchController.clear();
                  _hideSearchResultsOverlay();
                  setState(() {
                    _searchString = '';
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showSearchResultsOverlay() {
    if (_searchResultOverlayEntry != null) return;

    _hideSearchResultsOverlay();

    _searchResultOverlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        left: 20.0,
        right: 20.0,
        child: CompositedTransformFollower(
          offset: const Offset(0.0, 60.0),
          link: _searchLink,
          child: MapSearchResults(
            onPressedMapResult: _moveToLocation,
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_searchResultOverlayEntry!);
  }

  void _hideSearchResultsOverlay() {
    _searchResultOverlayEntry?.remove();
    _searchResultOverlayEntry = null;
  }

  void _handleSearchChanged(final String text) {
    if (text.isEmpty) {
      _hideSearchResultsOverlay();
    } else {
      ref.read(providerOfMapSearchResults.notifier).filterResults(text);
      _showSearchResultsOverlay();
    }

    setState(() {
      _searchString = text;
    });
  }

  void _moveToLocation(final Location location) {
    FocusScope.of(context).unfocus();

    ref.read(providerOfMap.notifier)
      ..moveMapToLocation(destination: location.point)
      ..updateSelectedLocation(location);
    _hideSearchResultsOverlay();
    _searchController.clear();
    setState(() {
      _searchString = '';
    });
  }
}
