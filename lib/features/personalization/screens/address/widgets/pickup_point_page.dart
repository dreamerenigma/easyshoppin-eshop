import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';

class PickupPointPage extends StatefulWidget {
  const PickupPointPage({super.key});

  @override
  State<PickupPointPage> createState() => _PickupPointPageState();
}

class _PickupPointPageState extends State<PickupPointPage> {
  bool hasPickupPoints = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TAnimationLoaderWidget(
                    text: '',
                    animation: TImages.pickUpPointAnimation,
                  ),
                  Text(
                    S.of(context).yourPickUpPoint,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).addPickUpPointDelivery,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.push(context, createPageRoute(const MapsScreen()));
                    },
                    icon: const Icon(AkarIcons.plus, color: TColors.white),
                    label: Text(S.of(context).addPickUpPoint),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: hasPickupPoints ? () {} : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: TColors.black, backgroundColor: hasPickupPoints ? null : TColors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light ? TColors.buttonGrey : TColors.buttonDarkGrey,
                  width: 1.0,
                ),
              ),
              child: Text(S.of(context).buttonSave),
            ),
          ),
        ],
      ),
    );
  }
}
