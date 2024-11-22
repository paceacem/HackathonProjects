// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      title: json['title'] as String,
      address: json['address'] as String,
      point: LatLng.fromJson(json['point'] as Map<String, dynamic>),
      fill: (json['fill'] as num?)?.toDouble() ?? 0.0,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'point': instance.point,
      'fill': instance.fill,
      'imgUrl': instance.imgUrl,
    };
