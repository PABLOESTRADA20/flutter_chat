import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../theme/app_colors.dart';
import 'suggestion_card_tile.dart';

class AiBubble extends StatelessWidget {
  final String text;
  final List<SuggestionCard>? cards;
  const AiBubble({super.key, required this.text, this.cards});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          ),
          child: const Icon(Icons.bolt, color: AppColors.primary, size: 16),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text,
                        style: const TextStyle(fontSize: 16, height: 1.6, color: AppColors.onSurface)),
                    if (cards != null) ...[
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isNarrow = constraints.maxWidth < 480;
                          return Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: cards!
                                .map((c) => SizedBox(
                                      width: isNarrow
                                          ? constraints.maxWidth
                                          : (constraints.maxWidth - 16) / 2,
                                      child: SuggestionCardTile(card: c),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const [
                    Icon(Icons.thumb_up_outlined, size: 16, color: AppColors.onSurfaceVariant),
                    SizedBox(width: 16),
                    Icon(Icons.thumb_down_outlined, size: 16, color: AppColors.onSurfaceVariant),
                    SizedBox(width: 16),
                    Icon(Icons.content_copy_outlined, size: 16, color: AppColors.onSurfaceVariant),
                    SizedBox(width: 16),
                    Icon(Icons.refresh, size: 16, color: AppColors.onSurfaceVariant),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
