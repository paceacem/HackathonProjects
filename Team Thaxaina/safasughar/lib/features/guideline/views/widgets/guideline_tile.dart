import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/extensions/extension.dart';
import 'package:safasughar/features/guideline/views/widgets/icon_container.dart';

class GuidelineTile extends ConsumerWidget {
  const GuidelineTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: _components(context),
    ).onPadSym(5, 5);
  }

  Widget _components(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFDu4nfyPH_gqoXNA2RWy4MeP8H5tnXgsjIw&s",
                ),
              ),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ).onPadSym(5, 5),
        ),
        Flexible(
          flex: 4,
          child: Column(
            children: [
              const Text(
                "Hard Beans Brazil Campo...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                "fjaskljaskfdkjakjsfjksakljdsakjfkjdfsajfdskj",
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconContainer(
                    icon: Icons.add,
                    isSelected: true,
                    isNotified: false,
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) =>
                            const GuidelineDetailsBottomSheet(),
                      );
                    },
                  )
                ],
              )
            ],
          ).onPadT(5).onPadR(5).onPadB(5),
        )
      ],
    );
  }
}

class GuidelineDetailsBottomSheet extends StatelessWidget {
  const GuidelineDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconContainer(
                      icon: Icons.close,
                      isSelected: false,
                      isNotified: false,
                      ontap: () {
                        Navigator.of(context).pop();
                      }),
                ),

                // Product image
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),

                // Product Title
                const Text(
                  "Brazil Campo das Vertentes Espresso 1kg",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Product Price
                const Text(
                  "\$8.00",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                const SizedBox(height: 8),

                // Product Description
                Text(
                  "An elegant classic of the highest quality. Brazil Campo Das Vertentes is a pure, fresh coffee with notes of dried fig, nougat, and chocolate.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),

                // Add to Cart and Notify Me buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Add to cart"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).onPadSym(5, 0);
  }
}
