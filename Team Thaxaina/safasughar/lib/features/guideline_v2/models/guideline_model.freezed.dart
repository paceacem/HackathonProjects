// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guideline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Guideline _$GuidelineFromJson(Map<String, dynamic> json) {
  return _Guideline.fromJson(json);
}

/// @nodoc
mixin _$Guideline {
  String? get title => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String? get longDescription => throw _privateConstructorUsedError;
  List<String> get imgUrls => throw _privateConstructorUsedError;

  /// Serializes this Guideline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Guideline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuidelineCopyWith<Guideline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidelineCopyWith<$Res> {
  factory $GuidelineCopyWith(Guideline value, $Res Function(Guideline) then) =
      _$GuidelineCopyWithImpl<$Res, Guideline>;
  @useResult
  $Res call(
      {String? title,
      String? shortDescription,
      String? longDescription,
      List<String> imgUrls});
}

/// @nodoc
class _$GuidelineCopyWithImpl<$Res, $Val extends Guideline>
    implements $GuidelineCopyWith<$Res> {
  _$GuidelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Guideline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? longDescription = freezed,
    Object? imgUrls = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrls: null == imgUrls
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuidelineImplCopyWith<$Res>
    implements $GuidelineCopyWith<$Res> {
  factory _$$GuidelineImplCopyWith(
          _$GuidelineImpl value, $Res Function(_$GuidelineImpl) then) =
      __$$GuidelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? shortDescription,
      String? longDescription,
      List<String> imgUrls});
}

/// @nodoc
class __$$GuidelineImplCopyWithImpl<$Res>
    extends _$GuidelineCopyWithImpl<$Res, _$GuidelineImpl>
    implements _$$GuidelineImplCopyWith<$Res> {
  __$$GuidelineImplCopyWithImpl(
      _$GuidelineImpl _value, $Res Function(_$GuidelineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Guideline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? longDescription = freezed,
    Object? imgUrls = null,
  }) {
    return _then(_$GuidelineImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrls: null == imgUrls
          ? _value._imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuidelineImpl implements _Guideline {
  const _$GuidelineImpl(
      {this.title,
      this.shortDescription,
      this.longDescription,
      final List<String> imgUrls = const <String>[]})
      : _imgUrls = imgUrls;

  factory _$GuidelineImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuidelineImplFromJson(json);

  @override
  final String? title;
  @override
  final String? shortDescription;
  @override
  final String? longDescription;
  final List<String> _imgUrls;
  @override
  @JsonKey()
  List<String> get imgUrls {
    if (_imgUrls is EqualUnmodifiableListView) return _imgUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgUrls);
  }

  @override
  String toString() {
    return 'Guideline(title: $title, shortDescription: $shortDescription, longDescription: $longDescription, imgUrls: $imgUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidelineImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            const DeepCollectionEquality().equals(other._imgUrls, _imgUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, shortDescription,
      longDescription, const DeepCollectionEquality().hash(_imgUrls));

  /// Create a copy of Guideline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuidelineImplCopyWith<_$GuidelineImpl> get copyWith =>
      __$$GuidelineImplCopyWithImpl<_$GuidelineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuidelineImplToJson(
      this,
    );
  }
}

abstract class _Guideline implements Guideline {
  const factory _Guideline(
      {final String? title,
      final String? shortDescription,
      final String? longDescription,
      final List<String> imgUrls}) = _$GuidelineImpl;

  factory _Guideline.fromJson(Map<String, dynamic> json) =
      _$GuidelineImpl.fromJson;

  @override
  String? get title;
  @override
  String? get shortDescription;
  @override
  String? get longDescription;
  @override
  List<String> get imgUrls;

  /// Create a copy of Guideline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuidelineImplCopyWith<_$GuidelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
