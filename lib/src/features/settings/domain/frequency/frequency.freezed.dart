// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frequency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Frequency _$FrequencyFromJson(Map<String, dynamic> json) {
  return _Frequency.fromJson(json);
}

/// @nodoc
mixin _$Frequency {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FrequencyCopyWith<Frequency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FrequencyCopyWith<$Res> {
  factory $FrequencyCopyWith(Frequency value, $Res Function(Frequency) then) =
      _$FrequencyCopyWithImpl<$Res, Frequency>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$FrequencyCopyWithImpl<$Res, $Val extends Frequency>
    implements $FrequencyCopyWith<$Res> {
  _$FrequencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$_FrequencyCopyWith<$Res> implements $FrequencyCopyWith<$Res> {
  factory _$$_FrequencyCopyWith(
          _$_Frequency value, $Res Function(_$_Frequency) then) =
      __$$_FrequencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$_FrequencyCopyWithImpl<$Res>
    extends _$FrequencyCopyWithImpl<$Res, _$_Frequency>
    implements _$$_FrequencyCopyWith<$Res> {
  __$$_FrequencyCopyWithImpl(
      _$_Frequency _value, $Res Function(_$_Frequency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_Frequency(
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
class _$_Frequency implements _Frequency {
  const _$_Frequency({this.id, required this.name});

  factory _$_Frequency.fromJson(Map<String, dynamic> json) =>
      _$$_FrequencyFromJson(json);

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString() {
    return 'Frequency(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Frequency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FrequencyCopyWith<_$_Frequency> get copyWith =>
      __$$_FrequencyCopyWithImpl<_$_Frequency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FrequencyToJson(
      this,
    );
  }
}

abstract class _Frequency implements Frequency {
  const factory _Frequency({final String? id, required final String name}) =
      _$_Frequency;

  factory _Frequency.fromJson(Map<String, dynamic> json) =
      _$_Frequency.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FrequencyCopyWith<_$_Frequency> get copyWith =>
      throw _privateConstructorUsedError;
}
