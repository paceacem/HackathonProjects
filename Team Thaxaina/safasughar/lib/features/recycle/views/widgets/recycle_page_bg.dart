import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:safasughar/features/recycle/views/widgets/collection_title.dart';
import 'package:safasughar/features/recycle/views/widgets/profile_header.dart';
import 'package:safasughar/features/recycle/views/widgets/recycle_item_list.dart';

class RecyclePageBg extends StatelessWidget {
  const RecyclePageBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // Full-Screen Background Image
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/originals/d9/d3/aa/d9d3aa51fb6787fc2b29d1c105167dad.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: maxHeight,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        // Bottom Background Container
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: maxHeight * 0.35,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        // Profile Header
        const Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: SafeArea(child: ProfileHeader()),
        ),
        // Collection Title
        Positioned(
          top: maxHeight * 0.2,
          left: 16,
          right: 16,
          child: const CollectionTitle(),
        ),
        // Shopping Items
        Positioned(
          bottom: maxHeight * 0.05,
          left: 0,
          right: 0,
          child: SizedBox(
            height: maxHeight * 0.45,
            width: maxWidth * 0.6,
            child: const RecycleItemList(),
          ),
        ),
      ],
    );
  }
}
