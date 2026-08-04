import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TopAppBar extends StatelessWidget {
  final bool isWide;
  final int selectedTab;
  final ValueChanged<int> onTabSelected;
  final VoidCallback? onMenuTap;

  const TopAppBar({
    super.key,
    required this.isWide,
    required this.selectedTab,
    required this.onTabSelected,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    const tabs = ['GPT-4', 'Claude 3', 'Gemini'];
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.8),
        border: Border(bottom: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
      ),
      child: Row(
        children: [
          if (!isWide) ...[
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.onSurface),
              onPressed: onMenuTap,
              tooltip: 'Abrir menú',
            ),
            const SizedBox(width: 4),
            const Text('Intelligence',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
          if (isWide)
            Expanded(
              child: Row(
                children: List.generate(tabs.length, (i) {
                  final selected = i == selectedTab;
                  return Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: InkWell(
                      onTap: () => onTabSelected(i),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selected ? AppColors.primary : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          tabs[i],
                          style: TextStyle(
                            color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
                            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          else
            const Spacer(),
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.onSurfaceVariant, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.onSurfaceVariant, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
