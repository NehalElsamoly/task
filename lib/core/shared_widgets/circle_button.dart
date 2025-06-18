import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Widget child;
  final double size;
  final double elevation;

  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.white,
    this.size = 48.0,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
          elevation: elevation,
          padding: EdgeInsets.zero,
        ),
        child: child,
      ),
    );
  }
}
