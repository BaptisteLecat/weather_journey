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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneratedImage _$GeneratedImageFromJson(Map<String, dynamic> json) {
  return _GeneratedImage.fromJson(json);
}

/// @nodoc
mixin _$GeneratedImage {
  String get id => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_GeneratedImageCopyWith<$Res>
    implements $GeneratedImageCopyWith<$Res> {
  factory _$$_GeneratedImageCopyWith(
          _$_GeneratedImage value, $Res Function(_$_GeneratedImage) then) =
      __$$_GeneratedImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String hash, String uri, String? locationId});
}

/// @nodoc
class __$$_GeneratedImageCopyWithImpl<$Res>
    extends _$GeneratedImageCopyWithImpl<$Res, _$_GeneratedImage>
    implements _$$_GeneratedImageCopyWith<$Res> {
  __$$_GeneratedImageCopyWithImpl(
      _$_GeneratedImage _value, $Res Function(_$_GeneratedImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hash = null,
    Object? uri = null,
    Object? locationId = freezed,
  }) {
    return _then(_$_GeneratedImage(
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
class _$_GeneratedImage implements _GeneratedImage {
  _$_GeneratedImage(
      {required this.id,
      required this.hash,
      required this.uri,
      this.locationId});

  factory _$_GeneratedImage.fromJson(Map<String, dynamic> json) =>
      _$$_GeneratedImageFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneratedImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, hash, uri, locationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneratedImageCopyWith<_$_GeneratedImage> get copyWith =>
      __$$_GeneratedImageCopyWithImpl<_$_GeneratedImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneratedImageToJson(
      this,
    );
  }
}

abstract class _GeneratedImage implements GeneratedImage {
  factory _GeneratedImage(
      {required final String id,
      required final String hash,
      required final String uri,
      final String? locationId}) = _$_GeneratedImage;

  factory _GeneratedImage.fromJson(Map<String, dynamic> json) =
      _$_GeneratedImage.fromJson;

  @override
  String get id;
  @override
  String get hash;
  @override
  String get uri;
  @override
  String? get locationId;
  @override
  @JsonKey(ignore: true)
  _$$_GeneratedImageCopyWith<_$_GeneratedImage> get copyWith =>
      throw _privateConstructorUsedError;
}
