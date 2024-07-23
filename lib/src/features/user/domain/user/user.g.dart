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
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'photoURL': instance.avatar,
    };
