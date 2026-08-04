import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'nav_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.surfaceContainerLow,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Intelligence',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('New Chat'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimaryContainer,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 1,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: const [
                    NavItem(icon: Icons.chat_bubble_outline, label: 'Recent Chats', selected: true),
                    NavItem(icon: Icons.archive_outlined, label: 'Archived', selected: false),
                    NavItem(icon: Icons.settings_outlined, label: 'Settings', selected: false),
                    NavItem(icon: Icons.help_outline, label: 'Help', selected: false),
                  ],
                ),
              ),
              const Divider(color: AppColors.outlineVariant),
              const SizedBox(height: 8),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.surfaceContainerHighest,
                    child: Icon(Icons.person, size: 18, color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Profile', style: TextStyle(fontSize: 12, color: AppColors.onSurface)),
                        Text('Pro Plan',
                            style: TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  const Icon(Icons.logout, size: 18, color: AppColors.onSurfaceVariant),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
