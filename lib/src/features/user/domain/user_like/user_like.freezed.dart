// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLike _$UserLikeFromJson(Map<String, dynamic> json) {
  return _UserLike.fromJson(json);
}

/// @nodoc
mixin _$UserLike {
  RootGeneration get rootGeneration => throw _privateConstructorUsedError;
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserLike to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLikeCopyWith<UserLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLikeCopyWith<$Res> {
  factory $UserLikeCopyWith(UserLike value, $Res Function(UserLike) then) =
      _$UserLikeCopyWithImpl<$Res, UserLike>;
  @useResult
  $Res call(
      {RootGeneration rootGeneration,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});

  $RootGenerationCopyWith<$Res> get rootGeneration;
}

/// @nodoc
class _$UserLikeCopyWithImpl<$Res, $Val extends UserLike>
    implements $UserLikeCopyWith<$Res> {
  _$UserLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootGeneration = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      rootGeneration: null == rootGeneration
          ? _value.rootGeneration
          : rootGeneration // ignore: cast_nullable_to_non_nullable
              as RootGeneration,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RootGenerationCopyWith<$Res> get rootGeneration {
    return $RootGenerationCopyWith<$Res>(_value.rootGeneration, (value) {
      return _then(_value.copyWith(rootGeneration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserLikeImplCopyWith<$Res>
    implements $UserLikeCopyWith<$Res> {
  factory _$$UserLikeImplCopyWith(
          _$UserLikeImpl value, $Res Function(_$UserLikeImpl) then) =
      __$$UserLikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RootGeneration rootGeneration,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      Timestamp createdAt});

  @override
  $RootGenerationCopyWith<$Res> get rootGeneration;
}

/// @nodoc
class __$$UserLikeImplCopyWithImpl<$Res>
    extends _$UserLikeCopyWithImpl<$Res, _$UserLikeImpl>
    implements _$$UserLikeImplCopyWith<$Res> {
  __$$UserLikeImplCopyWithImpl(
      _$UserLikeImpl _value, $Res Function(_$UserLikeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootGeneration = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserLikeImpl(
      rootGeneration: null == rootGeneration
          ? _value.rootGeneration
          : rootGeneration // ignore: cast_nullable_to_non_nullable
              as RootGeneration,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserLikeImpl implements _UserLike {
  const _$UserLikeImpl(
      {required this.rootGeneration,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required this.createdAt});

  factory _$UserLikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLikeImplFromJson(json);

  @override
  final RootGeneration rootGeneration;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'UserLike(rootGeneration: $rootGeneration, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLikeImpl &&
            (identical(other.rootGeneration, rootGeneration) ||
                other.rootGeneration == rootGeneration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rootGeneration, createdAt);

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLikeImplCopyWith<_$UserLikeImpl> get copyWith =>
      __$$UserLikeImplCopyWithImpl<_$UserLikeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLikeImplToJson(
      this,
    );
  }
}

abstract class _UserLike implements UserLike {
  const factory _UserLike(
      {required final RootGeneration rootGeneration,
      @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
      required final Timestamp createdAt}) = _$UserLikeImpl;

  factory _UserLike.fromJson(Map<String, dynamic> json) =
      _$UserLikeImpl.fromJson;

  @override
  RootGeneration get rootGeneration;
  @override
  @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
  Timestamp get createdAt;

  /// Create a copy of UserLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLikeImplCopyWith<_$UserLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
