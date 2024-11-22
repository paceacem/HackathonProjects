import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/guideline_v2/models/guideline_model.dart';
import 'package:safasughar/features/guideline_v2/views/widgets/view_guildeline_images.dart';

class ViewGuidelinesScren extends ConsumerStatefulWidget {
  const ViewGuidelinesScren({
    super.key,
    required this.guideline,
  });

  final Guideline guideline;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewGuidelinesScrenState();
}

class _ViewGuidelinesScrenState extends ConsumerState<ViewGuidelinesScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _contentBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: _titleBuilder(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 400.0,
          child: ViewGuidelineImages(
            imageUrls: widget.guideline.imgUrls,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _descriptionBuilder(),
        ),
      ],
    );
  }

  Widget _titleBuilder() {
    return Text(
      widget.guideline.title ?? '',
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 0.0,
      ),
    );
  }

  Widget _descriptionBuilder() {
    return Text(
      widget.guideline.longDescription ?? '',
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
