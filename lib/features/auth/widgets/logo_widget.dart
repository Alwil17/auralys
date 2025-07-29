import 'package:auralys/shared/app_assets.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  final double size;
  final EdgeInsets margin;

  const LogoWidget({
    super.key,
    this.size = 50,
    this.margin = const EdgeInsets.only(top: 80),
  });

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  bool _logoLoaded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: widget.margin,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!_logoLoaded)
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(widget.size / 2),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                  strokeWidth: 2,
                ),
              ),
            ),
          AnimatedOpacity(
            opacity: _logoLoaded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.size / 2),
              child: Image.asset(
                AppAssets.logo,
                width: widget.size,
                height: widget.size,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) setState(() => _logoLoaded = true);
                  });
                  return Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(widget.size / 2),
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: widget.size * 0.48,
                    ),
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _logoLoaded = true);
                    });
                  }
                  return child;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
