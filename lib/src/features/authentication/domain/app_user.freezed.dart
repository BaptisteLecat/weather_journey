// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String? get id => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool? get created => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  bool? get hasSeenOnboarding =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  firebase.User? get firebaseAppUser => throw _privateConstructorUsedError;
  List<Style>? get styles => throw _privateConstructorUsedError;
  List<Frequency>? get frequencies => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String? id,
      String? lastname,
      String? firstname,
      String? email,
      String? avatar,
      bool? created,
      String? token,
      bool? hasSeenOnboarding,
      @JsonKey(includeFromJson: false, includeToJson: false)
      firebase.User? firebaseAppUser,
      List<Style>? styles,
      List<Frequency>? frequencies});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created = freezed,
    Object? token = freezed,
    Object? hasSeenOnboarding = freezed,
    Object? firebaseAppUser = freezed,
    Object? styles = freezed,
    Object? frequencies = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeenOnboarding: freezed == hasSeenOnboarding
          ? _value.hasSeenOnboarding
          : hasSeenOnboarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      firebaseAppUser: freezed == firebaseAppUser
          ? _value.firebaseAppUser
          : firebaseAppUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      styles: freezed == styles
          ? _value.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<Style>?,
      frequencies: freezed == frequencies
          ? _value.frequencies
          : frequencies // ignore: cast_nullable_to_non_nullable
              as List<Frequency>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? lastname,
      String? firstname,
      String? email,
      String? avatar,
      bool? created,
      String? token,
      bool? hasSeenOnboarding,
      @JsonKey(includeFromJson: false, includeToJson: false)
      firebase.User? firebaseAppUser,
      List<Style>? styles,
      List<Frequency>? frequencies});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created = freezed,
    Object? token = freezed,
    Object? hasSeenOnboarding = freezed,
    Object? firebaseAppUser = freezed,
    Object? styles = freezed,
    Object? frequencies = freezed,
  }) {
    return _then(_$AppUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeenOnboarding: freezed == hasSeenOnboarding
          ? _value.hasSeenOnboarding
          : hasSeenOnboarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      firebaseAppUser: freezed == firebaseAppUser
          ? _value.firebaseAppUser
          : firebaseAppUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      styles: freezed == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<Style>?,
      frequencies: freezed == frequencies
          ? _value._frequencies
          : frequencies // ignore: cast_nullable_to_non_nullable
              as List<Frequency>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl extends _AppUser {
  const _$AppUserImpl(
      {this.id,
      this.lastname,
      this.firstname,
      this.email,
      this.avatar,
      this.created,
      this.token,
      this.hasSeenOnboarding,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.firebaseAppUser,
      final List<Style>? styles,
      final List<Frequency>? frequencies})
      : _styles = styles,
        _frequencies = frequencies,
        super._();

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? lastname;
  @override
  final String? firstname;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  final bool? created;
  @override
  final String? token;
  @override
  final bool? hasSeenOnboarding;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final firebase.User? firebaseAppUser;
  final List<Style>? _styles;
  @override
  List<Style>? get styles {
    final value = _styles;
    if (value == null) return null;
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Frequency>? _frequencies;
  @override
  List<Frequency>? get frequencies {
    final value = _frequencies;
    if (value == null) return null;
    if (_frequencies is EqualUnmodifiableListView) return _frequencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppUser(id: $id, lastname: $lastname, firstname: $firstname, email: $email, avatar: $avatar, created: $created, token: $token, hasSeenOnboarding: $hasSeenOnboarding, firebaseAppUser: $firebaseAppUser, styles: $styles, frequencies: $frequencies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.hasSeenOnboarding, hasSeenOnboarding) ||
                other.hasSeenOnboarding == hasSeenOnboarding) &&
            (identical(other.firebaseAppUser, firebaseAppUser) ||
                other.firebaseAppUser == firebaseAppUser) &&
            const DeepCollectionEquality().equals(other._styles, _styles) &&
            const DeepCollectionEquality()
                .equals(other._frequencies, _frequencies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lastname,
      firstname,
      email,
      avatar,
      created,
      token,
      hasSeenOnboarding,
      firebaseAppUser,
      const DeepCollectionEquality().hash(_styles),
      const DeepCollectionEquality().hash(_frequencies));

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  const factory _AppUser(
      {final String? id,
      final String? lastname,
      final String? firstname,
      final String? email,
      final String? avatar,
      final bool? created,
      final String? token,
      final bool? hasSeenOnboarding,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final firebase.User? firebaseAppUser,
      final List<Style>? styles,
      final List<Frequency>? frequencies}) = _$AppUserImpl;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get lastname;
  @override
  String? get firstname;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  bool? get created;
  @override
  String? get token;
  @override
  bool? get hasSeenOnboarding; // ignore: invalid_annotation_target
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  firebase.User? get firebaseAppUser;
  @override
  List<Style>? get styles;
  @override
  List<Frequency>? get frequencies;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
