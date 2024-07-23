import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';
part 'location.freezed.dart';

@Freezed()
class Location with _$Location {
  @JsonSerializable(explicitToJson: true)
  const Location._();
  const factory Location(
      {String? id,
      required double latitude,
      required double longitude,
      String? city}) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);

  String getCityText() {
    String cityText = city!.split(", ").first;
    if (city!.split(", ").length >= 6) {
      cityText = city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = city!.split(", ").take(2).join(" ");
    }
    return cityText;
  }
}
