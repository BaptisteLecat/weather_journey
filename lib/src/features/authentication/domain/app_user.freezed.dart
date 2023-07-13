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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  @JsonKey(ignore: true)
  firebase.User? get firebaseAppUser => throw _privateConstructorUsedError;
  List<String>? get styles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(ignore: true) firebase.User? firebaseAppUser,
      List<String>? styles});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? firebaseAppUser = freezed,
    Object? styles = freezed,
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
      firebaseAppUser: freezed == firebaseAppUser
          ? _value.firebaseAppUser
          : firebaseAppUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      styles: freezed == styles
          ? _value.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
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
      @JsonKey(ignore: true) firebase.User? firebaseAppUser,
      List<String>? styles});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

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
    Object? firebaseAppUser = freezed,
    Object? styles = freezed,
  }) {
    return _then(_$_AppUser(
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
      firebaseAppUser: freezed == firebaseAppUser
          ? _value.firebaseAppUser
          : firebaseAppUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      styles: freezed == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser extends _AppUser {
  const _$_AppUser(
      {this.id,
      this.lastname,
      this.firstname,
      this.email,
      this.avatar,
      this.created,
      this.token,
      @JsonKey(ignore: true) this.firebaseAppUser,
      final List<String>? styles})
      : _styles = styles,
        super._();

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

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
  @JsonKey(ignore: true)
  final firebase.User? firebaseAppUser;
  final List<String>? _styles;
  @override
  List<String>? get styles {
    final value = _styles;
    if (value == null) return null;
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppUser(id: $id, lastname: $lastname, firstname: $firstname, email: $email, avatar: $avatar, created: $created, token: $token, firebaseAppUser: $firebaseAppUser, styles: $styles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseAppUser, firebaseAppUser) ||
                other.firebaseAppUser == firebaseAppUser) &&
            const DeepCollectionEquality().equals(other._styles, _styles));
  }

  @JsonKey(ignore: true)
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
      firebaseAppUser,
      const DeepCollectionEquality().hash(_styles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
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
      @JsonKey(ignore: true) final firebase.User? firebaseAppUser,
      final List<String>? styles}) = _$_AppUser;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

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
  @JsonKey(ignore: true)
  firebase.User? get firebaseAppUser;
  @override
  List<String>? get styles;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
