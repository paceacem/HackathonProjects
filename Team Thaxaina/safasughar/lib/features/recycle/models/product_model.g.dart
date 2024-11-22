// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String?,
      qualityRating: (json['qualityRating'] as num?)?.toDouble(),
      purchasedDate: json['purchasedDate'] == null
          ? null
          : DateTime.parse(json['purchasedDate'] as String),
      location: json['location'] as String?,
      sellerContact: json['sellerContact'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'qualityRating': instance.qualityRating,
      'purchasedDate': instance.purchasedDate?.toIso8601String(),
      'location': instance.location,
      'sellerContact': instance.sellerContact,
    };
