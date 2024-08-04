import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_follow.g.dart';
part 'user_follow.freezed.dart';

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
class UserFollow with _$UserFollow {
  @JsonSerializable(explicitToJson: true)
  const factory UserFollow({
    required String userId,
    required String? lastname,
    required String? firstname,
    required String email,
    @JsonKey(fromJson: createdAtFromJson, toJson: createdAtToJson)
    required Timestamp createdAt,
  }) = _UserFollow;

  factory UserFollow.fromJson(Map<String, Object?> json) =>
      _$UserFollowFromJson(json);
}
