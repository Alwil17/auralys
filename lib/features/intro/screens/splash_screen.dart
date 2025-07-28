import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the loader screen after the splash screen
      context.pushNamed(APP_PAGES.loader.toName);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? 'assets/icons/splash-icon-light.png'
              : 'assets/icons/splash-icon-dark.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}