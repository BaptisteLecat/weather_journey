// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFollow _$UserFollowFromJson(Map<String, dynamic> json) {
  return _UserFollow.fromJson(json);
}

/// @nodoc
mixin _$UserFollow {
  String get userId => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserFollow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFollow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFollowCopyWith<UserFollow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFollowCopyWith<$Res> {
  factory $UserFollowCopyWith(
          UserFollow value, $Res Function(UserFollow) then) =
      _$UserFollowCopyWithImpl<$Res, UserFollow>;
  @useResult
  $Res call(
      {String userId,
      String? lastname,
      String? firstname,
      String email,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});
}

/// @nodoc
class _$UserFollowCopyWithImpl<$Res, $Val extends UserFollow>
    implements $UserFollowCopyWith<$Res> {
  _$UserFollowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFollow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFollowImplCopyWith<$Res>
    implements $UserFollowCopyWith<$Res> {
  factory _$$UserFollowImplCopyWith(
          _$UserFollowImpl value, $Res Function(_$UserFollowImpl) then) =
      __$$UserFollowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String? lastname,
      String? firstname,
      String email,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});
}

/// @nodoc
class __$$UserFollowImplCopyWithImpl<$Res>
    extends _$UserFollowCopyWithImpl<$Res, _$UserFollowImpl>
    implements _$$UserFollowImplCopyWith<$Res> {
  __$$UserFollowImplCopyWithImpl(
      _$UserFollowImpl _value, $Res Function(_$UserFollowImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFollow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserFollowImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserFollowImpl implements _UserFollow {
  const _$UserFollowImpl(
      {required this.userId,
      required this.lastname,
      required this.firstname,
      required this.email,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required this.createdAt});

  factory _$UserFollowImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFollowImplFromJson(json);

  @override
  final String userId;
  @override
  final String? lastname;
  @override
  final String? firstname;
  @override
  final String email;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'UserFollow(userId: $userId, lastname: $lastname, firstname: $firstname, email: $email, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFollowImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, lastname, firstname, email, createdAt);

  /// Create a copy of UserFollow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFollowImplCopyWith<_$UserFollowImpl> get copyWith =>
      __$$UserFollowImplCopyWithImpl<_$UserFollowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFollowImplToJson(
      this,
    );
  }
}

abstract class _UserFollow implements UserFollow {
  const factory _UserFollow(
      {required final String userId,
      required final String? lastname,
      required final String? firstname,
      required final String email,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required final Timestamp createdAt}) = _$UserFollowImpl;

  factory _UserFollow.fromJson(Map<String, dynamic> json) =
      _$UserFollowImpl.fromJson;

  @override
  String get userId;
  @override
  String? get lastname;
  @override
  String? get firstname;
  @override
  String get email;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt;

  /// Create a copy of UserFollow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFollowImplCopyWith<_$UserFollowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
