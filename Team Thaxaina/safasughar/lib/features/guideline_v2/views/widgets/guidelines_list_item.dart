import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/guideline_v2/models/guideline_model.dart';
import 'package:safasughar/features/guideline_v2/views/screens/view_guidelines_screen.dart';

class GuidelinesListItem extends ConsumerStatefulWidget {
  const GuidelinesListItem({
    super.key,
    required this.guideline,
  });

  final Guideline guideline;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GuidelinesListItemState();
}

class _GuidelinesListItemState extends ConsumerState<GuidelinesListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _gotoViewGuidelineScreen,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey.withOpacity(0.2),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                widget.guideline.imgUrls.first,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleBuilder(),
                      _descriptionBuilder(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleBuilder() {
    return Text(
      widget.guideline.title ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    );
  }

  Widget _descriptionBuilder() {
    return Text(
      widget.guideline.shortDescription ?? '',
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  void _gotoViewGuidelineScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ViewGuidelinesScren(
          guideline: widget.guideline,
        ),
      ),
    );
  }
}
