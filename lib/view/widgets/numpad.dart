import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NumPad extends StatelessWidget {
  const NumPad({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'bio',
      '0',
      'del',
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: keys.map((key) {
        return _NumKey(keyValue: key);
      }).toList(),
    );
  }
}

class _NumKey extends StatelessWidget {
  final String keyValue;

  const _NumKey({required this.keyValue});

  @override
  Widget build(BuildContext context) {
    final isBio = keyValue == 'bio';
    final isDel = keyValue == 'del';
    final isEmpty = keyValue.isEmpty;

    if (isEmpty) return const SizedBox();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: isBio
            ? Icon(
                LucideIcons.fingerprint,
                size: 26,
                color: Theme.of(context).colorScheme.onSurface,
              )
            : isDel
            ? Icon(
                LucideIcons.x,
                size: 22,
                color: Theme.of(context).colorScheme.onSurface,
              )
            : Text(
                keyValue,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
      ),
    );
  }
}
