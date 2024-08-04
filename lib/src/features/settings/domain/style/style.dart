import 'package:freezed_annotation/freezed_annotation.dart';

part 'style.g.dart';
part 'style.freezed.dart';

@Freezed()
class Style with _$Style {
  @JsonSerializable(explicitToJson: true)
  const factory Style({String? id, required String name}) = _Style;

  factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
}
