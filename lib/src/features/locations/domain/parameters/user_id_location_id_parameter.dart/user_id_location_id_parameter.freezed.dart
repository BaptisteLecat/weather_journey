// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_id_location_id_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserIdLocationIdParameter _$UserIdLocationIdParameterFromJson(
    Map<String, dynamic> json) {
  return _UserIdLocationIdParameter.fromJson(json);
}

/// @nodoc
mixin _$UserIdLocationIdParameter {
  String get userId => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this UserIdLocationIdParameter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserIdLocationIdParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserIdLocationIdParameterCopyWith<UserIdLocationIdParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIdLocationIdParameterCopyWith<$Res> {
  factory $UserIdLocationIdParameterCopyWith(UserIdLocationIdParameter value,
          $Res Function(UserIdLocationIdParameter) then) =
      _$UserIdLocationIdParameterCopyWithImpl<$Res, UserIdLocationIdParameter>;
  @useResult
  $Res call({String userId, String locationId});
}

/// @nodoc
class _$UserIdLocationIdParameterCopyWithImpl<$Res,
        $Val extends UserIdLocationIdParameter>
    implements $UserIdLocationIdParameterCopyWith<$Res> {
  _$UserIdLocationIdParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserIdLocationIdParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? locationId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserIdLocationIdParameterImplCopyWith<$Res>
    implements $UserIdLocationIdParameterCopyWith<$Res> {
  factory _$$UserIdLocationIdParameterImplCopyWith(
          _$UserIdLocationIdParameterImpl value,
          $Res Function(_$UserIdLocationIdParameterImpl) then) =
      __$$UserIdLocationIdParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String locationId});
}

/// @nodoc
class __$$UserIdLocationIdParameterImplCopyWithImpl<$Res>
    extends _$UserIdLocationIdParameterCopyWithImpl<$Res,
        _$UserIdLocationIdParameterImpl>
    implements _$$UserIdLocationIdParameterImplCopyWith<$Res> {
  __$$UserIdLocationIdParameterImplCopyWithImpl(
      _$UserIdLocationIdParameterImpl _value,
      $Res Function(_$UserIdLocationIdParameterImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserIdLocationIdParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? locationId = null,
  }) {
    return _then(_$UserIdLocationIdParameterImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserIdLocationIdParameterImpl implements _UserIdLocationIdParameter {
  const _$UserIdLocationIdParameterImpl(
      {required this.userId, required this.locationId});

  factory _$UserIdLocationIdParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserIdLocationIdParameterImplFromJson(json);

  @override
  final String userId;
  @override
  final String locationId;

  @override
  String toString() {
    return 'UserIdLocationIdParameter(userId: $userId, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserIdLocationIdParameterImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, locationId);

  /// Create a copy of UserIdLocationIdParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserIdLocationIdParameterImplCopyWith<_$UserIdLocationIdParameterImpl>
      get copyWith => __$$UserIdLocationIdParameterImplCopyWithImpl<
          _$UserIdLocationIdParameterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserIdLocationIdParameterImplToJson(
      this,
    );
  }
}

abstract class _UserIdLocationIdParameter implements UserIdLocationIdParameter {
  const factory _UserIdLocationIdParameter(
      {required final String userId,
      required final String locationId}) = _$UserIdLocationIdParameterImpl;

  factory _UserIdLocationIdParameter.fromJson(Map<String, dynamic> json) =
      _$UserIdLocationIdParameterImpl.fromJson;

  @override
  String get userId;
  @override
  String get locationId;

  /// Create a copy of UserIdLocationIdParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserIdLocationIdParameterImplCopyWith<_$UserIdLocationIdParameterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
