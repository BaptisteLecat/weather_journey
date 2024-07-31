// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      avatar: json['photoURL'] as String?,
      likes: (json['likes'] as List<dynamic>?)
          ?.map((e) => UserLike.fromJson(e as Map<String, dynamic>))
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => UserFollow.fromJson(e as Map<String, dynamic>))
          .toList(),
      followings: (json['followings'] as List<dynamic>?)
          ?.map((e) => UserFollow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'photoURL': instance.avatar,
      'likes': instance.likes?.map((e) => e.toJson()).toList(),
      'followers': instance.followers?.map((e) => e.toJson()).toList(),
      'followings': instance.followings?.map((e) => e.toJson()).toList(),
    };
