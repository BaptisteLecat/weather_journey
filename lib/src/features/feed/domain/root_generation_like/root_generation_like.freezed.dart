// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_generation_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RootGenerationLike _$RootGenerationLikeFromJson(Map<String, dynamic> json) {
  return _RootGenerationLike.fromJson(json);
}

/// @nodoc
mixin _$RootGenerationLike {
  RootGenerationUser get user => throw _privateConstructorUsedError;
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RootGenerationLike to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RootGenerationLikeCopyWith<RootGenerationLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootGenerationLikeCopyWith<$Res> {
  factory $RootGenerationLikeCopyWith(
          RootGenerationLike value, $Res Function(RootGenerationLike) then) =
      _$RootGenerationLikeCopyWithImpl<$Res, RootGenerationLike>;
  @useResult
  $Res call(
      {RootGenerationUser user,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});

  $RootGenerationUserCopyWith<$Res> get user;
}

/// @nodoc
class _$RootGenerationLikeCopyWithImpl<$Res, $Val extends RootGenerationLike>
    implements $RootGenerationLikeCopyWith<$Res> {
  _$RootGenerationLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RootGenerationUser,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RootGenerationUserCopyWith<$Res> get user {
    return $RootGenerationUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RootGenerationLikeImplCopyWith<$Res>
    implements $RootGenerationLikeCopyWith<$Res> {
  factory _$$RootGenerationLikeImplCopyWith(_$RootGenerationLikeImpl value,
          $Res Function(_$RootGenerationLikeImpl) then) =
      __$$RootGenerationLikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RootGenerationUser user,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});

  @override
  $RootGenerationUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$RootGenerationLikeImplCopyWithImpl<$Res>
    extends _$RootGenerationLikeCopyWithImpl<$Res, _$RootGenerationLikeImpl>
    implements _$$RootGenerationLikeImplCopyWith<$Res> {
  __$$RootGenerationLikeImplCopyWithImpl(_$RootGenerationLikeImpl _value,
      $Res Function(_$RootGenerationLikeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_$RootGenerationLikeImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RootGenerationUser,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RootGenerationLikeImpl implements _RootGenerationLike {
  const _$RootGenerationLikeImpl(
      {required this.user,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required this.createdAt});

  factory _$RootGenerationLikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RootGenerationLikeImplFromJson(json);

  @override
  final RootGenerationUser user;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'RootGenerationLike(user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootGenerationLikeImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, createdAt);

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RootGenerationLikeImplCopyWith<_$RootGenerationLikeImpl> get copyWith =>
      __$$RootGenerationLikeImplCopyWithImpl<_$RootGenerationLikeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RootGenerationLikeImplToJson(
      this,
    );
  }
}

abstract class _RootGenerationLike implements RootGenerationLike {
  const factory _RootGenerationLike(
      {required final RootGenerationUser user,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required final Timestamp createdAt}) = _$RootGenerationLikeImpl;

  factory _RootGenerationLike.fromJson(Map<String, dynamic> json) =
      _$RootGenerationLikeImpl.fromJson;

  @override
  RootGenerationUser get user;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt;

  /// Create a copy of RootGenerationLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RootGenerationLikeImplCopyWith<_$RootGenerationLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
