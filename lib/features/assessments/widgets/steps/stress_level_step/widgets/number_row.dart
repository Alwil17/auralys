import 'package:auralys/features/assessments/widgets/steps/stress_level_step/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int selectedIndex;
  
  final void Function(int index) onTap;
  const NumberRow({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              5,
              (index) => CircleButton(
                text: '${index + 1}',
                isSelected: index == selectedIndex,
                onTap: () => onTap(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
