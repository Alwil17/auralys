import 'package:auralys/features/assessments/widgets/steps/stress_level_step/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final ThemeData theme;
  
  final int selectedIndex;
  final void Function(int index) onTap;
  const NumberRow({
    super.key,
    required this.theme,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Card(
        elevation: 0,
        color: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                5,
                (index) => CircleButton(
                  theme: theme,
                  text: '${index + 1}',
                  isSelected: index == selectedIndex,
                  onTap: () => onTap(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
