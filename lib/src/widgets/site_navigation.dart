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
    required this.onMenuPressed,
    super.key,
  });

  final List<NavLink> links;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return SiteShell(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 760;

          return Row(
            children: [
              const _BrandMark(),
              const Spacer(),
              if (isCompact)
                IconButton(
                  tooltip: 'Open navigation',
                  onPressed: onMenuPressed,
                  icon: const Icon(Icons.menu_rounded),
                )
              else
                Row(
                  children: [
                    for (final link in links)
                      TextButton(
                        onPressed: link.onTap,
                        child: Text(link.label),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

class SiteNavigationDrawer extends StatelessWidget {
  const SiteNavigationDrawer({required this.links, super.key});

  final List<NavLink> links;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: _BrandMark(),
              ),
              const Divider(height: 32),
              for (final link in links)
                ListTile(
                  title: Text(link.label),
                  onTap: () {
                    Navigator.of(context).pop();
                    link.onTap();
                  },
                ),
            ],
          ),
        ),
      ),
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
