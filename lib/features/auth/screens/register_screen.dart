import 'package:auralys/features/auth/widgets/circle_header.dart';
import 'package:auralys/features/auth/widgets/input_field.dart';
import 'package:auralys/features/auth/widgets/primary_button.dart';
import 'package:auralys/shared/app_assets.dart';
import 'package:auralys/shared/image_with_loader.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                const SizedBox(height: 80),

                const ImageWithLoader(
                    width: 50,
                    height: 50,
                    imagePath: AppAssets.logo,
                    radius: 30,
                  ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign up to Auralys',
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
                              label: 'Email Address',
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

                            InputField(
                              icon: Icons.lock_outline,
                              label: 'Password Confirmation',
                              placeholder: 'Confirm your password...',
                              controller: _confirmPasswordController,
                              isPassword: true,
                            ),

                            PrimaryButton(
                              text: 'Sign Up',
                              onPressed: _handleSignUp,
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        GestureDetector(
                          onTap: _handleSignIn,
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                              children: [
                                TextSpan(text: "Already have an account? "),
                                TextSpan(
                                  text: 'Sign In.',
                                  style: TextStyle(
                                    color: Color(0xFF2196F3),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    debugPrint('RegisterScreen: Sign In link pressed');
  }

  void _handleSignUp() {
    debugPrint('RegisterScreen: Sign Up button pressed');
  }
}
