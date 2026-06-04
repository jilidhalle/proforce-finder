import 'package:flutter/material.dart';

import '../content/site_text.dart';
import '../theme/app_colors.dart';
import '../widgets/feature_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({required this.text, super.key});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(eyebrow: '', title: text.servicesTitle),
            const SizedBox(height: 34),
            ResponsiveGrid(
              minItemWidth: 340,
              children: [
                FeatureCard(
                  icon: Icons.manage_search_rounded,
                  title: text.services[0].title,
                  description: text.services[0].description,
                ),
                FeatureCard(
                  icon: Icons.fact_check_rounded,
                  title: text.services[1].title,
                  description: text.services[1].description,
                ),
                FeatureCard(
                  icon: Icons.description_rounded,
                  title: text.services[2].title,
                  description: text.services[2].description,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
