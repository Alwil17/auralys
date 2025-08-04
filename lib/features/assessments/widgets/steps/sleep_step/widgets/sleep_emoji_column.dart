import 'package:flutter/material.dart';

class SleepEmojiColumn extends StatelessWidget {
  final double value;
  
  const SleepEmojiColumn({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> emojis = ['😴', '😌', '😐', '😰', '😫'];
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            5,
            (index) {
              final isSelected = index == (4 - value).round();
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 56 : 40,
                height: isSelected ? 56 : 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected 
                      ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                      : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    emojis[index],
                    style: TextStyle(
                      fontSize: isSelected ? 32 : 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
