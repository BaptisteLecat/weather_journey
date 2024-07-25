import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';

part 'user_like.g.dart';
part 'user_like.freezed.dart';

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
class UserLike with _$UserLike {
  @JsonSerializable(explicitToJson: true)
  const factory UserLike({
    required RootGeneration rootGeneration,
    @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
    required Timestamp createdAt,
  }) = _UserLike;

  factory UserLike.fromJson(Map<String, Object?> json) =>
      _$UserLikeFromJson(json);
}
