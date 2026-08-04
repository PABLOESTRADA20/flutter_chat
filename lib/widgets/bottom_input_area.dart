import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BottomInputArea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const BottomInputArea({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    const chips = ['Optimizar código', 'Explicar conceptos', 'Debuggear error'];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: chips
                .map((c) => Chip(
                      label: Text(c, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.3)),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 4))],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: AppColors.onSurfaceVariant),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    minLines: 1,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onSubmitted: (_) => onSend(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: onSend,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Intelligence can make mistakes. Check important info.',
            style: TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
