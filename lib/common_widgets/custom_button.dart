import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.child, this.color, this.radius: 4, this.onPressed, this.height: 50})
      : assert(radius != null);

  final Widget child;
  final Color color;
  final double radius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
