import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/weather/domain/generated_image/generated_image.dart';

part 'generation.g.dart';
part 'generation.freezed.dart';

@Freezed()
@JsonSerializable(explicitToJson: true)
class Generation with _$Generation {
  factory Generation(
      {String? id,
      required int progress,
      required String prompt,
      GeneratedImage? generatedImage,
      String? locationId}) = _Generation;

  factory Generation.fromJson(Map<String, Object?> json) =>
      _$GenerationFromJson(json);
}
