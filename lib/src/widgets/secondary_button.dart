import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    this.onDark = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: onDark ? AppColors.white : AppColors.navy,
        side: BorderSide(color: onDark ? AppColors.white : AppColors.navy),
        minimumSize: const Size(132, 48),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontWeight: FontWeight.w800),
      ),
      child: Text(label),
    );
  }
}
