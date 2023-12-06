import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_dto.g.dart';
part 'generation_dto.freezed.dart';

@Freezed()
class GenerationDto with _$GenerationDto {
  @JsonSerializable(explicitToJson: true)
  factory GenerationDto({String? time, String? weather}) = _GenerationDto;

  factory GenerationDto.fromJson(Map<String, Object?> json) =>
      _$GenerationDtoFromJson(json);
}
