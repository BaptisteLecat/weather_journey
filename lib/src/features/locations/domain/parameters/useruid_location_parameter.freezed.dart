// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useruid_location_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UseruidLocationParameter _$UseruidLocationParameterFromJson(
    Map<String, dynamic> json) {
  return _UseruidLocationParameter.fromJson(json);
}

/// @nodoc
mixin _$UseruidLocationParameter {
  String get uid => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UseruidLocationParameterCopyWith<UseruidLocationParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseruidLocationParameterCopyWith<$Res> {
  factory $UseruidLocationParameterCopyWith(UseruidLocationParameter value,
          $Res Function(UseruidLocationParameter) then) =
      _$UseruidLocationParameterCopyWithImpl<$Res, UseruidLocationParameter>;
  @useResult
  $Res call({String uid, Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$UseruidLocationParameterCopyWithImpl<$Res,
        $Val extends UseruidLocationParameter>
    implements $UseruidLocationParameterCopyWith<$Res> {
  _$UseruidLocationParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UseruidLocationParameterCopyWith<$Res>
    implements $UseruidLocationParameterCopyWith<$Res> {
  factory _$$_UseruidLocationParameterCopyWith(
          _$_UseruidLocationParameter value,
          $Res Function(_$_UseruidLocationParameter) then) =
      __$$_UseruidLocationParameterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_UseruidLocationParameterCopyWithImpl<$Res>
    extends _$UseruidLocationParameterCopyWithImpl<$Res,
        _$_UseruidLocationParameter>
    implements _$$_UseruidLocationParameterCopyWith<$Res> {
  __$$_UseruidLocationParameterCopyWithImpl(_$_UseruidLocationParameter _value,
      $Res Function(_$_UseruidLocationParameter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? location = null,
  }) {
    return _then(_$_UseruidLocationParameter(
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
class _$_UseruidLocationParameter implements _UseruidLocationParameter {
  const _$_UseruidLocationParameter(
      {required this.uid, required this.location});

  factory _$_UseruidLocationParameter.fromJson(Map<String, dynamic> json) =>
      _$$_UseruidLocationParameterFromJson(json);

  @override
  final String uid;
  @override
  final Location location;

  @override
  String toString() {
    return 'UseruidLocationParameter(uid: $uid, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UseruidLocationParameter &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UseruidLocationParameterCopyWith<_$_UseruidLocationParameter>
      get copyWith => __$$_UseruidLocationParameterCopyWithImpl<
          _$_UseruidLocationParameter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UseruidLocationParameterToJson(
      this,
    );
  }
}

abstract class _UseruidLocationParameter implements UseruidLocationParameter {
  const factory _UseruidLocationParameter(
      {required final String uid,
      required final Location location}) = _$_UseruidLocationParameter;

  factory _UseruidLocationParameter.fromJson(Map<String, dynamic> json) =
      _$_UseruidLocationParameter.fromJson;

  @override
  String get uid;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$_UseruidLocationParameterCopyWith<_$_UseruidLocationParameter>
      get copyWith => throw _privateConstructorUsedError;
}
