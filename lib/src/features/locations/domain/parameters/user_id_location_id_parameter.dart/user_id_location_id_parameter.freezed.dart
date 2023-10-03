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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserIdLocationIdParameter _$UserIdLocationIdParameterFromJson(
    Map<String, dynamic> json) {
  return _UserIdLocationIdParameter.fromJson(json);
}

/// @nodoc
mixin _$UserIdLocationIdParameter {
  String get userId => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_UserIdLocationIdParameterCopyWith<$Res>
    implements $UserIdLocationIdParameterCopyWith<$Res> {
  factory _$$_UserIdLocationIdParameterCopyWith(
          _$_UserIdLocationIdParameter value,
          $Res Function(_$_UserIdLocationIdParameter) then) =
      __$$_UserIdLocationIdParameterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String locationId});
}

/// @nodoc
class __$$_UserIdLocationIdParameterCopyWithImpl<$Res>
    extends _$UserIdLocationIdParameterCopyWithImpl<$Res,
        _$_UserIdLocationIdParameter>
    implements _$$_UserIdLocationIdParameterCopyWith<$Res> {
  __$$_UserIdLocationIdParameterCopyWithImpl(
      _$_UserIdLocationIdParameter _value,
      $Res Function(_$_UserIdLocationIdParameter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? locationId = null,
  }) {
    return _then(_$_UserIdLocationIdParameter(
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
class _$_UserIdLocationIdParameter implements _UserIdLocationIdParameter {
  const _$_UserIdLocationIdParameter(
      {required this.userId, required this.locationId});

  factory _$_UserIdLocationIdParameter.fromJson(Map<String, dynamic> json) =>
      _$$_UserIdLocationIdParameterFromJson(json);

  @override
  final String userId;
  @override
  final String locationId;

  @override
  String toString() {
    return 'UserIdLocationIdParameter(userId: $userId, locationId: $locationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserIdLocationIdParameter &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, locationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserIdLocationIdParameterCopyWith<_$_UserIdLocationIdParameter>
      get copyWith => __$$_UserIdLocationIdParameterCopyWithImpl<
          _$_UserIdLocationIdParameter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserIdLocationIdParameterToJson(
      this,
    );
  }
}

abstract class _UserIdLocationIdParameter implements UserIdLocationIdParameter {
  const factory _UserIdLocationIdParameter(
      {required final String userId,
      required final String locationId}) = _$_UserIdLocationIdParameter;

  factory _UserIdLocationIdParameter.fromJson(Map<String, dynamic> json) =
      _$_UserIdLocationIdParameter.fromJson;

  @override
  String get userId;
  @override
  String get locationId;
  @override
  @JsonKey(ignore: true)
  _$$_UserIdLocationIdParameterCopyWith<_$_UserIdLocationIdParameter>
      get copyWith => throw _privateConstructorUsedError;
}
