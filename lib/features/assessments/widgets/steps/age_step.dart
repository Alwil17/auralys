import 'package:flutter/material.dart';

class AgeStep extends StatefulWidget {
  const AgeStep({super.key});

  @override
  State<AgeStep> createState() => _AgeStepState();
}

class _AgeStepState extends State<AgeStep> {
  final CarouselController _controller = CarouselController(initialItem: 17);

  @override
  Widget build(BuildContext context) {
    return _AgeWidget(controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AgeWidget extends StatelessWidget {
  final CarouselController controller;
  const _AgeWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      height: 450,
      width: 450,
      child: CarouselView.weighted(
        controller: controller,
        scrollDirection: Axis.vertical,
        flexWeights: const [2, 3, 7, 3, 2],
        itemSnapping: true,
        backgroundColor: Colors.transparent,
        enableSplash: false,
        children: List<Widget>.generate(
          100,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxHeight > 108
                    ? Card(
                        margin: const EdgeInsets.symmetric(horizontal: 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200),
                          side: BorderSide(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            width: 4,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                        elevation: 0,
                        color: theme.colorScheme.primary,
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 130,
                              fontWeight: FontWeight.w900,
                              height: 0.6,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Transform.scale(
                        scale: 1.4,
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: (constraints.maxHeight / 1.2).clamp(
                                28,
                                85,
                              ),
                              fontWeight: FontWeight.w900,
                              height: 0.8,
                              color: theme.colorScheme.onSurface.withOpacity(
                                (constraints.maxHeight / 0.6).toInt().clamp(
                                  0,
                                  255,
                                ) / 255.0,
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
