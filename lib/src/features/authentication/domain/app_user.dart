import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';

@Freezed()
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    String? id,
    String? lastname,
    String? firstname,
    String? email,
    String? avatar,
    bool? created,
    String? token,
    @JsonKey(ignore: true) firebase.User? firebaseAppUser,
    List<String>? styles,
    List<String>? frequencies,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  static const empty = AppUser();
}
