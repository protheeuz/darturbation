import 'package:flutter/material.dart';

/// Enum to define different types of button animations
enum ButtonAnimationType {
  pulse,
  bounce,
  rotation,
}

/// A custom animated button that supports multiple types of animations.
class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonAnimationType animationType;
  final Duration duration;
  final Curve curve;

  const AnimatedButton({
    required this.text,
    required this.onPressed,
    this.animationType = ButtonAnimationType.pulse,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    switch (widget.animationType) {
      case ButtonAnimationType.pulse:
        _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
          CurvedAnimation(parent: _controller, curve: widget.curve),
        );
        break;
      case ButtonAnimationType.bounce:
        _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
          CurvedAnimation(parent: _controller, curve: widget.curve),
        );
        break;
      case ButtonAnimationType.rotation:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.curve),
        );
        break;
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _handleTap(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          switch (widget.animationType) {
            case ButtonAnimationType.pulse:
            case ButtonAnimationType.bounce:
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            case ButtonAnimationType.rotation:
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14159,
                child: child,
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}