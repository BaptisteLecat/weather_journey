import 'package:freezed_annotation/freezed_annotation.dart';

part 'frequency.g.dart';
part 'frequency.freezed.dart';

@Freezed()
@JsonSerializable(explicitToJson: true)
class Frequency with _$Frequency {
  const factory Frequency({String? id, required String name}) = _Frequency;

  factory Frequency.fromJson(Map<String, Object?> json) =>
      _$FrequencyFromJson(json);
}
