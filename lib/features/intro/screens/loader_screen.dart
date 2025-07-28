import 'package:auralys/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
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
      body: Center(
        child: SizedBox(
          width: _size,
          height: _size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated circles
              ...List.generate(3, (index) {
                return AnimatedBuilder(
                  animation: _circleController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _circleScaleAnimations[index].value,
                      child: Container(
                        width: _size,
                        height: _size,
                        decoration: BoxDecoration(
                          color: _color.withOpacity(
                            _circleOpacityAnimations[index].value,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                );
              }),
              // Animated percentage text
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return Text(
                    '${_progressAnimation.value.round()}%',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('LoaderScreen: Disposing controllers');
    _progressController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Progress animation (0 to 100 over 3 seconds)
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 3000),
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
      return Tween<double>(begin: 0.7, end: 0.0).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            index * 0.2, // Stagger delay (0, 0.2, 0.4)
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
            index * 0.2, // Stagger delay (0, 0.2, 0.4)
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
        debugPrint('LoaderScreen: Navigation to quote screen');
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
