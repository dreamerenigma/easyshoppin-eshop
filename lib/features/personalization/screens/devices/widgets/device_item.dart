import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

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
      default:
        imageAsset = TImages.smartphone;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              width: 50.0,
              height: 50.0,
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
                      Text(
                        session,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.check),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    deviceName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    ip,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.darkGrey),
                  ),
                  Text(
                    app,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.darkGrey),
                  ),
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

