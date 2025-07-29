import 'package:auralys/core/router/routes.dart';
import 'package:auralys/l10n/app_localizations.dart';
import 'package:auralys/shared/app_assets.dart';
import 'package:auralys/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _logoLoaded = false;
  bool _mascotLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with loading indicator
              SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!_logoLoaded)
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.light.purple,
                        ),
                        strokeWidth: 2,
                      ),
                    AnimatedOpacity(
                      opacity: _logoLoaded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.logo,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() => _logoLoaded = true);
                            });
                            return Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFA971E1),
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 24,
                              ),
                            );
                          },
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded || frame != null) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    if (mounted)
                                      setState(() => _logoLoaded = true);
                                  });
                                }
                                return child;
                              },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Welcome text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                  children: [
                    TextSpan(text: AppLocalizations.of(context)!.welcomeTo),
                    TextSpan(
                      text: 'Auralys',
                      style: TextStyle(
                        color: AppColors.light.purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(text: '💙', style: TextStyle(fontSize: 28)),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Subtitle
              Text(
                AppLocalizations.of(context)!.appSlogan,
                style: const TextStyle(fontSize: 18, color: Color(0xFF555555)),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Mascot image with loading indicator
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!_mascotLoaded)
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFA971E1),
                        ),
                      ),
                    AnimatedOpacity(
                      opacity: _mascotLoaded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.luma,
                          width: 300,
                          height: 300,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() => _mascotLoaded = true);
                            });
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.android,
                                color: AppColors.light.purple,
                                size: 100,
                              ),
                            );
                          },
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded || frame != null) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    if (mounted)
                                      setState(() => _mascotLoaded = true);
                                  });
                                }
                                return child;
                              },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Get Started button
              ElevatedButton(
                onPressed: _handleGetStarted,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.light.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.getStarted,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Sign in link
              GestureDetector(
                onTap: _handleSignIn,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                    children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign In',
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
    );
  }

  void _handleGetStarted() {
    debugPrint('WelcomeScreen: Get Started button pressed');
    // Navigate to login screen using GoRouter
    context.goNamed(APP_PAGES.login.toName);
  }

  void _handleSignIn() {
    debugPrint('WelcomeScreen: Sign In link pressed');
    // Navigate to login screen using GoRouter
    context.goNamed(APP_PAGES.login.toName);
  }
}
