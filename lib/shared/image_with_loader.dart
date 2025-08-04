// Widget pour le logo avec loader
import 'package:flutter/material.dart';

class ImageWithLoader extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final double radius;
  final BoxFit? fit;

  const ImageWithLoader({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.fit = BoxFit.contain,
    this.radius = 0,
  });

  @override
  State<ImageWithLoader> createState() => _ImageWithLoaderState();
}

class _ImageWithLoaderState extends State<ImageWithLoader> {
  bool _imageLoaded = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image avec cache et gestion d'erreur
            ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                cacheWidth: widget.width.toInt(), // Cache optimisé
                cacheHeight: widget.height.toInt(),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    // Image chargée avec succès
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted && !_imageLoaded) {
                        setState(() => _imageLoaded = true);
                      }
                    });
                    return child;
                  }
                  return const SizedBox.shrink(); // Pas encore chargée
                },
                errorBuilder: (context, error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted && !_hasError) {
                      setState(() => _hasError = true);
                    }
                  });
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius),
                    child: Icon(
                      Icons.image_not_supported,
                      size: widget.width * 0.3,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            // Loader seulement si image pas encore chargée
            if (!_imageLoaded && !_hasError)
              const CircularProgressIndicator(strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
