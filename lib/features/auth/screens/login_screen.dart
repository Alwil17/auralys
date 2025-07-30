import 'package:auralys/core/router/routes.dart';
import 'package:auralys/features/auth/widgets/circle_header.dart';
import 'package:auralys/features/auth/widgets/input_field.dart';
import 'package:auralys/features/auth/widgets/logo_widget.dart';
import 'package:auralys/features/auth/widgets/primary_button.dart';
import 'package:auralys/features/auth/widgets/social_login_row.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CircleHeader(),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const LogoWidget(),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign in to Auralys',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF333333),
                            height: 1.27,
                          ),
                        ),

                        const SizedBox(height: 30),

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

                        const SizedBox(height: 30),

                        const SocialLoginRow(),

                        const SizedBox(height: 30),

                        Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                ),
                                children: [
                                  TextSpan(text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Sign Up.',
                                    style: TextStyle(
                                      color: Color(0xFF2196F3),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
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
}
