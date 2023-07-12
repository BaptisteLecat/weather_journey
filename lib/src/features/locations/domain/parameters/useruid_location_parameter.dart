import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';

part 'useruid_location_parameter.g.dart';
part 'useruid_location_parameter.freezed.dart';

@Freezed()
class UseruidLocationParameter with _$UseruidLocationParameter {
  @JsonSerializable(explicitToJson: true)
  const factory UseruidLocationParameter({
    required String uid,
    required Location location,
  }) = _UseruidLocationParameter;

  factory UseruidLocationParameter.fromJson(Map<String, Object?> json) =>
      _$UseruidLocationParameterFromJson(json);
}
