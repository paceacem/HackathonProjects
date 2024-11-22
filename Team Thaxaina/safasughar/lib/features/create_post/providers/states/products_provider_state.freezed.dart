// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsProviderState {
  List<Product> get products => throw _privateConstructorUsedError;
  Product? get productToCreate => throw _privateConstructorUsedError;

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsProviderStateCopyWith<ProductsProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsProviderStateCopyWith<$Res> {
  factory $ProductsProviderStateCopyWith(ProductsProviderState value,
          $Res Function(ProductsProviderState) then) =
      _$ProductsProviderStateCopyWithImpl<$Res, ProductsProviderState>;
  @useResult
  $Res call({List<Product> products, Product? productToCreate});

  $ProductCopyWith<$Res>? get productToCreate;
}

/// @nodoc
class _$ProductsProviderStateCopyWithImpl<$Res,
        $Val extends ProductsProviderState>
    implements $ProductsProviderStateCopyWith<$Res> {
  _$ProductsProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? productToCreate = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productToCreate: freezed == productToCreate
          ? _value.productToCreate
          : productToCreate // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get productToCreate {
    if (_value.productToCreate == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.productToCreate!, (value) {
      return _then(_value.copyWith(productToCreate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductsProviderStateImplCopyWith<$Res>
    implements $ProductsProviderStateCopyWith<$Res> {
  factory _$$ProductsProviderStateImplCopyWith(
          _$ProductsProviderStateImpl value,
          $Res Function(_$ProductsProviderStateImpl) then) =
      __$$ProductsProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> products, Product? productToCreate});

  @override
  $ProductCopyWith<$Res>? get productToCreate;
}

/// @nodoc
class __$$ProductsProviderStateImplCopyWithImpl<$Res>
    extends _$ProductsProviderStateCopyWithImpl<$Res,
        _$ProductsProviderStateImpl>
    implements _$$ProductsProviderStateImplCopyWith<$Res> {
  __$$ProductsProviderStateImplCopyWithImpl(_$ProductsProviderStateImpl _value,
      $Res Function(_$ProductsProviderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? productToCreate = freezed,
  }) {
    return _then(_$ProductsProviderStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productToCreate: freezed == productToCreate
          ? _value.productToCreate
          : productToCreate // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

class _$ProductsProviderStateImpl implements _ProductsProviderState {
  const _$ProductsProviderStateImpl(
      {final List<Product> products = const <Product>[], this.productToCreate})
      : _products = products;

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final Product? productToCreate;

  @override
  String toString() {
    return 'ProductsProviderState(products: $products, productToCreate: $productToCreate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsProviderStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.productToCreate, productToCreate) ||
                other.productToCreate == productToCreate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), productToCreate);

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsProviderStateImplCopyWith<_$ProductsProviderStateImpl>
      get copyWith => __$$ProductsProviderStateImplCopyWithImpl<
          _$ProductsProviderStateImpl>(this, _$identity);
}

abstract class _ProductsProviderState implements ProductsProviderState {
  const factory _ProductsProviderState(
      {final List<Product> products,
      final Product? productToCreate}) = _$ProductsProviderStateImpl;

  @override
  List<Product> get products;
  @override
  Product? get productToCreate;

  /// Create a copy of ProductsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsProviderStateImplCopyWith<_$ProductsProviderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
