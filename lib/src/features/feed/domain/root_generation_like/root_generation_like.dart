import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_user/root_generation_user.dart';

part 'root_generation_like.g.dart';
part 'root_generation_like.freezed.dart';

createdAtFromJson(Object? json) {
  if (json is Timestamp) {
    return json;
  } else if (json is String) {
    return Timestamp.fromDate(DateTime.parse(json));
  } else {
    throw Exception('Invalid JSON value');
  }
}

createdAtToJson(Timestamp createdAt) {
  return createdAt.toDate().toIso8601String();
}

@Freezed()
class RootGenerationLike with _$RootGenerationLike {
  @JsonSerializable(explicitToJson: true)
  const factory RootGenerationLike({
    required RootGenerationUser user,
    @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
    required Timestamp createdAt,
  }) = _RootGenerationLike;

  factory RootGenerationLike.fromJson(Map<String, Object?> json) =>
      _$RootGenerationLikeFromJson(json);
}
