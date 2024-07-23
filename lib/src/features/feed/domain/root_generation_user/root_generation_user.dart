import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_generation_user.g.dart';
part 'root_generation_user.freezed.dart';

@Freezed()
class RootGenerationUser with _$RootGenerationUser {
  @JsonSerializable(explicitToJson: true)
  const factory RootGenerationUser(
      {required String id, required String email}) = _RootGenerationUser;

  factory RootGenerationUser.fromJson(Map<String, Object?> json) =>
      _$RootGenerationUserFromJson(json);
}
