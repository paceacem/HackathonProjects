import 'package:freezed_annotation/freezed_annotation.dart';

part 'recycle_item.freezed.dart';
part 'recycle_item.g.dart';

@freezed
class RecycleItem with _$RecycleItem {
  const factory RecycleItem({
    required String uid,
    String? title,
    String? type,
    String? urlToImage,
    String? price,
    @Default(false) bool isFavorite,
  }) = _RecycleItem;

  factory RecycleItem.fromJson(Map<String, dynamic> json) =>
      _$RecycleItemFromJson(json);
}
