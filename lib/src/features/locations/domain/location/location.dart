import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';
part 'location.freezed.dart';

@Freezed()
@JsonSerializable(explicitToJson: true)
class Location with _$Location {
  const factory Location(
      {String? id,
      required double latitude,
      required double longitude,
      String? city}) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
