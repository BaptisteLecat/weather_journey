import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';

part 'user_id_location_parameter.g.dart';
part 'user_id_location_parameter.freezed.dart';

@Freezed()
class UserIdLocationParameter with _$UserIdLocationParameter {
  @JsonSerializable(explicitToJson: true)
  const factory UserIdLocationParameter({
    required String uid,
    required Location location,
  }) = _UseruidLocationParameter;

  factory UserIdLocationParameter.fromJson(Map<String, Object?> json) =>
      _$UserIdLocationParameterFromJson(json);
}
