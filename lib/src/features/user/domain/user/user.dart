import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/settings/domain/frequency/frequency.dart';
import 'package:weatherjourney/src/features/settings/domain/style/style.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const User._();
  const factory User({
    String? id,
    String? lastname,
    String? firstname,
    String? email,
    @JsonKey(name: 'photoURL') String? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const empty = User();
}
