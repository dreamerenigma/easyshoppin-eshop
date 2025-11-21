import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import '../../../../../../generated/l10n/l10n.dart';

class FeedbackButton extends StatelessWidget {
  final bool allFieldsFilled;
  final Future<void> Function() handleSendFeedback;

  const FeedbackButton({
    super.key,
    required this.allFieldsFilled,
    required this.handleSendFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (allFieldsFilled) {
            handleSendFeedback();
          } else {
            TLoaders.customToast(message: S.of(context).notAllFields);
          }
        },
        child: Text(S.of(context).sendFeedbackMessage),
      ),
    );
  }
}
