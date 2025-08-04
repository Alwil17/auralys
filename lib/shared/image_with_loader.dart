// Widget for image with loader
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
            // Image with cache and error handling
            ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                cacheWidth: widget.width.toInt(), // Optimized caching
                cacheHeight: widget.height.toInt(),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    // Image loaded successfully
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted && !_imageLoaded) {
                        setState(() => _imageLoaded = true);
                      }
                    });
                    return child;
                  }
                  return const SizedBox.shrink(); // Not loaded yet
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

            // Loader only if image is not loaded and no error
            if (!_imageLoaded && !_hasError)
              const CircularProgressIndicator(strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
