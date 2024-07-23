// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_id_location_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserIdLocationParameter _$UserIdLocationParameterFromJson(
    Map<String, dynamic> json) {
  return _UseruidLocationParameter.fromJson(json);
}

/// @nodoc
mixin _$UserIdLocationParameter {
  String get uid => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  /// Serializes this UserIdLocationParameter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserIdLocationParameterCopyWith<UserIdLocationParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIdLocationParameterCopyWith<$Res> {
  factory $UserIdLocationParameterCopyWith(UserIdLocationParameter value,
          $Res Function(UserIdLocationParameter) then) =
      _$UserIdLocationParameterCopyWithImpl<$Res, UserIdLocationParameter>;
  @useResult
  $Res call({String uid, Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$UserIdLocationParameterCopyWithImpl<$Res,
        $Val extends UserIdLocationParameter>
    implements $UserIdLocationParameterCopyWith<$Res> {
  _$UserIdLocationParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UseruidLocationParameterImplCopyWith<$Res>
    implements $UserIdLocationParameterCopyWith<$Res> {
  factory _$$UseruidLocationParameterImplCopyWith(
          _$UseruidLocationParameterImpl value,
          $Res Function(_$UseruidLocationParameterImpl) then) =
      __$$UseruidLocationParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$UseruidLocationParameterImplCopyWithImpl<$Res>
    extends _$UserIdLocationParameterCopyWithImpl<$Res,
        _$UseruidLocationParameterImpl>
    implements _$$UseruidLocationParameterImplCopyWith<$Res> {
  __$$UseruidLocationParameterImplCopyWithImpl(
      _$UseruidLocationParameterImpl _value,
      $Res Function(_$UseruidLocationParameterImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? location = null,
  }) {
    return _then(_$UseruidLocationParameterImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UseruidLocationParameterImpl implements _UseruidLocationParameter {
  const _$UseruidLocationParameterImpl(
      {required this.uid, required this.location});

  factory _$UseruidLocationParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UseruidLocationParameterImplFromJson(json);

  @override
  final String uid;
  @override
  final Location location;

  @override
  String toString() {
    return 'UserIdLocationParameter(uid: $uid, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UseruidLocationParameterImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, location);

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UseruidLocationParameterImplCopyWith<_$UseruidLocationParameterImpl>
      get copyWith => __$$UseruidLocationParameterImplCopyWithImpl<
          _$UseruidLocationParameterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UseruidLocationParameterImplToJson(
      this,
    );
  }
}

abstract class _UseruidLocationParameter implements UserIdLocationParameter {
  const factory _UseruidLocationParameter(
      {required final String uid,
      required final Location location}) = _$UseruidLocationParameterImpl;

  factory _UseruidLocationParameter.fromJson(Map<String, dynamic> json) =
      _$UseruidLocationParameterImpl.fromJson;

  @override
  String get uid;
  @override
  Location get location;

  /// Create a copy of UserIdLocationParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UseruidLocationParameterImplCopyWith<_$UseruidLocationParameterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
