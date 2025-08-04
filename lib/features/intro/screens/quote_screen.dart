import 'dart:async';

import 'package:auralys/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen>
    with TickerProviderStateMixin {
  static const String quoteText =
      "You do not have to be good. You only have to let the soft animal of your body love what it loves.";

  String displayedText = '';
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  Timer? _typewriterTimer;
  int _currentIndex = 0;
  bool _showAuthorAndButton = false;
  bool _animationStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Quote container
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 64),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/ios-light.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Quote text
                    Text(
                      '"$displayedText"',
                      style: const TextStyle(
                        fontSize: 36,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF5A3F8C),
                        height: 1.2,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    const SizedBox(height: 64),

                    // Author attribution with conditional rendering
                    if (_showAuthorAndButton)
                      AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Transform.translate(
                              offset: Offset(
                                0,
                                20 * (1 - _fadeAnimation.value),
                              ),
                              child: const Text(
                                '— Mary Oliver, Wild Geese',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF6B5B95),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),

              // Continue button with conditional rendering
              if (_showAuthorAndButton)
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
                        child: ElevatedButton(
                          onPressed: _handleContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA971E1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            elevation: 2,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _startTypewriterEffect();
  }

  void _handleContinue() {
    debugPrint('QuoteScreen: Continue button pressed');
    // Navigate to welcome screen using GoRouter
   context.goNamed(APP_PAGES.welcome.toName);
  }

  void _startTypewriterEffect() {
    _typewriterTimer = Timer.periodic(const Duration(milliseconds: 30), (
      timer,
    ) {
      if (_currentIndex < quoteText.length) {
        setState(() {
          displayedText += quoteText[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
        setState(() {
          _showAuthorAndButton = true;
        });
        
        // Démarrer l'animation seulement si elle n'a pas encore été démarrée
        if (!_animationStarted) {
          _animationStarted = true;
          _fadeController.forward();
        }
      }
    });
  }
}
