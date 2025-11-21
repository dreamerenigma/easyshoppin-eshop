import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:easyshoppin_eshop/data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';

class CourierPage extends StatefulWidget {
  const CourierPage({super.key});

  @override
  State<CourierPage> createState() => _CourierPageState();
}

class _CourierPageState extends State<CourierPage> {
  bool hasDeliveryPoints = false;

  // void addDeliveryPoint() {
  //   // Add logic to add a delivery point
  //   hasDeliveryPoints = true; // Update hasDeliveryPoints to true
  // }

  // void removeDeliveryPoint() {
  //   // Add logic to remove a delivery point
  //   // Check if there are any remaining delivery points
  //   if (remainingDeliveryPoints.isEmpty) {
  //     hasDeliveryPoints = false; // Update hasDeliveryPoints to false
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authController = Get.put(AuthenticationRepository());

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Obx(() {
                if (authController.isAuthenticated.value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TAnimationLoaderWidget(
                        text: '',
                        animation: TImages.placemarkAnimation,
                      ),
                      Text(
                        S.of(context).yourAddresses,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).yourDeliveryAddress,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(AkarIcons.plus, color: TColors.white),
                        label: Text(S.of(context).addDeliveryAddress),
                        style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).courierDelivery,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        ),
                        child: Text(S.of(context).loginAccount),
                      ),
                    ],
                  );
                }
              }),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: hasDeliveryPoints ? () {} : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: hasDeliveryPoints ? null : TColors.grey,
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
