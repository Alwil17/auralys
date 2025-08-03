import 'package:auralys/features/assessments/widgets/steps/age_step.dart';
import 'package:auralys/features/assessments/widgets/steps/gender_step.dart';
import 'package:auralys/features/assessments/widgets/steps/habits_step.dart';
import 'package:auralys/features/assessments/widgets/steps/life_satisfaction_step.dart';
import 'package:auralys/features/assessments/widgets/steps/mood_step.dart';
import 'package:auralys/features/assessments/widgets/steps/sleep_step.dart';
import 'package:auralys/features/assessments/widgets/steps/stress_level_step.dart';
import 'package:auralys/features/assessments/widgets/steps/wellness_goals_step.dart';
import 'package:flutter/material.dart';

class StepContent extends StatelessWidget {
  final int stepIndex;

  const StepContent({super.key, required this.stepIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Only show title and subtitle for non-special layout steps
              if (![2].contains(stepIndex)) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    textAlign: TextAlign.center,
                    _getStepTitle(stepIndex),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                if (_hasSubtitle(stepIndex)) ...[
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      textAlign: TextAlign.center,
                      _getStepSubtitle(stepIndex),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 40),
              ],

              _getStepWidget(context, stepIndex),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderStep(int step) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Assessment Step $step\nContent goes here',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  String _getStepSubtitle(int step) {
    switch (step) {
      case 1:
        return 'This helps us provide more personalized recommendations for your emotional wellness journey.';
      case 2:
        return 'Please select your age to help us personalize your experience.';
      case 3:
        return 'Select the emoji that best represents your current mood.';
      case 4:
        return 'Understanding your sleep patterns helps us provide better guidance for your wellness journey.';
      case 5:
        return 'Rate your current stress level on a scale from 1 to 5.';
      case 6:
        return 'Tell us about your daily routines and activities that support your well-being.';
      case 7:
        return 'What areas would you like to focus on for your emotional wellness?';
      case 8:
        return 'Rate your current satisfaction with different areas of your life.';
      default:
        return '';
    }
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 1:
        return "What's your official gender?";
      case 2:
        return 'How old are you?';
      case 3:
        return 'How are you feeling today?';
      case 4:
        return 'Sleep & Wellness';
      case 5:
        return 'Stress Level';
      case 6:
        return 'Your Daily Habits';
      case 7:
        return 'Wellness Goals';
      case 8:
        return 'Life Satisfaction';
      default:
        return 'Assessment Step $step';
    }
  }

  Widget _getStepWidget(BuildContext context, int step) {
    switch (step) {
      case 1:
        return const GenderStep();
      case 2:
        return Column(
          children: [
            // Title and subtitle for age step positioned above the widget
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                textAlign: TextAlign.center,
                _getStepTitle(step),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                textAlign: TextAlign.center,
                _getStepSubtitle(step),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const AgeStep(),
          ],
        );
      case 3:
        return const MoodStep();
      case 4:
        return const SleepStep();
      case 5:
        return const StressLevelStep();
      case 6:
        return const HabitsStep();
      case 7:
        return const WellnessGoalsStep();
      case 8:
        return const LifeSatisfactionStep();
      default:
        return _buildPlaceholderStep(step);
    }
  }

  bool _hasSubtitle(int step) {
    return ![2].contains(
      step,
    ); // Age step doesn't need subtitle since it's visually clear
  }
}
