import 'package:flutter/material.dart';
import '../theme/machenji_theme.dart';

class MachenjiButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;

  const MachenjiButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = loading
        ? const SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: Colors.white,
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 10),
        ],
        Text(text),
      ],
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: MachenjiColors.primary.withOpacity(0.45),
          disabledForegroundColor: Colors.white.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        child: child,
      ),
    );
  }
}