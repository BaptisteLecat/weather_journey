import 'package:freezed_annotation/freezed_annotation.dart';

part 'frequency.g.dart';
part 'frequency.freezed.dart';

@Freezed()
class Frequency with _$Frequency {
  @JsonSerializable(explicitToJson: true)
  const factory Frequency({String? id, required String name}) = _Frequency;

  factory Frequency.fromJson(Map<String, Object?> json) =>
      _$FrequencyFromJson(json);
}
