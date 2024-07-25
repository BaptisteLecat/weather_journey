import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherjourney/src/features/authentication/domain/app_user.dart';
import 'package:weatherjourney/src/features/user/domain/user_like/user_like.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String? id,
    required String? lastname,
    required String? firstname,
    required String? email,
    @JsonKey(name: 'photoURL') required String? avatar,
    required List<UserLike>? likes,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromAppUser({required AppUser appUser}) {
    return User(
      id: appUser.id,
      lastname: appUser.lastname,
      firstname: appUser.firstname,
      email: appUser.email,
      avatar: appUser.avatar,
      likes: appUser.likes,
    );
  }
}
