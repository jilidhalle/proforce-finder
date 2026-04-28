import 'package:flutter/material.dart';

class SiteShell extends StatelessWidget {
  const SiteShell({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}
