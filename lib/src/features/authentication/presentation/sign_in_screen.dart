import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as apple_sign_in;
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/features/authentication/domain/services/apple_sign_in_available_service.dart';
import 'package:weather_assistant/src/features/authentication/presentation/widget/secondary_button.dart';
import 'package:weather_assistant/src/routing/app_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authRepository = ref.watch(authRepositoryProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Sign In Screen"),
          Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ])),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                authRepository.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
              }
            },
            child: const Text("Sign In"),
          ),
          if (ref
                  .watch(appleSignInAvailableServiceProvider)
                  .value
                  ?.isAvailable ??
              false)
            SecondaryButton(
                isSubmitable: true,
                content: Stack(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset("assets/icons/apple.png")),
                      )),
                  Center(
                      child: Text("Connexion avec Apple",
                          style: Theme.of(context).textTheme.headline6)),
                ]),
                onSubmit: () {
                  authRepository
                      .signInWithApple(scopes: [Scope.email, Scope.fullName]);
                }),
          SecondaryButton(
              isSubmitable: true,
              content: Stack(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset("assets/icons/google.png")),
                    )),
                Center(
                    child: Text("Connexion avec Google",
                        style: Theme.of(context).textTheme.headline6)),
              ]),
              onSubmit: () {
                authRepository.signInWithGoogle();
              }),
          const SizedBox(height: Sizes.p24),
          GestureDetector(
              onTap: () => context.goNamed(AppRoute.signUp.name),
              child: Text("Don't have an account?")),
        ]),
      ),
    );
  }
}
