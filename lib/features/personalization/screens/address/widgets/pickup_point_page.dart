import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../maps/maps.dart';

class PickupPointPage extends StatelessWidget {
  const PickupPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasPickupPoints = false;

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

                  // Text below animation
                  Text(
                    S.of(context).yourPickUpPoint,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 8),

                  // Description text
                  Text(
                    S.of(context).addPickUpPointDelivery,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 16),

                  // Button with icon and text
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MapsScreen()),
                      );
                    },
                    icon: const Icon(AkarIcons.plus),
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
              onPressed: hasPickupPoints
                  ? () {}
                  : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: hasPickupPoints ? null : Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? TColors.buttonGrey
                      : TColors.buttonDarkGrey,
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
