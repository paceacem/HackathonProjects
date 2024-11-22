import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/map/providers/map_provider.dart';
import 'package:safasughar/features/shared/views/widgets/round_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MapResultTile extends ConsumerStatefulWidget {
  const MapResultTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapResultTileState();
}

class _MapResultTileState extends ConsumerState<MapResultTile> {
  @override
  Widget build(BuildContext context) {
    final selectedLocation = ref.watch(
      providerOfMap.select(
        (value) => value.selectedLocation,
      ),
    );
    if (selectedLocation == null) return const SizedBox();

    return Container(
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
      child: Row(
        children: [
          if (selectedLocation.imgUrl != null)
            _imageBuilder(selectedLocation.imgUrl!),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                top: 10.0,
                bottom: 10.0,
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedLocation.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    selectedLocation.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _fillBuilder(selectedLocation.fill),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Waste\nFilled',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      RoundIconButton(
                        onPressed: () => _openMap(
                          selectedLocation.point.latitude,
                          selectedLocation.point.longitude,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        bgColor: Colors.blue.withOpacity(0.1),
                        icon: const Icon(
                          Icons.location_on_rounded,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _imageBuilder(final String imgUrl) {
    return Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _fillBuilder(final double value) {
    return Stack(
      children: [
        CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: Colors.red,
          backgroundColor: Colors.red.withOpacity(0.1),
          value: value,
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              '${value * 100}%',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 8.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openMap(final double latitude, final double longitude) async {
    final googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      debugPrint('Could not open the map.');
    }
  }
}
