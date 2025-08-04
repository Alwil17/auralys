import 'package:auralys/features/assessments/widgets/steps/age_step.dart';
import 'package:auralys/features/assessments/widgets/steps/gender_step.dart';
import 'package:auralys/features/assessments/widgets/steps/mood_analysis_permission_popup.dart';
import 'package:auralys/features/assessments/widgets/steps/mood_step.dart';
import 'package:auralys/features/assessments/widgets/steps/name_step.dart';
import 'package:auralys/features/assessments/widgets/steps/sleep_step.dart';
import 'package:auralys/features/assessments/widgets/steps/stress_level_step.dart';
import 'package:flutter/material.dart';

class StepContent extends StatefulWidget {
  final int stepIndex;
  final VoidCallback? onNextStep;
  final VoidCallback? onPreviousStep;
  final ValueChanged<String>? onNameChanged;

  const StepContent({
    super.key, 
    required this.stepIndex, 
    this.onNextStep,
    this.onPreviousStep,
    this.onNameChanged,
  });

  @override
  State<StepContent> createState() => _StepContentState();
}

class _StepContentState extends State<StepContent> {
  bool _popupShown = false;

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
              if (![2].contains(widget.stepIndex)) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    textAlign: TextAlign.center,
                    _getStepTitle(widget.stepIndex),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                if (_hasSubtitle(widget.stepIndex)) ...[
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      textAlign: TextAlign.center,
                      _getStepSubtitle(widget.stepIndex),
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

              _getStepWidget(context, widget.stepIndex),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(StepContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset popup flag when step changes
    if (oldWidget.stepIndex != widget.stepIndex) {
      _popupShown = false;
    }
  }

  Widget _buildPlaceholderStep(int step) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
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
        return '';
      case 6:
        return ''; // This is a popup, no subtitle needed
      case 7:
        return 'Please, tell me your name !!! How should I call you ?';
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
        return 'How would you rate your stress level?';
      case 6:
        return 'Mood Analysis Permission'; // This will be covered by popup
      case 7:
        return 'Want to know you !';
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
        return _MoodAnalysisPermissionStep();
      case 7:
        return NameStep(onNameChanged: widget.onNameChanged);
      default:
        return _buildPlaceholderStep(step);
    }
  }

  bool _hasSubtitle(int step) {
    return ![2, 5, 6].contains(
      step,
    ); // Age step, stress level step, and mood analysis permission step don't need subtitles
  }

  Widget _MoodAnalysisPermissionStep() {
    // Montrer le popup seulement si il n'a pas déjà été montré
    if (!_popupShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_popupShown) {
          setState(() {
            _popupShown = true;
          });
          
          showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => MoodAnalysisPermissionPopup(
              onYes: () {
                // Proceed to next step
                widget.onNextStep?.call();
                debugPrint('Mood analysis permission: true - proceeding to next step');
              },
              onNo: () {
                // Proceed to next step (user declined but we still continue)
                widget.onNextStep?.call();
                debugPrint('Mood analysis permission: false - proceeding to next step');
              },
            ),
          );
        }
      });
    }

    // Return a placeholder that will be covered by the popup
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.psychology_outlined,
            size: 60,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Preparing mood analysis...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
