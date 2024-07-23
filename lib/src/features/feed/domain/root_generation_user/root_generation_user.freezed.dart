// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_generation_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RootGenerationUser _$RootGenerationUserFromJson(Map<String, dynamic> json) {
  return _RootGenerationUser.fromJson(json);
}

/// @nodoc
mixin _$RootGenerationUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this RootGenerationUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RootGenerationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RootGenerationUserCopyWith<RootGenerationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootGenerationUserCopyWith<$Res> {
  factory $RootGenerationUserCopyWith(
          RootGenerationUser value, $Res Function(RootGenerationUser) then) =
      _$RootGenerationUserCopyWithImpl<$Res, RootGenerationUser>;
  @useResult
  $Res call({String id, String email});
}

/// @nodoc
class _$RootGenerationUserCopyWithImpl<$Res, $Val extends RootGenerationUser>
    implements $RootGenerationUserCopyWith<$Res> {
  _$RootGenerationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootGenerationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RootGenerationUserImplCopyWith<$Res>
    implements $RootGenerationUserCopyWith<$Res> {
  factory _$$RootGenerationUserImplCopyWith(_$RootGenerationUserImpl value,
          $Res Function(_$RootGenerationUserImpl) then) =
      __$$RootGenerationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email});
}

/// @nodoc
class __$$RootGenerationUserImplCopyWithImpl<$Res>
    extends _$RootGenerationUserCopyWithImpl<$Res, _$RootGenerationUserImpl>
    implements _$$RootGenerationUserImplCopyWith<$Res> {
  __$$RootGenerationUserImplCopyWithImpl(_$RootGenerationUserImpl _value,
      $Res Function(_$RootGenerationUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootGenerationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
  }) {
    return _then(_$RootGenerationUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RootGenerationUserImpl implements _RootGenerationUser {
  const _$RootGenerationUserImpl({required this.id, required this.email});

  factory _$RootGenerationUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RootGenerationUserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;

  @override
  String toString() {
    return 'RootGenerationUser(id: $id, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootGenerationUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  /// Create a copy of RootGenerationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RootGenerationUserImplCopyWith<_$RootGenerationUserImpl> get copyWith =>
      __$$RootGenerationUserImplCopyWithImpl<_$RootGenerationUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RootGenerationUserImplToJson(
      this,
    );
  }
}

abstract class _RootGenerationUser implements RootGenerationUser {
  const factory _RootGenerationUser(
      {required final String id,
      required final String email}) = _$RootGenerationUserImpl;

  factory _RootGenerationUser.fromJson(Map<String, dynamic> json) =
      _$RootGenerationUserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;

  /// Create a copy of RootGenerationUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RootGenerationUserImplCopyWith<_$RootGenerationUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
