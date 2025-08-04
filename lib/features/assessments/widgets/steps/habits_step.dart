import 'package:flutter/material.dart';

class HabitItem {
  final String title;
  final String description;
  final IconData icon;
  bool isSelected;

  HabitItem({
    required this.title,
    required this.description,
    required this.icon,
    this.isSelected = false,
  });
}

class HabitsStep extends StatefulWidget {
  const HabitsStep({super.key});

  @override
  State<HabitsStep> createState() => _HabitsStepState();
}

class _HabitsStepState extends State<HabitsStep> {
  List<HabitItem> habits = [
    HabitItem(
      title: 'Regular Exercise',
      description: 'Physical activity 3+ times per week',
      icon: Icons.fitness_center,
    ),
    HabitItem(
      title: 'Meditation',
      description: 'Mindfulness or meditation practice',
      icon: Icons.self_improvement,
    ),
    HabitItem(
      title: 'Social Activities',
      description: 'Regular social interactions',
      icon: Icons.people,
    ),
    HabitItem(
      title: 'Healthy Eating',
      description: 'Balanced nutrition and regular meals',
      icon: Icons.restaurant,
    ),
    HabitItem(
      title: 'Reading',
      description: 'Books, articles, or learning materials',
      icon: Icons.menu_book,
    ),
    HabitItem(
      title: 'Outdoor Time',
      description: 'Time spent in nature or outdoors',
      icon: Icons.park,
    ),
    HabitItem(
      title: 'Creative Activities',
      description: 'Art, music, writing, crafts',
      icon: Icons.palette,
    ),
    HabitItem(
      title: 'Journaling',
      description: 'Regular writing or reflection',
      icon: Icons.edit_note,
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
            'Select activities you do regularly (tap all that apply)',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 24),
          
          // Habits grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    habit.isSelected = !habit.isSelected;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: habit.isSelected
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: habit.isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withValues(alpha: 0.3),
                      width: habit.isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            habit.icon,
                            size: 20,
                            color: habit.isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              habit.title,
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: habit.isSelected
                                    ? theme.colorScheme.onPrimaryContainer
                                    : theme.colorScheme.onSurface,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        habit.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: habit.isSelected
                              ? theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.8)
                              : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          fontSize: 11,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          
          const SizedBox(height: 20),
          
          // Selection count indicator
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
              '${habits.where((h) => h.isSelected).length} habits selected',
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
