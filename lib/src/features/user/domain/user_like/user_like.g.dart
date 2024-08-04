// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLikeImpl _$$UserLikeImplFromJson(Map<String, dynamic> json) =>
    _$UserLikeImpl(
      rootGeneration: RootGeneration.fromJson(
          json['rootGeneration'] as Map<String, dynamic>),
      createdAt: createdAtFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$UserLikeImplToJson(_$UserLikeImpl instance) =>
    <String, dynamic>{
      'rootGeneration': instance.rootGeneration.toJson(),
      'createdAt': createdAtToJson(instance.createdAt),
    };
