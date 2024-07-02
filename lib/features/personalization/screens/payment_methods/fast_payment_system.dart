import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/colors.dart';

class FastPaymentSystemScreen extends StatelessWidget {
  const FastPaymentSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).linkBankSBP,
          style: Theme
            .of(context)
            .textTheme
            .headlineMedium!
            .apply(color: TColors.white),
        ),
        showBackArrow: true,
        backArrowColor: TColors.white,
      ),
    );
  }
}