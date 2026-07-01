import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    super.key,
    this.currentIndex = 0,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final items = [
      _NavItem(icon: LucideIcons.feather, label: 'Flocks'),
      _NavItem(icon: LucideIcons.egg, label: 'Produce'),
      _NavItem(icon: LucideIcons.layoutDashboard, label: 'Home'),
      _NavItem(icon: LucideIcons.dollarSign, label: 'Finance'),
      _NavItem(icon: LucideIcons.settings, label: 'Settings')
    ];

    return Container(
      color: scheme.surface,
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return _NavBarItem(
            icon: items[index].icon,
            label: items[index].label,
            isActive: index == currentIndex,
            scheme: scheme,
            onTap: () => onTabSelected(index),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final ColorScheme scheme;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.scheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? scheme.primary
        : scheme.onSurface.withValues(alpha: 0.4);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: scheme.primary.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: scheme.primary, size: 22),
            )
          else
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                color: scheme.onSurface.withValues(alpha: 0.4),
                size: 22,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
