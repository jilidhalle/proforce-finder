import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_shell.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Text(text, style: const TextStyle(color: AppColors.white)),
      ),
    );
  }
}
