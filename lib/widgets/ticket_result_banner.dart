import 'package:flutter/material.dart';
import '../theme/machenji_theme.dart';

enum TicketResultStatus { valid, invalid, used, checking }

class TicketResultBanner extends StatelessWidget {
  final TicketResultStatus status;
  final String? title;
  final String? message;

  const TicketResultBanner({
    super.key,
    required this.status,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final config = _config(status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: config.background,
        border: Border.all(color: config.color),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: config.color,
              shape: BoxShape.circle,
            ),
            child: Icon(config.icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? config.title,
                  style: const TextStyle(
                    color: MachenjiColors.text,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message ?? config.message,
                  style: const TextStyle(
                    color: MachenjiColors.textMuted,
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _TicketResultConfig _config(TicketResultStatus status) {
    switch (status) {
      case TicketResultStatus.valid:
        return _TicketResultConfig(
          color: MachenjiColors.success,
          background: MachenjiColors.success.withOpacity(0.15),
          icon: Icons.check_rounded,
          title: 'Ticket valid',
          message: 'This guest can enter.',
        );

      case TicketResultStatus.invalid:
        return _TicketResultConfig(
          color: MachenjiColors.error,
          background: MachenjiColors.error.withOpacity(0.15),
          icon: Icons.close_rounded,
          title: 'Invalid ticket',
          message: 'This ticket could not be verified.',
        );

      case TicketResultStatus.used:
        return _TicketResultConfig(
          color: MachenjiColors.warning,
          background: MachenjiColors.warning.withOpacity(0.15),
          icon: Icons.warning_amber_rounded,
          title: 'Already scanned',
          message: 'This ticket has already been used.',
        );

      case TicketResultStatus.checking:
        return _TicketResultConfig(
          color: MachenjiColors.primary,
          background: MachenjiColors.primary.withOpacity(0.15),
          icon: Icons.qr_code_scanner_rounded,
          title: 'Checking ticket',
          message: 'Please wait while Machenji verifies this ticket.',
        );
    }
  }
}

class _TicketResultConfig {
  final Color color;
  final Color background;
  final IconData icon;
  final String title;
  final String message;

  _TicketResultConfig({
    required this.color,
    required this.background,
    required this.icon,
    required this.title,
    required this.message,
  });
}