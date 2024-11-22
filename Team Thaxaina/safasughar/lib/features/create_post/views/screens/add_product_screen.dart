import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safasughar/extensions/extension.dart';
import 'package:safasughar/features/create_post/providers/products_provider.dart';
import 'package:safasughar/features/create_post/views/widgets/add_product_text_field.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<AddProductScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactController = TextEditingController();
  final _priceController = TextEditingController();
  final _calendarController = TextEditingController();
  final _locationController = TextEditingController();
  final _categoryController = TextEditingController();
  final _qualityRatingController = TextEditingController();
  DateTime? _purchasedDate;

  XFile? _pickedImage;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _contactController.dispose();
    _priceController.dispose();
    _calendarController.dispose();
    _locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // Background Layer 1 - Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade600,
                    Colors.blue.shade400,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Background Layer 2 - Top-Left Circle
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade300.withOpacity(0.6),
                ),
              ),
            ),

            // Background Layer 3 - Bottom-Right Circle
            Positioned(
              bottom: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade700.withOpacity(0.7),
                ),
              ),
            ),

            // Background Layer 4 - Elliptical Shape Center-Left
            Positioned(
              top: 150,
              left: -50,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.blue.shade500.withOpacity(0.5),
                ),
              ),
            ),

            // Background Layer 5 - Rotated Rectangle
            Positioned(
              bottom: 150,
              right: 50,
              child: Transform.rotate(
                angle: -180 / 4,
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Background Layer 6 - Small Circle Near Center
            Positioned(
              top: 300,
              right: 100,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade300.withOpacity(0.8),
                ),
              ),
            ),

            // Background Layer 7 - Custom Semi-Circle Shape
            Positioned(
              top: 50,
              right: 50,
              child: ClipPath(
                clipper: SemiCircleClipper(),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue.shade200.withOpacity(0.4),
                ),
              ),
            ),

            // Content - Text
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Add a Product",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).onPadL(20),
                        GestureDetector(
                          onTap: _postProduct,
                          child: const Text(
                            "Post",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ).onPadR(20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    _imageBuilder().onPadL(20.0),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _textFields(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageBuilder() {
    return GestureDetector(
      onTap: _pickImage,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
          ),
          image: _pickedImage == null
              ? null
              : DecorationImage(
                  image: FileImage(
                    File(_pickedImage!.path),
                  ),
                  fit: BoxFit.cover,
                ),
        ),
        child: const Icon(
          Icons.add_a_photo_rounded,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  Widget _textFields() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        AddProductTextField(
          controller: _titleController,
          hintText: "Add a title...",
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _descriptionController,
          hintText: "Add a description...",
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _contactController,
          hintText: "Add your contact...",
          textInputType: TextInputType.phone,
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _priceController,
          hintText: "Add price...",
          textInputType: TextInputType.number,
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _calendarController,
          hintText: "Add purchase date...",
          isCalendar: true,
          onDatePicked: (date) => setState(() {
            _purchasedDate = date;
          }),
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _locationController,
          hintText: "Add location...",
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _categoryController,
          hintText: "Add Category...",
        ),
        const SizedBox(
          height: 60,
        ),
        AddProductTextField(
          controller: _qualityRatingController,
          hintText: "Add Quality Rating...",
          textInputType: TextInputType.number,
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    ).onPadSym(20, 0);
  }

  void _pickImage() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (!mounted) return;

    setState(() {
      _pickedImage = img;
    });
  }

  void _postProduct() {
    if (_pickedImage == null ||
        _titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _contactController.text.trim().isEmpty ||
        _locationController.text.trim().isEmpty ||
        _categoryController.text.trim().isEmpty ||
        _qualityRatingController.text.trim().isEmpty) {
      return;
    }

    ref.read(providerOfProducts.notifier)
      ..updateProductLocalFile(_pickedImage)
      ..updateProductTitle(_titleController.text.trim())
      ..updateProductDescription(_descriptionController.text.trim())
      ..updateProductContact(_contactController.text.trim())
      ..updateProductLocation(_locationController.text.trim())
      ..updateProductCategory(_categoryController.text.trim());

    final price = double.tryParse(_priceController.text.trim());
    if (price != null) {
      ref.read(providerOfProducts.notifier).updateProductPrice(price);
    }

    final qualityRating = double.tryParse(_qualityRatingController.text.trim());
    if (qualityRating != null) {
      ref.read(providerOfProducts.notifier).updateProductRating(qualityRating);
    }

    if (_purchasedDate != null) {
      ref
          .read(providerOfProducts.notifier)
          .updateProductPurchaseDate(_purchasedDate!);
    }

    final productToCreate = ref.read(
      providerOfProducts.select(
        (value) => value.productToCreate,
      ),
    );
    if (productToCreate != null) {
      ref.read(providerOfProducts.notifier).addToProducts(productToCreate);
    }
    Navigator.of(context).pop();
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(size.width / 2),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
