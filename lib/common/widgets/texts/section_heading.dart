import 'package:flutter/material.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle,
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
        Material(
          color: TColors.transparent,
          child: InkWell(
            onTap: onPressed,
            splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
            highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
            borderRadius: BorderRadius.all(Radius.circular(TSizes.borderRadiusMd)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(buttonTitle ?? S.of(context).viewAll),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.keyboard_arrow_right_outlined, color: TColors.softGrey, size: TSizes.iconMd),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
