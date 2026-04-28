import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/services_section.dart';
import '../sections/why_us_section.dart';
import '../theme/app_colors.dart';
import '../widgets/site_footer.dart';
import '../widgets/site_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _whyUsKey = GlobalKey();
  final _contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) {
      return;
    }

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final links = [
      NavLink(label: 'Home', onTap: () => _scrollTo(_homeKey)),
      NavLink(label: 'About', onTap: () => _scrollTo(_aboutKey)),
      NavLink(label: 'Services', onTap: () => _scrollTo(_servicesKey)),
      NavLink(label: 'Why Us', onTap: () => _scrollTo(_whyUsKey)),
      NavLink(label: 'Contact', onTap: () => _scrollTo(_contactKey)),
    ];

    return Scaffold(
      endDrawer: SiteNavigationDrawer(links: links),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: AppColors.white.withValues(alpha: 0.96),
                surfaceTintColor: AppColors.white,
                toolbarHeight: 76,
                titleSpacing: 0,
                title: SiteNavigationBar(
                  links: links,
                  onMenuPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HeroSection(
                      key: _homeKey,
                      onRequestTalent: () => _scrollTo(_contactKey),
                      onLearnMore: () => _scrollTo(_aboutKey),
                    ),
                    AboutSection(key: _aboutKey),
                    ServicesSection(key: _servicesKey),
                    WhyUsSection(key: _whyUsKey),
                    ContactSection(key: _contactKey),
                    const SiteFooter(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
