// Widget pour le logo avec loader
import 'package:auralys/shared/app_colors.dart';
import 'package:flutter/material.dart';

class ImageWithLoader extends StatefulWidget {
  final double width;
  final double height;
  final String imagePath;
  const ImageWithLoader({super.key, required this.width, required this.height, required this.imagePath});

  @override
  State<ImageWithLoader> createState() => ImageWithLoaderState();
}

class ImageWithLoaderState extends State<ImageWithLoader> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!_loaded)
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.light.purple),
              strokeWidth: 2,
            ),
          AnimatedOpacity(
            opacity: _loaded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ClipOval(
              child: Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) setState(() => _loaded = true);
                  });
                  return Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFA971E1),
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _loaded = true);
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