import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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