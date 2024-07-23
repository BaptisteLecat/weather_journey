// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_location_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UseruidLocationParameterImpl _$$UseruidLocationParameterImplFromJson(
        Map<String, dynamic> json) =>
    _$UseruidLocationParameterImpl(
      uid: json['uid'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UseruidLocationParameterImplToJson(
        _$UseruidLocationParameterImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'location': instance.location.toJson(),
    };
