import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import '../widgets/site_shell.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.onRequestTalent,
    required this.onLearnMore,
    super.key,
  });

  final VoidCallback onRequestTalent;
  final VoidCallback onLearnMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      child: SiteShell(
        padding: const EdgeInsets.fromLTRB(24, 84, 24, 92),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 840;

            final content = _HeroCopy(
              onRequestTalent: onRequestTalent,
              onLearnMore: onLearnMore,
            );
            const visual = _ConstructionVisual();

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  content,
                  const SizedBox(height: 42),
                  visual,
                ],
              );
            }

            return Row(
              children: [
                Expanded(flex: 11, child: content),
                const SizedBox(width: 56),
                const Expanded(flex: 10, child: visual),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.onRequestTalent,
    required this.onLearnMore,
  });

  final VoidCallback onRequestTalent;
  final VoidCallback onLearnMore;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Construction Talent Scouting',
            style: TextStyle(
              color: AppColors.orange,
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'ProForce Finder: Precision Staffing for Global Construction',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.white,
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  height: 1.04,
                ),
          ),
          const SizedBox(height: 22),
          Text(
            'Connecting international industry leaders with high-skilled, vetted construction professionals.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.78),
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 34),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              PrimaryButton(
                label: 'Request Talent',
                onPressed: onRequestTalent,
                icon: Icons.assignment_ind_rounded,
              ),
              SecondaryButton(
                label: 'Learn More',
                onPressed: onLearnMore,
                onDark: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConstructionVisual extends StatelessWidget {
  const _ConstructionVisual();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.16,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.navyLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _ConstructionPainter()),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.navy.withValues(alpha: 0.88),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.public_rounded,
                      color: AppColors.orange,
                      size: 26,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'International readiness for demanding construction projects',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConstructionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.06)
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += 34) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (var y = 0.0; y < size.height; y += 34) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final steelPaint = Paint()..color = AppColors.steel.withValues(alpha: 0.7);
    final orangePaint = Paint()..color = AppColors.orange;
    final beamPaint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.2)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.square;

    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.11, size.height * 0.58, size.width * 0.78,
          size.height * 0.08),
      steelPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.21, size.height * 0.34, size.width * 0.1,
          size.height * 0.32),
      steelPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.52, size.height * 0.25, size.width * 0.1,
          size.height * 0.41),
      steelPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.74, size.height * 0.42, size.width * 0.1,
          size.height * 0.24),
      steelPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.08, size.height * 0.28),
      Offset(size.width * 0.84, size.height * 0.12),
      beamPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.12, size.height * 0.28),
      Offset(size.width * 0.22, size.height * 0.08),
      beamPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.68, size.height * 0.15),
      Offset(size.width * 0.78, size.height * 0.35),
      beamPaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.84, size.height * 0.12),
      8,
      orangePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.78, size.height * 0.35, size.width * 0.12,
          size.height * 0.035),
      orangePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
