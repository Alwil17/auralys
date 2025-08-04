import 'package:flutter/material.dart';

class WellnessGoal {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  bool isSelected;

  WellnessGoal({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.isSelected = false,
  });
}

class WellnessGoalsStep extends StatefulWidget {
  const WellnessGoalsStep({super.key});

  @override
  State<WellnessGoalsStep> createState() => _WellnessGoalsStepState();
}

class _WellnessGoalsStepState extends State<WellnessGoalsStep> {
  List<WellnessGoal> goals = [
    WellnessGoal(
      title: 'Reduce Stress',
      description: 'Learn techniques to manage daily stress and anxiety',
      icon: Icons.spa,
      color: const Color(0xFF6366F1), // Indigo
    ),
    WellnessGoal(
      title: 'Improve Sleep',
      description: 'Develop better sleep habits and quality',
      icon: Icons.bedtime,
      color: const Color(0xFF8B5CF6), // Purple
    ),
    WellnessGoal(
      title: 'Boost Mood',
      description: 'Enhance emotional well-being and positivity',
      icon: Icons.sentiment_very_satisfied,
      color: const Color(0xFFF59E0B), // Amber
    ),
    WellnessGoal(
      title: 'Build Confidence',
      description: 'Strengthen self-esteem and personal confidence',
      icon: Icons.trending_up,
      color: const Color(0xFF10B981), // Emerald
    ),
    WellnessGoal(
      title: 'Manage Emotions',
      description: 'Better understand and regulate emotional responses',
      icon: Icons.psychology,
      color: const Color(0xFFEF4444), // Red
    ),
    WellnessGoal(
      title: 'Improve Focus',
      description: 'Enhance concentration and mental clarity',
      icon: Icons.center_focus_strong,
      color: const Color(0xFF06B6D4), // Cyan
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          Text(
            'What are your main wellness goals? (Select up to 3)',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 24),
          
          // Goals list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: goals.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final goal = goals[index];
              final selectedCount = goals.where((g) => g.isSelected).length;
              final isDisabled = !goal.isSelected && selectedCount >= 3;
              
              return GestureDetector(
                onTap: isDisabled ? null : () {
                  setState(() {
                    goal.isSelected = !goal.isSelected;
                  });
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isDisabled ? 0.5 : 1.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: goal.isSelected
                          ? goal.color.withValues(alpha: 0.1)
                          : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: goal.isSelected
                            ? goal.color
                            : theme.colorScheme.outline.withValues(alpha: 0.3),
                        width: goal.isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Icon circle
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: goal.isSelected
                                ? goal.color.withValues(alpha: 0.2)
                                : theme.colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            goal.icon,
                            color: goal.isSelected
                                ? goal.color
                                : theme.colorScheme.onSurfaceVariant,
                            size: 24,
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Goal details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                goal.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: goal.isSelected
                                      ? goal.color
                                      : theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                goal.description,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Selection indicator
                        if (goal.isSelected)
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: goal.color,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          const SizedBox(height: 20),
          
          // Selection progress indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Text(
              '${goals.where((g) => g.isSelected).length}/3 goals selected',
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
}
