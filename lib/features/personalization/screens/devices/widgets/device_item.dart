import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_sizes.dart';

class DeviceItem extends StatelessWidget {
  final String session;
  final String deviceName;
  final String location;
  final String ip;
  final String app;
  final DeviceType deviceType;

  const DeviceItem({
    super.key,
    required this.session,
    required this.deviceName,
    required this.location,
    required this.ip,
    required this.app,
    required this.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    String imageAsset;
    switch (deviceType) {
      case DeviceType.smartphone:
        imageAsset = TImages.smartphone;
        break;
      case DeviceType.desktop:
        imageAsset = TImages.desktop;
        break;
      }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 60.0,
              height: 60.0,
            ),
            const SizedBox(width: 18.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(BootstrapIcons.check_circle_fill, size: 18.0, color: TColors.check),
                      const SizedBox(width: 8.0),
                      Text(session, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.check)),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(deviceName, style: TextStyle(fontSize: TSizes.fontSizeXl, fontWeight: FontWeight.bold)),
                  Text(location, style: TextStyle(fontSize: TSizes.fontSizeSm)),
                  Text(ip, style: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeSm)),
                  Text(app, style: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeSm)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum DeviceType {
  smartphone,
  desktop,
}
