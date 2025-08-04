import 'package:auralys/features/assessments/widgets/count_card.dart';
import 'package:auralys/features/assessments/widgets/step_content.dart';
import 'package:auralys/features/auth/widgets/back_button.dart';
import 'package:auralys/features/auth/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  static const int _totalSteps = 7; // Updated to include all steps including popup and name step
  final PageController _pageController = PageController();
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: _currentStep == 1,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && _currentStep > 1) {
          _goToPreviousStep();
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: _currentStep > 1
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: _goToPreviousStep,
                    child: const CustomBackButton(),
                  ),
                )
              : null,
          title: Text(
            'Emotional Assessment',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.tertiary,
            ),
          ),
          actions: [CountCard(count: _currentStep, total: _totalSteps)],
          centerTitle: true,
        ),
        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _totalSteps,
          itemBuilder: (context, index) {
            return StepContent(
              stepIndex: index + 1,
              onNextStep: _goToNextStep,
              onPreviousStep: _goToPreviousStep,
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Skip button for gender step
                if (_currentStep == 1) ...[
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: OutlinedButton(
                      onPressed: () => _goToNextStep(),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary.withValues(
                          alpha: 0.1,
                        ),
                        side: BorderSide(color: theme.colorScheme.secondary),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 32,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Prefer to skip, thanks',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '✕',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                // Main continue/finish button
                PrimaryButton(
                  text: _currentStep == _totalSteps
                      ? 'Complete Assessment'
                      : 'Continue',
                  onPressed: _handleContinue,
                  margin: EdgeInsets.zero,
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
    _pageController.dispose();
    super.dispose();
  }

  void _completeAssessment() {
    debugPrint('AssessmentScreen: Assessment completed');

    // Show completion dialog or navigate to results
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Assessment Complete'),
        content: const Text(
          'Thank you for completing your emotional assessment. Your personalized recommendations are being prepared.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/dashboard'); // Navigate to main app
            },
            child: const Text('Continue to App'),
          ),
        ],
      ),
    );
  }

  void _goToNextStep() {
    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
      _pageController.animateToPage(
        _currentStep - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleContinue() {
    debugPrint('AssessmentScreen: Continue pressed for step $_currentStep');

    if (_currentStep == _totalSteps) {
      // Complete assessment
      _completeAssessment();
    } else {
      // Go to next step
      _goToNextStep();
    }
  }
}
