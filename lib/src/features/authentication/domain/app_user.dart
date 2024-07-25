import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/settings/domain/frequency/frequency.dart';
import 'package:weatherjourney/src/features/settings/domain/style/style.dart';
import 'package:weatherjourney/src/features/user/domain/user_like/user_like.dart';
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
    @JsonKey(name: 'photoURL') String? avatar,
    bool? created,
    String? token,
    bool? hasSeenOnboarding,
    // ignore: invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    firebase.User? firebaseAppUser,
    List<Style>? styles,
    List<Frequency>? frequencies,
    List<UserLike>? likes,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  static const empty = AppUser();
}
