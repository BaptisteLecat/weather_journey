import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
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
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p24, vertical: Sizes.p48),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: Sizes.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Welcome back !",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )),
                      const SizedBox(height: Sizes.p12),
                      Text(
                          "Start watching beautiful generated landscapes right now",
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Sizes.p20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                          ),
                          const SizedBox(height: Sizes.p16),
                          Text(
                            "Forgot password?",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                authRepository.signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              }
                            },
                            child: Container(
                                height: 54,
                                padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.p12),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                    child: Text("Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.white)))),
                          ),
                        ])),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: Sizes.p8),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: Sizes.p8),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: SizedBox(
                                        height: 28,
                                        width: 28,
                                        child: Image.asset(
                                            "assets/icons/apple.png")),
                                  )),
                              Center(
                                  child: Text("Connexion avec Apple",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6)),
                            ]),
                            onSubmit: () {
                              authRepository.signInWithApple(
                                  scopes: [Scope.email, Scope.fullName]);
                            }),
                      SecondaryButton(
                          isSubmitable: true,
                          content: Stack(children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: Image.asset(
                                          "assets/icons/google.png")),
                                )),
                            Center(
                                child: Text("Connexion avec Google",
                                    style:
                                        Theme.of(context).textTheme.headline6)),
                          ]),
                          onSubmit: () {
                            authRepository.signInWithGoogle();
                          }),
                    ],
                  )),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => context.goNamed(AppRoute.signUp.name),
                      child: RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: Theme.of(context).textTheme.titleSmall,
                              children: [
                            TextSpan(
                                text: "Sign up",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold))
                          ]))),
                ],
              ),
            ]),
      ),
    );
  }
}
