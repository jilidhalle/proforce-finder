import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/feature_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: 'About',
              title: 'Focused talent scouting for construction teams',
              description:
                  'ProForce Finder is a specialized talent scouting operation dedicated to the construction sector. We identify and prepare professional teams for large-scale international projects.',
            ),
            const SizedBox(height: 24),
            Text(
              'Our goal is to ensure every placement is technically skilled, culturally prepared, and logistically ready for success abroad.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.steel,
                    height: 1.55,
                  ),
            ),
            const SizedBox(height: 34),
            const ResponsiveGrid(
              children: [
                FeatureCard(
                  icon: Icons.handyman_rounded,
                  title: 'Skilled Professionals',
                  description:
                      'Focused sourcing for workers with practical construction experience.',
                ),
                FeatureCard(
                  icon: Icons.business_rounded,
                  title: 'International Projects',
                  description:
                      'Preparation for teams working across borders and standards.',
                ),
                FeatureCard(
                  icon: Icons.verified_user_rounded,
                  title: 'Ready for Deployment',
                  description:
                      'Pre-screening that supports smoother project mobilization.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
