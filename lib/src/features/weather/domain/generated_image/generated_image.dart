import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated_image.g.dart';
part 'generated_image.freezed.dart';

@Freezed()
@JsonSerializable(explicitToJson: true)
class GeneratedImage with _$GeneratedImage {
  factory GeneratedImage(
      {required String id,
      required String hash,
      required String uri,
      String? locationId}) = _GeneratedImage;

  factory GeneratedImage.fromJson(Map<String, Object?> json) =>
      _$GeneratedImageFromJson(json);
}
