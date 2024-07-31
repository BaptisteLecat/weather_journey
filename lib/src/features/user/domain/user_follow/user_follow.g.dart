// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFollowImpl _$$UserFollowImplFromJson(Map<String, dynamic> json) =>
    _$UserFollowImpl(
      userId: json['userId'] as String,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String,
      createdAt: createdAtFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$UserFollowImplToJson(_$UserFollowImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'createdAt': createdAtToJson(instance.createdAt),
    };
