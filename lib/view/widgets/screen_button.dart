import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({
    super.key,
    required this.buttonText,
    required this.background,
    required this.foreground,
    this.onPressed,
  });

  final String buttonText;
  final Color background;
  final Color foreground;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        elevation: 0,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}