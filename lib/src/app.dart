import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme/app_theme.dart';

class ProForceFinderApp extends StatelessWidget {
  const ProForceFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProForce Finder | Construction Staffing for Global Projects',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
