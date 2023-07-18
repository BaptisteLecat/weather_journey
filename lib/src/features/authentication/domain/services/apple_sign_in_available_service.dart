import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AppleSignInAvailableService {
  AppleSignInAvailableService(this.isAvailable);
  final bool isAvailable;

  static Future<AppleSignInAvailableService> check() async {
    return AppleSignInAvailableService(await TheAppleSignIn.isAvailable());
  }
}

final appleSignInAvailableServiceProvider =
    FutureProvider<AppleSignInAvailableService>((ref) async {
  return AppleSignInAvailableService.check();
});
