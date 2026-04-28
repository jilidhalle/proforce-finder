import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_shell.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: const Text(
          'ProForce Finder - Construction staffing for global projects',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
