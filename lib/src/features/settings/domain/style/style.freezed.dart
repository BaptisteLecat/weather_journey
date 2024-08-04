// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Style _$StyleFromJson(Map<String, dynamic> json) {
  return _Style.fromJson(json);
}

/// @nodoc
mixin _$Style {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Style to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Style
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StyleCopyWith<Style> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleCopyWith<$Res> {
  factory $StyleCopyWith(Style value, $Res Function(Style) then) =
      _$StyleCopyWithImpl<$Res, Style>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$StyleCopyWithImpl<$Res, $Val extends Style>
    implements $StyleCopyWith<$Res> {
  _$StyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Style
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyleImplCopyWith<$Res> implements $StyleCopyWith<$Res> {
  factory _$$StyleImplCopyWith(
          _$StyleImpl value, $Res Function(_$StyleImpl) then) =
      __$$StyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$StyleImplCopyWithImpl<$Res>
    extends _$StyleCopyWithImpl<$Res, _$StyleImpl>
    implements _$$StyleImplCopyWith<$Res> {
  __$$StyleImplCopyWithImpl(
      _$StyleImpl _value, $Res Function(_$StyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Style
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$StyleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StyleImpl implements _Style {
  const _$StyleImpl({this.id, required this.name});

  factory _$StyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$StyleImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString() {
    return 'Style(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Style
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StyleImplCopyWith<_$StyleImpl> get copyWith =>
      __$$StyleImplCopyWithImpl<_$StyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StyleImplToJson(
      this,
    );
  }
}

abstract class _Style implements Style {
  const factory _Style({final String? id, required final String name}) =
      _$StyleImpl;

  factory _Style.fromJson(Map<String, dynamic> json) = _$StyleImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;

  /// Create a copy of Style
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StyleImplCopyWith<_$StyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
