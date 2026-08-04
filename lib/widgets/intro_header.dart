import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryContainer.withOpacity(0.2)),
          ),
          child: const Icon(Icons.auto_awesome, color: AppColors.primary, size: 32),
        ),
        const SizedBox(height: 16),
        const Text(
          'How can I help you today?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.onSurface),
        ),
        const SizedBox(height: 4),
        Text(
          'Precise logic. High-performance computation.',
          style: TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}
