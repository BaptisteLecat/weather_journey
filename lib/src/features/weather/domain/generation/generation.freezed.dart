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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Generation _$GenerationFromJson(Map<String, dynamic> json) {
  return _Generation.fromJson(json);
}

/// @nodoc
mixin _$Generation {
  String? get id => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  GeneratedImage? get generatedImage => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? progress = null,
    Object? prompt = null,
    Object? generatedImage = freezed,
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
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

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
abstract class _$$_GenerationCopyWith<$Res>
    implements $GenerationCopyWith<$Res> {
  factory _$$_GenerationCopyWith(
          _$_Generation value, $Res Function(_$_Generation) then) =
      __$$_GenerationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int progress,
      String prompt,
      GeneratedImage? generatedImage,
      String? locationId});

  @override
  $GeneratedImageCopyWith<$Res>? get generatedImage;
}

/// @nodoc
class __$$_GenerationCopyWithImpl<$Res>
    extends _$GenerationCopyWithImpl<$Res, _$_Generation>
    implements _$$_GenerationCopyWith<$Res> {
  __$$_GenerationCopyWithImpl(
      _$_Generation _value, $Res Function(_$_Generation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? progress = null,
    Object? prompt = null,
    Object? generatedImage = freezed,
    Object? locationId = freezed,
  }) {
    return _then(_$_Generation(
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
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Generation implements _Generation {
  _$_Generation(
      {this.id,
      required this.progress,
      required this.prompt,
      this.generatedImage,
      this.locationId});

  factory _$_Generation.fromJson(Map<String, dynamic> json) =>
      _$$_GenerationFromJson(json);

  @override
  final String? id;
  @override
  final int progress;
  @override
  final String prompt;
  @override
  final GeneratedImage? generatedImage;
  @override
  final String? locationId;

  @override
  String toString() {
    return 'Generation(id: $id, progress: $progress, prompt: $prompt, generatedImage: $generatedImage, locationId: $locationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Generation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.generatedImage, generatedImage) ||
                other.generatedImage == generatedImage) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, progress, prompt, generatedImage, locationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerationCopyWith<_$_Generation> get copyWith =>
      __$$_GenerationCopyWithImpl<_$_Generation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenerationToJson(
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
      final String? locationId}) = _$_Generation;

  factory _Generation.fromJson(Map<String, dynamic> json) =
      _$_Generation.fromJson;

  @override
  String? get id;
  @override
  int get progress;
  @override
  String get prompt;
  @override
  GeneratedImage? get generatedImage;
  @override
  String? get locationId;
  @override
  @JsonKey(ignore: true)
  _$$_GenerationCopyWith<_$_Generation> get copyWith =>
      throw _privateConstructorUsedError;
}
