// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generated_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneratedImage _$GeneratedImageFromJson(Map<String, dynamic> json) {
  return _GeneratedImage.fromJson(json);
}

/// @nodoc
mixin _$GeneratedImage {
  String get id => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;

  /// Serializes this GeneratedImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneratedImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratedImageCopyWith<GeneratedImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratedImageCopyWith<$Res> {
  factory $GeneratedImageCopyWith(
          GeneratedImage value, $Res Function(GeneratedImage) then) =
      _$GeneratedImageCopyWithImpl<$Res, GeneratedImage>;
  @useResult
  $Res call({String id, String hash, String uri, String? locationId});
}

/// @nodoc
class _$GeneratedImageCopyWithImpl<$Res, $Val extends GeneratedImage>
    implements $GeneratedImageCopyWith<$Res> {
  _$GeneratedImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratedImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hash = null,
    Object? uri = null,
    Object? locationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneratedImageImplCopyWith<$Res>
    implements $GeneratedImageCopyWith<$Res> {
  factory _$$GeneratedImageImplCopyWith(_$GeneratedImageImpl value,
          $Res Function(_$GeneratedImageImpl) then) =
      __$$GeneratedImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String hash, String uri, String? locationId});
}

/// @nodoc
class __$$GeneratedImageImplCopyWithImpl<$Res>
    extends _$GeneratedImageCopyWithImpl<$Res, _$GeneratedImageImpl>
    implements _$$GeneratedImageImplCopyWith<$Res> {
  __$$GeneratedImageImplCopyWithImpl(
      _$GeneratedImageImpl _value, $Res Function(_$GeneratedImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratedImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hash = null,
    Object? uri = null,
    Object? locationId = freezed,
  }) {
    return _then(_$GeneratedImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GeneratedImageImpl implements _GeneratedImage {
  _$GeneratedImageImpl(
      {required this.id,
      required this.hash,
      required this.uri,
      this.locationId});

  factory _$GeneratedImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratedImageImplFromJson(json);

  @override
  final String id;
  @override
  final String hash;
  @override
  final String uri;
  @override
  final String? locationId;

  @override
  String toString() {
    return 'GeneratedImage(id: $id, hash: $hash, uri: $uri, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, hash, uri, locationId);

  /// Create a copy of GeneratedImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratedImageImplCopyWith<_$GeneratedImageImpl> get copyWith =>
      __$$GeneratedImageImplCopyWithImpl<_$GeneratedImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneratedImageImplToJson(
      this,
    );
  }
}

abstract class _GeneratedImage implements GeneratedImage {
  factory _GeneratedImage(
      {required final String id,
      required final String hash,
      required final String uri,
      final String? locationId}) = _$GeneratedImageImpl;

  factory _GeneratedImage.fromJson(Map<String, dynamic> json) =
      _$GeneratedImageImpl.fromJson;

  @override
  String get id;
  @override
  String get hash;
  @override
  String get uri;
  @override
  String? get locationId;

  /// Create a copy of GeneratedImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratedImageImplCopyWith<_$GeneratedImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
