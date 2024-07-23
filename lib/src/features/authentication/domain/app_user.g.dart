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
      avatar: json['avatar'] as String?,
      created: json['created'] as bool?,
      token: json['token'] as String?,
      hasSeenOnboarding: json['hasSeenOnboarding'] as bool?,
      styles: (json['styles'] as List<dynamic>?)
          ?.map((e) => Style.fromJson(e as Map<String, dynamic>))
          .toList(),
      frequencies: (json['frequencies'] as List<dynamic>?)
          ?.map((e) => Frequency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
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
