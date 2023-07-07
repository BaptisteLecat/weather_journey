import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';
part 'location.freezed.dart';

@Freezed()
class Location with _$Location {
  @JsonSerializable(explicitToJson: true)
  const factory Location(
      {String? id,
      required double latitude,
      required double longitude,
      String? city}) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
