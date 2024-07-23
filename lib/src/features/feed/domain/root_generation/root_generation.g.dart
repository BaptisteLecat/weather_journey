// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RootGenerationImpl _$$RootGenerationImplFromJson(Map<String, dynamic> json) =>
    _$RootGenerationImpl(
      id: json['id'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      generation:
          Generation.fromJson(json['generation'] as Map<String, dynamic>),
      user: RootGenerationUser.fromJson(json['user'] as Map<String, dynamic>),
      likes: (json['likes'] as List<dynamic>?)
          ?.map((e) => RootGenerationLike.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RootGenerationImplToJson(
        _$RootGenerationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location.toJson(),
      'generation': instance.generation.toJson(),
      'user': instance.user.toJson(),
      'likes': instance.likes?.map((e) => e.toJson()).toList(),
    };
