// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecycleItemImpl _$$RecycleItemImplFromJson(Map<String, dynamic> json) =>
    _$RecycleItemImpl(
      uid: json['uid'] as String,
      title: json['title'] as String?,
      type: json['type'] as String?,
      urlToImage: json['urlToImage'] as String?,
      price: json['price'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$RecycleItemImplToJson(_$RecycleItemImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'type': instance.type,
      'urlToImage': instance.urlToImage,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
    };
