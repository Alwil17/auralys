import 'package:auralys/features/assessments/widgets/steps/mood_step/mood_wheel_widget.dart';
import 'package:flutter/material.dart';

class MoodStep extends StatefulWidget {
  const MoodStep({super.key});

  @override
  State<MoodStep> createState() => _MoodStepState();
}

class _MoodStepState extends State<MoodStep> {
  @override
  Widget build(BuildContext context) {
    return const MoodWheelWidget();
  }
}
