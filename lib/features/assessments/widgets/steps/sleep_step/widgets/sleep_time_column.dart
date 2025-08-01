import 'package:auralys/features/assessments/widgets/steps/sleep_step/models/sleep_time_item.dart';
import 'package:auralys/features/assessments/widgets/steps/sleep_step/widgets/sleep_time_child.dart';
import 'package:flutter/material.dart';

class SleepTimeColumn extends StatelessWidget {
  final double value;
  
  const SleepTimeColumn({
    super.key, 
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            sleepTimeItems.length,
            (index) => SleepTimeChild(
              item: sleepTimeItems[index],
              isSelected: index == (4 - value).round(),
            ),
          ),
        ],
      ),
    );
  }
}
