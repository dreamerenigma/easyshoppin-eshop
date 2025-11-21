import 'package:flutter/material.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({
    super.key,
    required this.allFieldsFilled,
    required this.handleSendFeedback,
  });

  final bool allFieldsFilled;
  final Future<void> Function() handleSendFeedback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: allFieldsFilled ? handleSendFeedback : null,
      child: const Text('Send Feedback'),
    );
  }
}
