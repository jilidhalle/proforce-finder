import 'package:flutter/material.dart';

import '../content/site_text.dart';
import '../theme/app_colors.dart';
import '../widgets/site_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({required this.text, super.key});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 900;
            const imagePlaceholder = _AboutImagePlaceholder();
            final content = _AboutContent(text: text);

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imagePlaceholder,
                  const SizedBox(height: 36),
                  content,
                ],
              );
            }

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 9,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _AboutImagePlaceholder(fillHeight: true),
                    ),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    flex: 11,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: content,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent({required this.text});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    final paragraphStyle = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: AppColors.steel, height: 1.55);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text.aboutEyebrow,
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 24),
        _AboutParagraph(
          icon: Icons.manage_search_rounded,
          text: text.aboutParagraphs[0],
          style: paragraphStyle,
        ),
        const SizedBox(height: 16),
        _AboutParagraph(
          icon: Icons.groups_rounded,
          text: text.aboutParagraphs[1],
          style: paragraphStyle,
        ),
        const SizedBox(height: 16),
        _AboutParagraph(
          icon: Icons.verified_user_rounded,
          text: text.aboutParagraphs[2],
          style: paragraphStyle,
        ),
      ],
    );
  }
}

class _AboutParagraph extends StatelessWidget {
  const _AboutParagraph({
    required this.icon,
    required this.text,
    required this.style,
  });

  final IconData icon;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.orange.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.orange, size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}

class _AboutImagePlaceholder extends StatelessWidget {
  const _AboutImagePlaceholder({this.fillHeight = false});

  final bool fillHeight;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/guy.jpeg',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _AboutImageFallback();
        },
      ),
    );

    if (fillHeight) {
      return image;
    }

    return AspectRatio(aspectRatio: 0.86, child: image);
  }
}

class _AboutImageFallback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surface,
                  AppColors.line.withValues(alpha: 0.65),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.image_outlined,
            size: 58,
            color: AppColors.steel.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
