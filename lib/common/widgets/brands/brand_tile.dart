import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_sizes.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandTileWithVerifiedIcon extends StatefulWidget {
  const TBrandTileWithVerifiedIcon({
    super.key, required this.title,
  });

  final String title;

  @override
  TBrandTileWithVerifiedIconState createState() => TBrandTileWithVerifiedIconState();
}

class TBrandTileWithVerifiedIconState extends State<TBrandTileWithVerifiedIcon> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TBrandTitleWithVerifiedIcon(title: widget.title),
        const Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Icon(
            isChecked ? FluentIcons.checkbox_checked_20_filled : FluentIcons.checkbox_unchecked_20_regular,
            color: Theme.of(context).iconTheme.color,
            size: TSizes.iconBg,
          ),
        ),
      ],
    );
  }
}
