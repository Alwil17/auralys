import 'package:auralys/core/router/routes.dart';
import 'package:auralys/features/auth/widgets/circle_header.dart';
import 'package:auralys/features/auth/widgets/input_field.dart';
import 'package:auralys/features/auth/widgets/logo_widget.dart';
import 'package:auralys/features/auth/widgets/primary_button.dart';
import 'package:auralys/features/auth/widgets/social_login_row.dart';
import 'package:auralys/shared/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final TapGestureRecognizer _signUpRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _signUpRecognizer.onTap = _handleSignUp;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          const CircleHeader(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const LogoWidget(),

                const SizedBox(height: AppSizes.font48),

                Expanded(
                  child: Column(
                    spacing: AppSizes.font48,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in to Auralys',
                        style: theme.textTheme.titleLarge,
                      ),

                      Column(
                        children: [
                          InputField(
                            icon: Icons.mail_outline,
                            label: 'Email',
                            placeholder: 'Email Address',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          InputField(
                            icon: Icons.lock_outline,
                            label: 'Password',
                            placeholder: 'Enter your password...',
                            controller: _passwordController,
                            isPassword: true,
                          ),

                          PrimaryButton(
                            text: 'Sign In',
                            onPressed: _handleSignIn,
                          ),
                        ],
                      ),

                      const SocialLoginRow(),

                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                              children: [
                                const TextSpan(text: "Don't have an account? "),
                                TextSpan(
                                  text: 'Sign Up.',
                                  style: const TextStyle(
                                    color: Color(0xFF2196F3),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: _signUpRecognizer,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: _handleForgotPassword,
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Color(0xFF2196F3),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signUpRecognizer.dispose();
    super.dispose();
  }

  void _handleForgotPassword() {
    debugPrint('LoginScreen: Forgot Password pressed');
    context.pushNamed(APP_PAGES.forgotPassword.toName);
  }

  void _handleSignIn() {
    debugPrint('LoginScreen: Sign In button pressed');
    context.pushNamed(APP_PAGES.assessments.toName);
  }

  void _handleSignUp() {
    debugPrint('LoginScreen: Sign Up pressed');
    context.pushNamed(APP_PAGES.register.toName);
  }
}
