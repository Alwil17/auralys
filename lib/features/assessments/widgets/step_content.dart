import 'package:flutter/material.dart';

class StepContent extends StatelessWidget {
  final int stepIndex;
  
  const StepContent({
    super.key,
    required this.stepIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
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
              
              _getStepWidget(stepIndex),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinalStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Placeholder for final questions
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Final Questions\n(Goals, Preferences, etc.)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitsStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Placeholder for habits questionnaire
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Daily Habits Questionnaire\n(Exercise, Social activities, etc.)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Placeholder for mood selection
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Mood Selection\n(Emoji wheel or mood cards)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Placeholder for personal info form
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Personal Information Form\n(Age, Gender, etc.)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
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
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSleepStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Placeholder for sleep assessment
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Sleep Assessment\n(Hours, Quality, Patterns)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeStep() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple.withOpacity(0.1),
            ),
            child: const Icon(
              Icons.psychology,
              size: 80,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Ready to begin your journey towards better emotional wellness?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getStepSubtitle(int step) {
    switch (step) {
      case 1:
        return 'This assessment will help us understand your emotional well-being and create a personalized experience for you.';
      case 2:
        return 'Help us get to know you better so we can provide personalized recommendations.';
      case 3:
        return 'Share your current emotional state with us.';
      case 4:
        return 'Tell us about your daily routines and activities.';
      case 5:
        return 'Understanding your sleep patterns helps us provide better guidance.';
      case 6:
        return 'Just a few more questions to complete your profile.';
      default:
        return '';
    }
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 1:
        return 'Welcome to Your Assessment';
      case 2:
        return 'Tell Us About Yourself';
      case 3:
        return 'How Are You Feeling?';
      case 4:
        return 'Your Daily Habits';
      case 5:
        return 'Sleep & Wellness';
      case 6:
        return 'Final Questions';
      default:
        return 'Assessment Step $step';
    }
  }

  Widget _getStepWidget(int step) {
    switch (step) {
      case 1:
        return _buildWelcomeStep();
      case 2:
        return _buildPersonalInfoStep();
      case 3:
        return _buildMoodStep();
      case 4:
        return _buildHabitsStep();
      case 5:
        return _buildSleepStep();
      case 6:
        return _buildFinalStep();
      default:
        return _buildPlaceholderStep(step);
    }
  }

  bool _hasSubtitle(int step) {
    return ![].contains(step); // All steps have subtitles for now
  }
}
