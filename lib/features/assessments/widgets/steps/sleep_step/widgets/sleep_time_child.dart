import 'package:auralys/features/assessments/widgets/steps/sleep_step/models/sleep_time_item.dart';
import 'package:flutter/material.dart';

class SleepTimeChild extends StatelessWidget {
  final SleepTimeItem item;
  
  final bool isSelected;
  const SleepTimeChild({
    super.key,
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurface.withOpacity(
      isSelected ? 1.0 : 0.4,
    );
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSelected ? 1.0 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bedtime_outlined,
                color: theme.colorScheme.primary.withOpacity(
                  isSelected ? 1.0 : 0.4,
                ),
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                item.subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
