import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.eyebrow,
    required this.title,
    this.description,
    this.centered = false,
    this.onDark = false,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String? description;
  final bool centered;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: textTheme.headlineMedium?.copyWith(
            color: onDark ? AppColors.white : AppColors.navy,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              description!,
              textAlign: centered ? TextAlign.center : TextAlign.start,
              style: textTheme.bodyLarge?.copyWith(
                color: onDark
                    ? AppColors.white.withValues(alpha: 0.76)
                    : AppColors.steel,
                height: 1.55,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
