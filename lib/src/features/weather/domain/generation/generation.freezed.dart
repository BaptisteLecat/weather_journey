// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Generation _$GenerationFromJson(Map<String, dynamic> json) {
  return _Generation.fromJson(json);
}

/// @nodoc
mixin _$Generation {
  String? get id => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  GeneratedImage? get generatedImage => throw _privateConstructorUsedError;
  @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;

  /// Serializes this Generation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationCopyWith<Generation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationCopyWith<$Res> {
  factory $GenerationCopyWith(
          Generation value, $Res Function(Generation) then) =
      _$GenerationCopyWithImpl<$Res, Generation>;
  @useResult
  $Res call(
      {String? id,
      int progress,
      String prompt,
      GeneratedImage? generatedImage,
      @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
      DateTime? createdAt,
      String? locationId});

  $GeneratedImageCopyWith<$Res>? get generatedImage;
}

/// @nodoc
class _$GenerationCopyWithImpl<$Res, $Val extends Generation>
    implements $GenerationCopyWith<$Res> {
  _$GenerationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? progress = null,
    Object? prompt = null,
    Object? generatedImage = freezed,
    Object? createdAt = freezed,
    Object? locationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      generatedImage: freezed == generatedImage
          ? _value.generatedImage
          : generatedImage // ignore: cast_nullable_to_non_nullable
              as GeneratedImage?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneratedImageCopyWith<$Res>? get generatedImage {
    if (_value.generatedImage == null) {
      return null;
    }

    return $GeneratedImageCopyWith<$Res>(_value.generatedImage!, (value) {
      return _then(_value.copyWith(generatedImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerationImplCopyWith<$Res>
    implements $GenerationCopyWith<$Res> {
  factory _$$GenerationImplCopyWith(
          _$GenerationImpl value, $Res Function(_$GenerationImpl) then) =
      __$$GenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int progress,
      String prompt,
      GeneratedImage? generatedImage,
      @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
      DateTime? createdAt,
      String? locationId});

  @override
  $GeneratedImageCopyWith<$Res>? get generatedImage;
}

/// @nodoc
class __$$GenerationImplCopyWithImpl<$Res>
    extends _$GenerationCopyWithImpl<$Res, _$GenerationImpl>
    implements _$$GenerationImplCopyWith<$Res> {
  __$$GenerationImplCopyWithImpl(
      _$GenerationImpl _value, $Res Function(_$GenerationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? progress = null,
    Object? prompt = null,
    Object? generatedImage = freezed,
    Object? createdAt = freezed,
    Object? locationId = freezed,
  }) {
    return _then(_$GenerationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      generatedImage: freezed == generatedImage
          ? _value.generatedImage
          : generatedImage // ignore: cast_nullable_to_non_nullable
              as GeneratedImage?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GenerationImpl implements _Generation {
  _$GenerationImpl(
      {this.id,
      required this.progress,
      required this.prompt,
      this.generatedImage,
      @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
      required this.createdAt,
      this.locationId});

  factory _$GenerationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationImplFromJson(json);

  @override
  final String? id;
  @override
  final int progress;
  @override
  final String prompt;
  @override
  final GeneratedImage? generatedImage;
  @override
  @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
  final DateTime? createdAt;
  @override
  final String? locationId;

  @override
  String toString() {
    return 'Generation(id: $id, progress: $progress, prompt: $prompt, generatedImage: $generatedImage, createdAt: $createdAt, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.generatedImage, generatedImage) ||
                other.generatedImage == generatedImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, progress, prompt, generatedImage, createdAt, locationId);

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationImplCopyWith<_$GenerationImpl> get copyWith =>
      __$$GenerationImplCopyWithImpl<_$GenerationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationImplToJson(
      this,
    );
  }
}

abstract class _Generation implements Generation {
  factory _Generation(
      {final String? id,
      required final int progress,
      required final String prompt,
      final GeneratedImage? generatedImage,
      @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
      required final DateTime? createdAt,
      final String? locationId}) = _$GenerationImpl;

  factory _Generation.fromJson(Map<String, dynamic> json) =
      _$GenerationImpl.fromJson;

  @override
  String? get id;
  @override
  int get progress;
  @override
  String get prompt;
  @override
  GeneratedImage? get generatedImage;
  @override
  @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
  DateTime? get createdAt;
  @override
  String? get locationId;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationImplCopyWith<_$GenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
