import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_like/root_generation_like.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_user/root_generation_user.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';
import 'package:weatherjourney/src/features/weather/domain/generation/generation.dart';

part 'root_generation.g.dart';
part 'root_generation.freezed.dart';

@Freezed()
class RootGeneration with _$RootGeneration {
  @JsonSerializable(explicitToJson: true)
  const factory RootGeneration({
    required String id,
    required Location location,
    required Generation generation,
    required RootGenerationUser user,
    required List<RootGenerationLike>? likes,
    required int? likesCount,
  }) = _RootGeneration;

  factory RootGeneration.fromJson(Map<String, Object?> json) =>
      _$RootGenerationFromJson(json);
}
