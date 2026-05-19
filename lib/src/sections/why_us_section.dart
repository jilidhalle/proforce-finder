import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 900;
            const content = _WhyUsContent();
            const image = _WhyUsImage();

            if (isCompact) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [content, SizedBox(height: 34), image],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(flex: 11, child: content),
                SizedBox(width: 40),
                Expanded(
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
  const _WhyUsContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          eyebrow: '',
          title: 'Why Choose Us?',
        ),
        SizedBox(height: 24),
        _TrustBlock(
          icon: Icons.apartment_rounded,
          title: 'Proven Urban Construction Expertise',
          description:
              'We bring extensive experience in urban construction, with proven involvement in advanced building projects in major cities such as Tel Aviv, including work on high-rise developments.',
        ),
        _TrustBlock(
          icon: Icons.verified_rounded,
          title: 'Maximum Efficiency & Peace of Mind',
          description:
              'We provide a complete end-to-end solution, allowing clients to focus on their operations while we handle the recruitment process, documentation, and administrative coordination.',
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
