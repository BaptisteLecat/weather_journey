import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/weather/domain/generated_image/generated_image.dart';

part 'generation.g.dart';
part 'generation.freezed.dart';

Timestamp? _createdAtToJson(DateTime? value) =>
    value != null ? Timestamp.fromDate(value) : null;

DateTime? _createdAtFromJson(Timestamp? value) => value?.toDate();

@Freezed()
class Generation with _$Generation {
  @JsonSerializable(explicitToJson: true)
  factory Generation(
      {String? id,
      required int progress,
      required String prompt,
      GeneratedImage? generatedImage,
      @JsonKey(toJson: _createdAtToJson, fromJson: _createdAtFromJson)
      required DateTime? createdAt,
      String? locationId}) = _Generation;

  factory Generation.fromJson(Map<String, Object?> json) =>
      _$GenerationFromJson(json);
}
