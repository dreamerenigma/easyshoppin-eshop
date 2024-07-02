import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandTileWithVerifiedIcon extends StatelessWidget {
  const TBrandTileWithVerifiedIcon({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TBrandTitleWithVerifiedIcon(title: title),
        const Spacer(),
        Icon(FluentIcons.checkbox_unchecked_20_regular, color: Theme.of(context).iconTheme.color),
      ],
    );
  }
}
