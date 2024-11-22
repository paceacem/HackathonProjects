// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportsProviderState {
  List<DumpingReport> get reports => throw _privateConstructorUsedError;

  /// Create a copy of ReportsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportsProviderStateCopyWith<ReportsProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsProviderStateCopyWith<$Res> {
  factory $ReportsProviderStateCopyWith(ReportsProviderState value,
          $Res Function(ReportsProviderState) then) =
      _$ReportsProviderStateCopyWithImpl<$Res, ReportsProviderState>;
  @useResult
  $Res call({List<DumpingReport> reports});
}

/// @nodoc
class _$ReportsProviderStateCopyWithImpl<$Res,
        $Val extends ReportsProviderState>
    implements $ReportsProviderStateCopyWith<$Res> {
  _$ReportsProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
  }) {
    return _then(_value.copyWith(
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<DumpingReport>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportsProviderStateImplCopyWith<$Res>
    implements $ReportsProviderStateCopyWith<$Res> {
  factory _$$ReportsProviderStateImplCopyWith(_$ReportsProviderStateImpl value,
          $Res Function(_$ReportsProviderStateImpl) then) =
      __$$ReportsProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DumpingReport> reports});
}

/// @nodoc
class __$$ReportsProviderStateImplCopyWithImpl<$Res>
    extends _$ReportsProviderStateCopyWithImpl<$Res, _$ReportsProviderStateImpl>
    implements _$$ReportsProviderStateImplCopyWith<$Res> {
  __$$ReportsProviderStateImplCopyWithImpl(_$ReportsProviderStateImpl _value,
      $Res Function(_$ReportsProviderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
  }) {
    return _then(_$ReportsProviderStateImpl(
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<DumpingReport>,
    ));
  }
}

/// @nodoc

class _$ReportsProviderStateImpl implements _ReportsProviderState {
  const _$ReportsProviderStateImpl(
      {final List<DumpingReport> reports = const <DumpingReport>[]})
      : _reports = reports;

  final List<DumpingReport> _reports;
  @override
  @JsonKey()
  List<DumpingReport> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  String toString() {
    return 'ReportsProviderState(reports: $reports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsProviderStateImpl &&
            const DeepCollectionEquality().equals(other._reports, _reports));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reports));

  /// Create a copy of ReportsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsProviderStateImplCopyWith<_$ReportsProviderStateImpl>
      get copyWith =>
          __$$ReportsProviderStateImplCopyWithImpl<_$ReportsProviderStateImpl>(
              this, _$identity);
}

abstract class _ReportsProviderState implements ReportsProviderState {
  const factory _ReportsProviderState({final List<DumpingReport> reports}) =
      _$ReportsProviderStateImpl;

  @override
  List<DumpingReport> get reports;

  /// Create a copy of ReportsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsProviderStateImplCopyWith<_$ReportsProviderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
