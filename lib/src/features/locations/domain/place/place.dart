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
  @JsonSerializable(explicitToJson: true)
  const factory Place({
    @JsonKey(name: 'place_id')
        required int placeId,
    @JsonKey(name: 'licence')
        required String licence,
    @JsonKey(name: 'osm_type')
        String? osmType,
    @JsonKey(name: 'osm_id')
        int? osmId,
    @JsonKey(name: 'boundingbox')
        required List<String> boundingBox,
    @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
        required double lat,
    @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
        required double lon,
    @JsonKey(name: 'display_name')
        required String displayName,
    required String type,
    required double importance,
    String? icon,
    Map<String, String>? address,
    Map<String, String>? extraTags,
    Map<String, String>? nameDetails,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
