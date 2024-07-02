import 'package:flutter/material.dart';

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
    );
  }
}
