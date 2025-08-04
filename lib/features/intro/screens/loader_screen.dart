import 'package:auralys/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

// Widget dédié pour un cercle animé
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

class _LoaderScreenState extends State<LoaderScreen>
    with TickerProviderStateMixin {
  static const Color _color = Color(0xFFe1a2f7);
  static const double _size = 100.0;

  late AnimationController _progressController;
  late AnimationController _circleController;
  late Animation<double> _progressAnimation;
  late List<Animation<double>> _circleOpacityAnimations;
  late List<Animation<double>> _circleScaleAnimations;
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        child: Center(
          child: SizedBox(
            width: _size,
            height: _size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Animated circles (extrait dans un widget dédié)
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
                // Animated percentage text
                RepaintBoundary(
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Text(
                        '${_progressAnimation.value.round()}%',
                        style: Theme.of(context).textTheme.labelLarge!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _initAnimations();
  }

  void _initAnimations() {
    // Progress animation (0 to 100 over 1.5 seconds)
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOut),
    );

    // Circle animation (repeating every 2 seconds)
    _circleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create animations for each of the 3 circles with staggered delays
    _circleOpacityAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 0.5, end: 0.0).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            index * 0.3, // Stagger delay (0, 0.3, 0.4)
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    _circleScaleAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 1.0, end: 4.0).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            index * 0.3, // Stagger delay (0, 0.2, 0.4)
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    // Add listener to navigate when progress completes
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_hasNavigated) {
        _hasNavigated = true;
        if (mounted) {
          _progressController.stop();
          context.pushReplacementNamed(APP_PAGES.quote.toName);
        }
      }
    });

    // Start animations
    _progressController.forward();
    _circleController.repeat();
  }
}
