import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/create_post/providers/products_provider.dart';
import 'package:safasughar/features/recycle/views/screens/recycle_item_description.dart';
import 'package:safasughar/features/recycle/views/widgets/recycle_item_card.dart';

class RecycleItemList extends ConsumerStatefulWidget {
  const RecycleItemList({super.key});

  @override
  ConsumerState<RecycleItemList> createState() => _RecycleItemListState();
}

class _RecycleItemListState extends ConsumerState<RecycleItemList> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(
      providerOfProducts.select(
        (value) => value.products,
      ),
    );

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final recycleProduct = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductDetailPage(
                    product: recycleProduct,
                  );
                },
              ),
            );
          },
          child: RecycleItemCard(
            product: recycleProduct,
          ),
        );
      },
    );
  }
}
