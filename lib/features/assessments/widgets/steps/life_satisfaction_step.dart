import 'package:flutter/material.dart';

class LifeSatisfactionStep extends StatefulWidget {
  const LifeSatisfactionStep({super.key});

  @override
  State<LifeSatisfactionStep> createState() => _LifeSatisfactionStepState();
}

class _LifeSatisfactionStepState extends State<LifeSatisfactionStep> {
  double _overallSatisfaction = 5.0;
  final Map<String, double> _categoryRatings = {
    'Work/Career': 5.0,
    'Relationships': 5.0,
    'Health': 5.0,
    'Personal Growth': 5.0,
    'Recreation': 5.0,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          Text(
            'Rate your satisfaction in different areas of life',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          // Overall life satisfaction
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Overall Life Satisfaction',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getSatisfactionLabel(_overallSatisfaction),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: theme.colorScheme.primary,
                    inactiveTrackColor: theme.colorScheme.primary.withOpacity(0.2),
                    thumbColor: theme.colorScheme.primary,
                    overlayColor: theme.colorScheme.primary.withOpacity(0.1),
                    valueIndicatorColor: theme.colorScheme.primary,
                  ),
                  child: Slider(
                    value: _overallSatisfaction,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() {
                        _overallSatisfaction = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Very Poor',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      '${_overallSatisfaction.round()}/10',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Excellent',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Category-specific ratings
          Text(
            'Rate specific areas:',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 16),
          
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _categoryRatings.keys.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final category = _categoryRatings.keys.elementAt(index);
              final value = _categoryRatings[category]!;
              
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${value.round()}/10',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 6,
                        activeTrackColor: _getCategoryColor(category),
                        inactiveTrackColor: _getCategoryColor(category).withOpacity(0.2),
                        thumbColor: _getCategoryColor(category),
                        overlayColor: _getCategoryColor(category).withOpacity(0.1),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 10,
                        ),
                      ),
                      child: Slider(
                        value: value,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        onChanged: (newValue) {
                          setState(() {
                            _categoryRatings[category] = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          
          const SizedBox(height: 24),
          
          // Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: theme.colorScheme.secondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Average Score: ${_getAverageRating().toStringAsFixed(1)}/10',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  double _getAverageRating() {
    final total = _categoryRatings.values.reduce((a, b) => a + b) + _overallSatisfaction;
    return total / (_categoryRatings.length + 1);
  }
  
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Work/Career':
        return const Color(0xFF6366F1); // Indigo
      case 'Relationships':
        return const Color(0xFFEF4444); // Red
      case 'Health':
        return const Color(0xFF10B981); // Emerald
      case 'Personal Growth':
        return const Color(0xFF8B5CF6); // Purple
      case 'Recreation':
        return const Color(0xFFF59E0B); // Amber
      default:
        return const Color(0xFF06B6D4); // Cyan
    }
  }
  
  String _getSatisfactionLabel(double value) {
    if (value <= 2) return 'Very Poor';
    if (value <= 4) return 'Poor';
    if (value <= 6) return 'Fair';
    if (value <= 8) return 'Good';
    return 'Excellent';
  }
}
