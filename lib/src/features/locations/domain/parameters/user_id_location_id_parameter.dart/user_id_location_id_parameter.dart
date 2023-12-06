import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id_location_id_parameter.g.dart';
part 'user_id_location_id_parameter.freezed.dart';

@Freezed()
@JsonSerializable(explicitToJson: true)
class UserIdLocationIdParameter with _$UserIdLocationIdParameter {
  const factory UserIdLocationIdParameter({
    required String userId,
    required String locationId,
  }) = _UserIdLocationIdParameter;

  factory UserIdLocationIdParameter.fromJson(Map<String, Object?> json) =>
      _$UserIdLocationIdParameterFromJson(json);
}
