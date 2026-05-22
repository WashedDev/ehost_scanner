import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const ResultScreen({
    super.key,
    required this.result,
  });

  bool get isSuccess => result['checked_in'] == true;

  @override
  Widget build(BuildContext context) {
    final ticket = result['ticket'] as Map<String, dynamic>?;

    final String title = isSuccess
        ? 'Ticket Checked In'
        : result['message'] ?? 'Ticket Not Valid';

    final IconData icon = isSuccess ? Icons.check_circle : Icons.cancel;
    final Color color = isSuccess ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(icon, size: 96, color: color),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  if (ticket != null) ...[
                    const SizedBox(height: 32),
                    _InfoRow(label: 'Order', value: ticket['id']),
                    _InfoRow(label: 'Event', value: ticket['event_name']),
                    _InfoRow(label: 'Ticket Type', value: ticket['ticket_type']),
                    _InfoRow(label: 'Customer', value: ticket['customer_name']),
                    _InfoRow(label: 'Email', value: ticket['customer_email']),
                    _InfoRow(label: 'Phone', value: ticket['customer_phone']),
                    _InfoRow(label: 'Status', value: ticket['status']),
                  ],

                  const SizedBox(height: 32),

                  FilledButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Another Ticket'),
                  ),

                  const SizedBox(height: 12),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text('Back Home'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final dynamic value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null || value.toString().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value.toString())),
        ],
      ),
    );
  }
}