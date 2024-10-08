// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String?,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      avatar: json['photoURL'] as String?,
      created: json['created'] as bool?,
      token: json['token'] as String?,
      hasSeenOnboarding: json['hasSeenOnboarding'] as bool?,
      styles: (json['styles'] as List<dynamic>?)
          ?.map((e) => Style.fromJson(e as Map<String, dynamic>))
          .toList(),
      frequencies: (json['frequencies'] as List<dynamic>?)
          ?.map((e) => Frequency.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'photoURL': instance.avatar,
      'created': instance.created,
      'token': instance.token,
      'hasSeenOnboarding': instance.hasSeenOnboarding,
      'styles': instance.styles,
      'frequencies': instance.frequencies,
      'likes': instance.likes,
      'followers': instance.followers,
      'followings': instance.followings,
    };
