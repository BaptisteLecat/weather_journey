// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      placeId: (json['place_id'] as num).toInt(),
      licence: json['licence'] as String,
      osmType: json['osm_type'] as String?,
      osmId: (json['osm_id'] as num?)?.toInt(),
      boundingBox: (json['boundingbox'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lat: _coordinatesFromJson(json['lat'] as String?),
      lon: _coordinatesFromJson(json['lon'] as String?),
      displayName: json['display_name'] as String,
      type: json['type'] as String,
      importance: (json['importance'] as num).toDouble(),
      icon: json['icon'] as String?,
      address: (json['address'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      extraTags: (json['extraTags'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      nameDetails: (json['nameDetails'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'boundingbox': instance.boundingBox,
      'lat': _coordinatesToJson(instance.lat),
      'lon': _coordinatesToJson(instance.lon),
      'display_name': instance.displayName,
      'type': instance.type,
      'importance': instance.importance,
      'icon': instance.icon,
      'address': instance.address,
      'extraTags': instance.extraTags,
      'nameDetails': instance.nameDetails,
    };
