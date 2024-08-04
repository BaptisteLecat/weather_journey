// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_generation_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RootGenerationLikeImpl _$$RootGenerationLikeImplFromJson(
        Map<String, dynamic> json) =>
    _$RootGenerationLikeImpl(
      user: RootGenerationUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: createdAtFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$RootGenerationLikeImplToJson(
        _$RootGenerationLikeImpl instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'createdAt': createdAtToJson(instance.createdAt),
    };
