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
              eyebrow: '',
              title: 'Our Services',
            ),
            SizedBox(height: 34),
            ResponsiveGrid(
              minItemWidth: 340,
              children: [
                FeatureCard(
                  icon: Icons.manage_search_rounded,
                  title: 'Custom Workforce Recruitment & On-Site Evaluation',
                  description:
                      "We identify and recruit construction professionals based on each client's specific needs. Our team conducts on-site evaluations in Portugal to ensure every candidate meets our professional standards before placement.",
                ),
                FeatureCard(
                  icon: Icons.fact_check_rounded,
                  title: 'Comprehensive Pre-Deployment Preparation',
                  description:
                      'We provide selected workers with full pre-deployment training, including workplace safety instruction, safety procedures, workplace culture orientation, and preparation for certification exams such as the Dutch VCA qualification.',
                ),
                FeatureCard(
                  icon: Icons.description_rounded,
                  title: 'Bureaucratic Pre-Screening',
                  description:
                      'We manage the bureaucratic preparation process, including document verification, work permits, and medical clearances.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
