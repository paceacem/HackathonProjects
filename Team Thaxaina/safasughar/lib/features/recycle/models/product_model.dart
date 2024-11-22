import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    final String? id,
    final String? name,
    final double? price,
    final String? description,
    final String? imageUrl,
    final String? category,
    final double? qualityRating,
    final DateTime? purchasedDate,
    final String? location,
    final String? sellerContact,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final XFile? localFile,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
