import 'package:flutter/material.dart';

import '../content/site_text.dart';
import '../theme/app_colors.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({required this.text, super.key});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 900;
            final content = _WhyUsContent(text: text);
            const image = _WhyUsImage();

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [content, const SizedBox(height: 34), image],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: content),
                const SizedBox(width: 40),
                const Expanded(
                  flex: 9,
                  child: SizedBox(
                    height: 320,
                    child: _WhyUsImage(fillHeight: true),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WhyUsContent extends StatelessWidget {
  const _WhyUsContent({required this.text});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(eyebrow: '', title: text.whyUsTitle),
        const SizedBox(height: 24),
        _TrustBlock(
          icon: Icons.apartment_rounded,
          title: text.whyUsItems[0].title,
          description: text.whyUsItems[0].description,
        ),
        _TrustBlock(
          icon: Icons.verified_rounded,
          title: text.whyUsItems[1].title,
          description: text.whyUsItems[1].description,
        ),
      ],
    );
  }
}

class _WhyUsImage extends StatelessWidget {
  const _WhyUsImage({this.fillHeight = false});

  final bool fillHeight;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/building.jpeg',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(
              Icons.apartment_rounded,
              color: AppColors.steel.withValues(alpha: 0.7),
              size: 58,
            ),
          );
        },
      ),
    );

    if (fillHeight) {
      return image;
    }

    return AspectRatio(aspectRatio: 0.92, child: image);
  }
}

class _TrustBlock extends StatelessWidget {
  const _TrustBlock({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.orange, size: 30),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.steel,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
