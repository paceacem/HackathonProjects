import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safasughar/demo_data.dart';
import 'package:safasughar/features/create_post/providers/states/products_provider_state.dart';
import 'package:safasughar/features/recycle/models/product_model.dart';

final providerOfProducts =
    StateNotifierProvider<ProductsProvider, ProductsProviderState>(
  (ref) => ProductsProvider(
    ref: ref,
    state: const ProductsProviderState(),
  ),
);

class ProductsProvider extends StateNotifier<ProductsProviderState> {
  ProductsProvider({
    required final Ref ref,
    required final ProductsProviderState state,
  }) : super(state) {
    updateProducts(recycleProducts);
  }

  void addToProducts(final Product product) {
    updateProducts([...state.products, product]);
  }

  void updateProducts(final List<Product> products) {
    state = state.copyWith(
      products: products,
    );
  }

  void updateProductToCreate(final Product? product) {
    state = state.copyWith(
      productToCreate: product,
    );
  }

  void updateProductLocalFile(final XFile? localFile) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      localFile: localFile,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductTitle(final String title) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      name: title,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductDescription(final String description) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      description: description,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductContact(final String contact) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      sellerContact: contact,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductPrice(final double price) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      price: price,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductPurchaseDate(final DateTime purchasedDate) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      purchasedDate: purchasedDate,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductLocation(final String location) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      location: location,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductCategory(final String category) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      category: category,
    );
    updateProductToCreate(newProduct);
  }

  void updateProductRating(final double rating) {
    final product = state.productToCreate ?? const Product();
    final newProduct = product.copyWith(
      qualityRating: rating,
    );
    updateProductToCreate(newProduct);
  }
}
