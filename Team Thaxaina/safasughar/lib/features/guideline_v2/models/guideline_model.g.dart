// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guideline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuidelineImpl _$$GuidelineImplFromJson(Map<String, dynamic> json) =>
    _$GuidelineImpl(
      title: json['title'] as String?,
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
      imgUrls: (json['imgUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$GuidelineImplToJson(_$GuidelineImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'imgUrls': instance.imgUrls,
    };
