// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get detailedMessage => throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$AppErrorImplCopyWith(
          _$AppErrorImpl value, $Res Function(_$AppErrorImpl) then) =
      __$$AppErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class __$$AppErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AppErrorImpl>
    implements _$$AppErrorImplCopyWith<$Res> {
  __$$AppErrorImplCopyWithImpl(
      _$AppErrorImpl _value, $Res Function(_$AppErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_$AppErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppErrorImpl implements _AppError {
  const _$AppErrorImpl(
      {required this.message, this.code, this.detailedMessage});

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? detailedMessage;

  @override
  String toString() {
    return 'AppError(message: $message, code: $code, detailedMessage: $detailedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.detailedMessage, detailedMessage) ||
                other.detailedMessage == detailedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, detailedMessage);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      __$$AppErrorImplCopyWithImpl<_$AppErrorImpl>(this, _$identity);
}

abstract class _AppError implements AppError {
  const factory _AppError(
      {required final String message,
      final String? code,
      final String? detailedMessage}) = _$AppErrorImpl;

  @override
  String get message;
  @override
  String? get code;
  @override
  String? get detailedMessage;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
