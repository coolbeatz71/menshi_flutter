import 'dart:ui';

/// A utility class for drawing and animating paths.
class BorderDraw {
  /// Creates an animated path based on the original path and the animation percentage.
  ///
  /// [originalPath] is the path to be animated.
  /// [animationPercent] is the percentage of the animation completed (0.0 to 1.0).
  /// Returns a new path that represents the animated portion of the original path.
  static Path createAnimatedPath(Path originalPath, double animationPercent) {
    // computeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  // Extracts a portion of the original path up to the specified length.
  ///
  /// [originalPath] is the path to be extracted from.
  /// [length] is the length up to which the path should be extracted.
  /// Returns a new path that represents the portion of the original path up to the specified length.
  static Path extractPathUntilLength(Path originalPath, double length) {
    final path = Path();

    double currentLength = 0.0;
    Iterator<PathMetric> metricsIterator =
        originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      PathMetric metric = metricsIterator.current;
      double nextLength = currentLength + metric.length;
      final bool isLastSegment = nextLength > length;

      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        path.addPath(originalPath, Offset.zero);
        break;
      }
    }

    return path;
  }
}
