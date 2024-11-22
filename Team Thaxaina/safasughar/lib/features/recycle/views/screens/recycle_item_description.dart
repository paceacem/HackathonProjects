import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:safasughar/features/recycle/models/product_model.dart';
import 'package:safasughar/features/recycle/views/widgets/custom_appbar.dart';
import 'package:safasughar/features/recycle/views/widgets/feature_tile.dart';

import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Selected shoe size
  double selectedSize = 5.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Product Details',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shoe Image
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(
                            8), // Add padding inside the container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              16), // Apply border radius to the image
                          child: widget.product.localFile != null
                              ? Image.file(
                                  File(widget.product.localFile!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 300,
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget.product.imageUrl!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 300,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Product Title & Description
                    Text(
                      '${widget.product.category}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${widget.product.name}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureTile(
                          icon: Icons.star,
                          label: '${widget.product.qualityRating} / 5',
                          description: 'Rating',
                        ),
                        FeatureTile(
                          icon: Icons.event,
                          description: 'Purchased Date',
                          label:
                              '${widget.product.purchasedDate!.year}-${widget.product.purchasedDate!.month}-${widget.product.purchasedDate!.day}',
                        ),
                        FeatureTile(
                          icon: Icons.location_city,
                          label: '${widget.product.location}',
                          description: 'Location',
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Description Section with ExpandableText
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ExpandableText(
                      '${widget.product.description}',
                      expandText: '\nShow More',
                      collapseText: 'Show Less',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      linkColor: Colors.blue,
                    ),

                    const SizedBox(height: 16),

                    // Add to Cart Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          _launchPhone('${widget.product.sellerContact}');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
          size: 20,
        ),
        label: const Text(
          'Contact Seller',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// contact seller for call
void _launchPhone(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (!await launchUrl(phoneUri)) {
    throw 'Could not launch $phoneNumber';
  }
}
