import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_colors.dart';

class GeolocationSwitch extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const GeolocationSwitch({
    super.key,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isEnabled,
      onChanged: onChanged,
      activeThumbColor: TColors.primary,
      activeTrackColor: TColors.primary.withAlpha((0.5 * 255).toInt()),
    );
  }
}
