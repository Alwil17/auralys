import 'package:auralys/features/assessments/widgets/steps/stress_level_step/widgets/number_row.dart';
import 'package:flutter/material.dart';

final List<String> _stressLevels = [
  'Not at all',
  'Barely',
  'Moderately',
  'Highly',
  'Extremely',
];

class StressLevelStep extends StatefulWidget {
  const StressLevelStep({super.key});

  @override
  State<StressLevelStep> createState() => _StressLevelStepState();
}

class _StressLevelStepState extends State<StressLevelStep> {
  int selectedIndex = 2; // Default to middle option (Moderately)

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    void onTap(int index) {
      setState(() => selectedIndex = index);
    }

    return Column(
      spacing: 20,
      children: [
        Text(
          "${selectedIndex + 1}",
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 160,
            height: 0.9,
          ),
        ),
        NumberRow(
          theme: theme, 
          selectedIndex: selectedIndex, 
          onTap: onTap,
        ),
        Text(
          'You Are ${_stressLevels[selectedIndex]} Stressed Out',
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
