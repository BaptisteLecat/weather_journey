// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerationDto _$GenerationDtoFromJson(Map<String, dynamic> json) {
  return _GenerationDto.fromJson(json);
}

/// @nodoc
mixin _$GenerationDto {
  String? get time => throw _privateConstructorUsedError;
  String? get weather => throw _privateConstructorUsedError;

  /// Serializes this GenerationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationDtoCopyWith<GenerationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationDtoCopyWith<$Res> {
  factory $GenerationDtoCopyWith(
          GenerationDto value, $Res Function(GenerationDto) then) =
      _$GenerationDtoCopyWithImpl<$Res, GenerationDto>;
  @useResult
  $Res call({String? time, String? weather});
}

/// @nodoc
class _$GenerationDtoCopyWithImpl<$Res, $Val extends GenerationDto>
    implements $GenerationDtoCopyWith<$Res> {
  _$GenerationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerationDtoImplCopyWith<$Res>
    implements $GenerationDtoCopyWith<$Res> {
  factory _$$GenerationDtoImplCopyWith(
          _$GenerationDtoImpl value, $Res Function(_$GenerationDtoImpl) then) =
      __$$GenerationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? time, String? weather});
}

/// @nodoc
class __$$GenerationDtoImplCopyWithImpl<$Res>
    extends _$GenerationDtoCopyWithImpl<$Res, _$GenerationDtoImpl>
    implements _$$GenerationDtoImplCopyWith<$Res> {
  __$$GenerationDtoImplCopyWithImpl(
      _$GenerationDtoImpl _value, $Res Function(_$GenerationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weather = freezed,
  }) {
    return _then(_$GenerationDtoImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GenerationDtoImpl implements _GenerationDto {
  _$GenerationDtoImpl({this.time, this.weather});

  factory _$GenerationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationDtoImplFromJson(json);

  @override
  final String? time;
  @override
  final String? weather;

  @override
  String toString() {
    return 'GenerationDto(time: $time, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationDtoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, weather);

  /// Create a copy of GenerationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationDtoImplCopyWith<_$GenerationDtoImpl> get copyWith =>
      __$$GenerationDtoImplCopyWithImpl<_$GenerationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationDtoImplToJson(
      this,
    );
  }
}

abstract class _GenerationDto implements GenerationDto {
  factory _GenerationDto({final String? time, final String? weather}) =
      _$GenerationDtoImpl;

  factory _GenerationDto.fromJson(Map<String, dynamic> json) =
      _$GenerationDtoImpl.fromJson;

  @override
  String? get time;
  @override
  String? get weather;

  /// Create a copy of GenerationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationDtoImplCopyWith<_$GenerationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
