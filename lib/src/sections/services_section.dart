import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/feature_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: const SiteShell(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              eyebrow: 'Services',
              title: 'Practical support from sourcing to readiness',
              description:
                  'Structured services designed for construction leaders who need dependable teams for demanding project environments.',
            ),
            SizedBox(height: 34),
            ResponsiveGrid(
              minItemWidth: 245,
              children: [
                FeatureCard(
                  icon: Icons.manage_search_rounded,
                  title: 'Elite Talent Sourcing',
                  description:
                      'Finding experienced workers tailored to your specific needs.',
                ),
                FeatureCard(
                  icon: Icons.fact_check_rounded,
                  title: 'Professional Skill Assessment',
                  description:
                      'Ensuring the highest standards of workmanship.',
                ),
                FeatureCard(
                  icon: Icons.description_rounded,
                  title: 'Bureaucratic Pre-Screening',
                  description:
                      'Evaluating legal feasibility for international deployment.',
                ),
                FeatureCard(
                  icon: Icons.language_rounded,
                  title: 'Language & Cultural Orientation',
                  description:
                      'Providing basic training to ensure a smooth transition.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
