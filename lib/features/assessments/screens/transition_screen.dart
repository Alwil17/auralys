import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionScreen extends StatefulWidget {
  final String username;

  const TransitionScreen({
    super.key,
    required this.username,
  });

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

// Widget dédié pour un cercle animé (réutilisé du loader)
class _AnimatedCircle extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> opacityAnimation;
  final Color color;
  final double size;

  const _AnimatedCircle({
    required this.scaleAnimation,
    required this.opacityAnimation,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color.withValues(alpha: opacityAnimation.value),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

class _TransitionScreenState extends State<TransitionScreen>
    with TickerProviderStateMixin {
  static const Color _color = Color(0xFFe1a2f7);
  static const double _size = 100.0;

  late AnimationController _circleController;
  late AnimationController _breathingController;
  late List<Animation<double>> _circleOpacityAnimations;
  late List<Animation<double>> _circleScaleAnimations;
  late Animation<double> _breathingAnimation;

  String _breathingInstruction = "Inhale";
  bool _showButton = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Titre et sous-titre
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Text(
                        "You're all set, ${widget.username} 💙",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Text(
                        'Before we begin, take a short breath with me.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Zone d'animation centrale
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _breathingAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _breathingAnimation.value,
                        child: RepaintBoundary(
                          child: SizedBox(
                            width: _size,
                            height: _size,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Cercles animés seulement
                                ...List.generate(3, (index) {
                                  return RepaintBoundary(
                                    child: _AnimatedCircle(
                                      scaleAnimation: _circleScaleAnimations[index],
                                      opacityAnimation: _circleOpacityAnimations[index],
                                      color: _color,
                                      size: _size,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Instructions de respiration - nouveau composant séparé
              if (!_showButton) ...[
                const SizedBox(height: 32),
                RepaintBoundary(
                  child: Column(
                    children: [
                      Text(
                        _breathingInstruction,
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Bouton "Let's start"
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      opacity: _showButton ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 800),
                      child: AnimatedSlide(
                        offset: _showButton ? Offset.zero : const Offset(0, 0.5),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeOutBack,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _showButton ? _handleLetsStart : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Let's start",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _circleController.dispose();
    _breathingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startBreathingSequence();
  }

  void _handleLetsStart() {
    debugPrint('TransitionScreen: Let\'s start button pressed for ${widget.username}');
    // Navigator vers l'écran suivant (dashboard, home, etc.)
    context.go('/home'); // Navigate to home screen
  }

  void _initAnimations() {
    // Circle animation (similaire au loader)
    _circleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Breathing animation (4 seconds inhale + 4 seconds exhale)
    _breathingController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    // Create animations for circles
    _circleOpacityAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 0.3, end: 0.0).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            index * 0.3,
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    _circleScaleAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 1.0, end: 3.5).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            index * 0.3,
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    // Breathing scale animation
    _breathingAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _breathingController,
        curve: Curves.easeInOut,
      ),
    );

    // Start circle animation
    _circleController.repeat();
  }

  void _startBreathingCycle() {
    // Cycle de respiration : 3 cycles complets (24 secondes total)
    int cycleCount = 0;
    const int totalCycles = 3;

    void runCycle() {
      if (cycleCount >= totalCycles) {
        // Terminer et montrer le bouton
        setState(() {
          _breathingInstruction = "Well done!";
          _showButton = true;
        });
        return;
      }

      // Inhaler (4 secondes)
      setState(() => _breathingInstruction = "Inhale");
      _breathingController.forward().then((_) {
        if (mounted) {
          // Exhaler (4 secondes)
          setState(() => _breathingInstruction = "Exhale");
          _breathingController.reverse().then((_) {
            if (mounted) {
              cycleCount++;
              // Petite pause entre les cycles
              Future.delayed(const Duration(milliseconds: 500), () {
                if (mounted) runCycle();
              });
            }
          });
        }
      });
    }

    runCycle();
  }

  void _startBreathingSequence() {
    // Attendre 1 seconde avant de commencer
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _startBreathingCycle();
      }
    });
  }
}
