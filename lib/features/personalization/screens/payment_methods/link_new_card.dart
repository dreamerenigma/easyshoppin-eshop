import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class LinkNewCardScreen extends StatelessWidget {
  const LinkNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).linkNewCard,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
        backArrowColor: TColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: S.of(context).cardNumber,
                border: const OutlineInputBorder(),
                labelStyle: const TextStyle(fontSize: TSizes.fontSizeMd, color: TColors.darkGrey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: S.of(context).validity,
                          border: const OutlineInputBorder(),
                          labelStyle: const TextStyle(fontSize: TSizes.fontSizeMd, color: TColors.darkGrey),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: TSizes.defaultSpace),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'CVV/CVC',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: TColors.darkGrey),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                      const SizedBox(height: 8.0), // Adjust for spacing
                      Text(
                        S.of(context).digitsCardBack,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your button press logic here
                },
                child: Text(S.of(context).linkCard),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(TImages.mirCard),
                    height: 20.0,
                  ),
                  SizedBox(width: TSizes.defaultSpace),
                  Image(
                    image: AssetImage(TImages.sbp),
                    height: 20.0,
                  ),
                  SizedBox(width: TSizes.defaultSpace),
                  Image(
                    image: AssetImage(TImages.tinkoff),
                    height: 25.0,
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
