import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_shell.dart';

class NavLink {
  const NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;
}

class SiteNavigationBar extends StatelessWidget {
  const SiteNavigationBar({required this.links, super.key});

  final List<NavLink> links;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 760;

    return SiteShell(
      child: Row(
        children: [
          const _BrandMark(),
          const Spacer(),
          if (isCompact)
            _NavigationMenuButton(links: links)
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final link in links)
                  TextButton(onPressed: link.onTap, child: Text(link.label)),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavigationMenuButton extends StatelessWidget {
  const _NavigationMenuButton({required this.links});

  final List<NavLink> links;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<NavLink>(
      tooltip: 'Open navigation',
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.navy,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.engineering_rounded,
            color: AppColors.orange,
            size: 22,
          ),
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
