import 'package:flutter/material.dart';

import '../content/site_text.dart';
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

  SiteLanguage _language = SiteLanguage.english;

  void _toggleLanguage() {
    setState(() {
      _language = _language == SiteLanguage.english
          ? SiteLanguage.hebrew
          : SiteLanguage.english;
    });
  }

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
    final text = siteTextByLanguage[_language]!;
    final links = [
      NavLink(label: text.navHome, onTap: () => _scrollTo(_homeKey)),
      NavLink(label: text.navAbout, onTap: () => _scrollTo(_aboutKey)),
      NavLink(label: text.navServices, onTap: () => _scrollTo(_servicesKey)),
      NavLink(label: text.navWhyUs, onTap: () => _scrollTo(_whyUsKey)),
      NavLink(label: text.navContact, onTap: () => _scrollTo(_contactKey)),
    ];

    return Directionality(
      textDirection: text.isHebrew ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: CustomScrollView(
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
                languageToggleLabel: text.languageToggleLabel,
                openNavigationLabel: text.openNavigation,
                onToggleLanguage: _toggleLanguage,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HeroSection(
                    key: _homeKey,
                    text: text,
                    onRequestTalent: () => _scrollTo(_contactKey),
                  ),
                  AboutSection(key: _aboutKey, text: text),
                  ServicesSection(key: _servicesKey, text: text),
                  WhyUsSection(key: _whyUsKey, text: text),
                  ContactSection(key: _contactKey, text: text),
                  SiteFooter(text: text.footerText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
