// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recycle_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecycleItem _$RecycleItemFromJson(Map<String, dynamic> json) {
  return _RecycleItem.fromJson(json);
}

/// @nodoc
mixin _$RecycleItem {
  String get uid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this RecycleItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecycleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecycleItemCopyWith<RecycleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecycleItemCopyWith<$Res> {
  factory $RecycleItemCopyWith(
          RecycleItem value, $Res Function(RecycleItem) then) =
      _$RecycleItemCopyWithImpl<$Res, RecycleItem>;
  @useResult
  $Res call(
      {String uid,
      String? title,
      String? type,
      String? urlToImage,
      String? price,
      bool isFavorite});
}

/// @nodoc
class _$RecycleItemCopyWithImpl<$Res, $Val extends RecycleItem>
    implements $RecycleItemCopyWith<$Res> {
  _$RecycleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecycleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = freezed,
    Object? type = freezed,
    Object? urlToImage = freezed,
    Object? price = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecycleItemImplCopyWith<$Res>
    implements $RecycleItemCopyWith<$Res> {
  factory _$$RecycleItemImplCopyWith(
          _$RecycleItemImpl value, $Res Function(_$RecycleItemImpl) then) =
      __$$RecycleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? title,
      String? type,
      String? urlToImage,
      String? price,
      bool isFavorite});
}

/// @nodoc
class __$$RecycleItemImplCopyWithImpl<$Res>
    extends _$RecycleItemCopyWithImpl<$Res, _$RecycleItemImpl>
    implements _$$RecycleItemImplCopyWith<$Res> {
  __$$RecycleItemImplCopyWithImpl(
      _$RecycleItemImpl _value, $Res Function(_$RecycleItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecycleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = freezed,
    Object? type = freezed,
    Object? urlToImage = freezed,
    Object? price = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_$RecycleItemImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecycleItemImpl implements _RecycleItem {
  const _$RecycleItemImpl(
      {required this.uid,
      this.title,
      this.type,
      this.urlToImage,
      this.price,
      this.isFavorite = false});

  factory _$RecycleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecycleItemImplFromJson(json);

  @override
  final String uid;
  @override
  final String? title;
  @override
  final String? type;
  @override
  final String? urlToImage;
  @override
  final String? price;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'RecycleItem(uid: $uid, title: $title, type: $type, urlToImage: $urlToImage, price: $price, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecycleItemImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, title, type, urlToImage, price, isFavorite);

  /// Create a copy of RecycleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecycleItemImplCopyWith<_$RecycleItemImpl> get copyWith =>
      __$$RecycleItemImplCopyWithImpl<_$RecycleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecycleItemImplToJson(
      this,
    );
  }
}

abstract class _RecycleItem implements RecycleItem {
  const factory _RecycleItem(
      {required final String uid,
      final String? title,
      final String? type,
      final String? urlToImage,
      final String? price,
      final bool isFavorite}) = _$RecycleItemImpl;

  factory _RecycleItem.fromJson(Map<String, dynamic> json) =
      _$RecycleItemImpl.fromJson;

  @override
  String get uid;
  @override
  String? get title;
  @override
  String? get type;
  @override
  String? get urlToImage;
  @override
  String? get price;
  @override
  bool get isFavorite;

  /// Create a copy of RecycleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecycleItemImplCopyWith<_$RecycleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
