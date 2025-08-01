import 'package:auralys/features/assessments/widgets/steps/sleep_step/widgets/sleep_emoji_column.dart';
import 'package:auralys/features/assessments/widgets/steps/sleep_step/widgets/sleep_time_column.dart';
import 'package:auralys/features/assessments/widgets/steps/sleep_step/widgets/sleep_vertical_slider.dart';
import 'package:flutter/material.dart';

class SleepStep extends StatefulWidget {
  const SleepStep({super.key});

  @override
  State<SleepStep> createState() => _SleepStepState();
}

class _SleepStepState extends State<SleepStep> {
  double _value = 2.0; // Default to "Fair" (middle option)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          // Additional context text
          Text(
            'Move the slider to rate your sleep quality',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          // Main sleep assessment widget
          Container(
            height: 320,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sleep quality labels
                Expanded(
                  flex: 2,
                  child: SleepTimeColumn(value: _value),
                ),
                
                // Vertical slider
                Expanded(
                  flex: 1,
                  child: SleepVerticalSlider(
                    value: _value,
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue;
                      });
                    },
                  ),
                ),
                
                // Emoji column
                Expanded(
                  flex: 1,
                  child: SleepEmojiColumn(value: _value),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Current selection indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.2),
              ),
            ),
            child: Text(
              'Selected: ${_getSleepQualityText()}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  String _getSleepQualityText() {
    final sleepQualities = ['Excellent', 'Good', 'Fair', 'Poor', 'Very Poor'];
    return sleepQualities[(4 - _value).round()];
  }
}
