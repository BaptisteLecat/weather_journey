// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_location_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UseruidLocationParameter _$$_UseruidLocationParameterFromJson(
        Map<String, dynamic> json) =>
    _$_UseruidLocationParameter(
      uid: json['uid'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UseruidLocationParameterToJson(
        _$_UseruidLocationParameter instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'location': instance.location.toJson(),
    };
