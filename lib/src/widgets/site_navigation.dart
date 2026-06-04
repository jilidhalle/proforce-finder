import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_shell.dart';

class NavLink {
  const NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;
}

class SiteNavigationBar extends StatelessWidget {
  const SiteNavigationBar({
    required this.links,
    required this.languageToggleLabel,
    required this.openNavigationLabel,
    required this.onToggleLanguage,
    super.key,
  });

  final List<NavLink> links;
  final String languageToggleLabel;
  final String openNavigationLabel;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 760;

    return SiteShell(
      child: Row(
        children: [
          const _BrandMark(),
          const Spacer(),
          if (isCompact)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LanguageToggle(
                  label: languageToggleLabel,
                  onPressed: onToggleLanguage,
                ),
                const SizedBox(width: 6),
                _NavigationMenuButton(
                  links: links,
                  tooltip: openNavigationLabel,
                ),
              ],
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final link in links)
                  TextButton(onPressed: link.onTap, child: Text(link.label)),
                const SizedBox(width: 8),
                _LanguageToggle(
                  label: languageToggleLabel,
                  onPressed: onToggleLanguage,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavigationMenuButton extends StatelessWidget {
  const _NavigationMenuButton({required this.links, required this.tooltip});

  final List<NavLink> links;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<NavLink>(
      tooltip: tooltip,
      icon: const Icon(Icons.menu_rounded, color: AppColors.navy),
      position: PopupMenuPosition.under,
      onSelected: (link) => link.onTap(),
      itemBuilder: (context) {
        return [
          for (final link in links)
            PopupMenuItem(value: link, child: Text(link.label)),
        ];
      },
    );
  }
}

class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(44, 38),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        foregroundColor: AppColors.navy,
        side: const BorderSide(color: AppColors.line),
        textStyle: const TextStyle(fontWeight: FontWeight.w800),
      ),
      child: Text(label),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.line),
          ),
          child: Image.asset('assets/proforce-logo.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        const Text(
          'ProForce Finder',
          style: TextStyle(
            color: AppColors.navy,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
