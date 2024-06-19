import 'package:flutter/material.dart';

/// Enum to define different types of loading indicators
enum LoadingIndicatorType {
  spinning,
  pulsing,
  bouncing,
}

/// A custom loading indicator that supports multiple types of animations.
class LoadingIndicator extends StatefulWidget {
  final LoadingIndicatorType indicatorType;
  final Duration duration;
  final Color color;
  final double size;

  const LoadingIndicator({
    this.indicatorType = LoadingIndicatorType.spinning,
    this.duration = const Duration(milliseconds: 1500),
    this.color = Colors.blue,
    this.size = 50.0,
    super.key,
  });

  @override
  LoadingIndicatorState createState() => LoadingIndicatorState();
}

class LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildIndicator(),
    );
  }

  Widget _buildIndicator() {
    switch (widget.indicatorType) {
      case LoadingIndicatorType.pulsing:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          ),
          child: _buildDot(),
        );
      case LoadingIndicatorType.bouncing:
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -30 * (0.5 - (0.5 - _controller.value).abs())),
              child: child,
            );
          },
          child: _buildDot(),
        );
      case LoadingIndicatorType.spinning:
      default:
        return RotationTransition(
          turns: _controller,
          child: _buildDot(),
        );
    }
  }

  Widget _buildDot() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
      ),
    );
  }
}