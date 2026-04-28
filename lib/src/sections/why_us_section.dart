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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: 'Why Choose Us',
              title: 'Built for project-critical staffing decisions',
              description:
                  'A focused alternative to generic recruitment, centered on construction expertise, readiness, and reliable project matching.',
            ),
            const SizedBox(height: 36),
            const _TrustBlock(
              icon: Icons.apartment_rounded,
              title: 'Modern Industry Experience',
              description:
                  'We exclusively source professionals with proven experience in modern construction environments and advanced building standards.',
            ),
            const _TrustBlock(
              icon: Icons.tune_rounded,
              title: 'Tailor-Made Solutions',
              description:
                  "Delivering the exact professional match for your project's requirements.",
            ),
            const _TrustBlock(
              icon: Icons.schedule_rounded,
              title: 'Efficiency & Reliability',
              description:
                  'We handle the complexity of recruitment so you can stay focused on your deadlines.',
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _Badge(label: 'Vetted Professionals'),
                _Badge(label: 'International Readiness'),
                _Badge(label: 'Project-Focused Matching'),
              ],
            ),
          ],
        ),
      ),
    );
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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(22),
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
                const SizedBox(height: 8),
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

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
