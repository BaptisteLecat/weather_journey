// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationImpl _$$GenerationImplFromJson(Map<String, dynamic> json) =>
    _$GenerationImpl(
      id: json['id'] as String?,
      progress: (json['progress'] as num).toInt(),
      prompt: json['prompt'] as String,
      generatedImage: json['generatedImage'] == null
          ? null
          : GeneratedImage.fromJson(
              json['generatedImage'] as Map<String, dynamic>),
      locationId: json['locationId'] as String?,
    );

Map<String, dynamic> _$$GenerationImplToJson(_$GenerationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress': instance.progress,
      'prompt': instance.prompt,
      'generatedImage': instance.generatedImage?.toJson(),
      'locationId': instance.locationId,
    };
