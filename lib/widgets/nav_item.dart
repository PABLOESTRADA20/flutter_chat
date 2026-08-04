import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryContainer.withOpacity(0.1) : Colors.transparent,
        border: selected
            ? const Border(right: BorderSide(color: AppColors.primary, width: 4))
            : null,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
        dense: true,
        leading: Icon(icon,
            size: 20, color: selected ? AppColors.primary : AppColors.onSurfaceVariant),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
            color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
        ),
        onTap: () {},
        ),
      ),
    );
  }
}
