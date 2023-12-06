import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.g.dart';
part 'place.freezed.dart';

double _coordinatesFromJson(String? coordinate) {
  if (coordinate == null) {
    return 0;
  }
  return double.parse(coordinate);
}

String _coordinatesToJson(double coordinate) => coordinate.toString();

@Freezed()
class Place with _$Place {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Place({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'place_id') required int placeId,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'licence') required String licence,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'osm_type') String? osmType,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'osm_id') int? osmId,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'boundingbox') required List<String> boundingBox,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
    required double lat,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
    required double lon,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'display_name') required String displayName,
    required String type,
    required double importance,
    String? icon,
    Map<String, String>? address,
    Map<String, String>? extraTags,
    Map<String, String>? nameDetails,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
