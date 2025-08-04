import 'package:auralys/features/assessments/widgets/steps/stress_level_step/widgets/number_row.dart';
import 'package:flutter/material.dart';

class StressLevelStep extends StatefulWidget {
  const StressLevelStep({super.key});

  @override
  State<StressLevelStep> createState() => _StressLevelStepState();
}

class _StressLevelStepState extends State<StressLevelStep> {
  int selectedIndex = 2; // Default to middle option (Moderately)

  final List<String> _stressLevels = [
    'Not at all',
    'Barely',
    'Moderately',
    'Highly',
    'Extremely',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Main stress level display
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  _getStressColor(selectedIndex).withOpacity(0.2),
                  _getStressColor(selectedIndex).withOpacity(0.05),
                ],
              ),
              border: Border.all(
                color: _getStressColor(selectedIndex).withOpacity(0.3),
                width: 3,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${selectedIndex + 1}",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                      color: _getStressColor(selectedIndex),
                      height: 0.9,
                    ),
                  ),
                  Text(
                    "/5",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 24,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Number selection row
          NumberRow(
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
          
          const SizedBox(height: 24),
          
          // Stress level description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: _getStressColor(selectedIndex).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _getStressColor(selectedIndex).withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'You Are ${_stressLevels[selectedIndex]} Stressed Out',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _getStressColor(selectedIndex),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _getStressDescription(selectedIndex),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Scale labels
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Not at all',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Extremely',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() => selectedIndex = index);
  }

  Color _getStressColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF10B981); // Green - Low stress
      case 1:
        return const Color(0xFF06B6D4); // Cyan - Low-medium stress
      case 2:
        return const Color(0xFFF59E0B); // Amber - Medium stress
      case 3:
        return const Color(0xFFEF4444); // Red - High stress
      case 4:
        return const Color(0xFF7C2D12); // Dark red - Very high stress
      default:
        return const Color(0xFFF59E0B);
    }
  }

  String _getStressDescription(int index) {
    switch (index) {
      case 0:
        return 'You\'re feeling calm and relaxed. Great job managing your stress!';
      case 1:
        return 'You experience minimal stress. You\'re handling things well overall.';
      case 2:
        return 'You feel moderately stressed. This is quite normal, but let\'s work on it.';
      case 3:
        return 'You\'re experiencing high stress levels. It\'s important to address this.';
      case 4:
        return 'You\'re extremely stressed. We recommend seeking immediate support.';
      default:
        return '';
    }
  }
}
