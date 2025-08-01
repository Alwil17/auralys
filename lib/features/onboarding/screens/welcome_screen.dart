import 'package:auralys/core/router/routes.dart';
import 'package:auralys/core/theme/app_theme.dart';
import 'package:auralys/features/onboarding/widgets/image_with_loader.dart';
import 'package:auralys/l10n/app_localizations.dart';
import 'package:auralys/shared/app_assets.dart';
import 'package:auralys/shared/app_colors.dart';
import 'package:auralys/shared/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                spacing: AppSizes.cardCircularBorderRadius,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageWithLoader(
                    width: 64,
                    height: 64,
                    imagePath: AppAssets.logo,
                  ),

                  // Welcome text
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.titleLarge,
                      children: [
                        TextSpan(text: AppLocalizations.of(context)!.welcomeTo),
                        TextSpan(
                          text: 'Auralys',
                          style: TextStyle(color: AppColors.light.purple),
                        ),
                        TextSpan(text: '💙'),
                      ],
                    ),
                  ),

                  // Subtitle
                  Text(
                    AppLocalizations.of(context)!.appSlogan,
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),

                  // Mascot image with loading indicator
                  const ImageWithLoader(
                    width: 300,
                    height: 300,
                    imagePath: AppAssets.luma,
                  ),

                  // Get Started button
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('WelcomeScreen: Get Started button pressed');
                      context.goNamed(APP_PAGES.login.toName);
                    },
                    style: AppTheme.elevatedButtonStyle,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.getStarted,
                          style: AppTheme.textLgExtraBold,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  // Sign in link
                  GestureDetector(
                    onTap: () {
                      debugPrint('WelcomeScreen: Sign In link pressed');
                      context.goNamed(APP_PAGES.login.toName);
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333333),
                        ),
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
        ),
      ),
    );
  }
}
