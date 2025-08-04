import 'package:flutter/material.dart';

class ForgotPasswordCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const ForgotPasswordCard({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: selected ? 6 : 0,
      shadowColor: theme.colorScheme.primary, // Utilise la couleur purple du thème
      color: theme.colorScheme.primaryContainer,
      shape: StadiumBorder(
        side: selected
            ? BorderSide(
                color: theme.colorScheme.primary, // Purple du thème
                width: 3,
              )
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1), // Purple avec transparence
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary, // Purple du thème
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

