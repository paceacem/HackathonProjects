import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safasughar/features/recycle/models/product_model.dart';

part 'products_provider_state.freezed.dart';

@freezed
class ProductsProviderState with _$ProductsProviderState {
  const factory ProductsProviderState({
    @Default(<Product>[]) final List<Product> products,
    final Product? productToCreate,
  }) = _ProductsProviderState;
}
