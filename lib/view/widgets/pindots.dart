import 'package:flutter/material.dart';

class PinDots extends StatelessWidget {
  const PinDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.2),
                width: 2.0,
              ),
            ),
          );
        }),
      ),
    );
  }
}
