import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generation.g.dart';
part 'generation.freezed.dart';

@Freezed()
class Generation with _$Generation {
  @JsonSerializable(explicitToJson: true)
  factory Generation(
      {String? id,
      required int progress,
      required String prompt,
      String? locationId}) = _Generation;

  factory Generation.fromJson(Map<String, Object?> json) =>
      _$GenerationFromJson(json);
}
