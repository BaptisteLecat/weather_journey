// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String?,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      created: json['created'] as bool?,
      token: json['token'] as String?,
      hasSeenOnboarding: json['hasSeenOnboarding'] as bool?,
      styles:
          (json['styles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      frequencies: (json['frequencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'avatar': instance.avatar,
      'created': instance.created,
      'token': instance.token,
      'hasSeenOnboarding': instance.hasSeenOnboarding,
      'styles': instance.styles,
      'frequencies': instance.frequencies,
    };
