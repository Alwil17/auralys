import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final bool isSelected;
  final bool isMale;

  const GenderCard({
    super.key,
    required this.isSelected,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: isSelected ? 2 : 0,
      color: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryContainer,
          width: isSelected ? 3 : 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isMale ? 'Male' : 'Female',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isMale 
                        ? 'Identify as male'
                        : 'Identify as female',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                isMale ? Icons.male : Icons.female,
                size: 32,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderStep extends StatefulWidget {
  const GenderStep({super.key});

  @override
  State<GenderStep> createState() => _GenderStepState();
}

class _GenderStepState extends State<GenderStep> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _selectedValue = 1),
            child: GenderCard(
              isSelected: _selectedValue == 1,
              isMale: true,
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () => setState(() => _selectedValue = 2),
            child: GenderCard(
              isSelected: _selectedValue == 2,
              isMale: false,
            ),
          ),
        ],
      ),
    );
  }
}
