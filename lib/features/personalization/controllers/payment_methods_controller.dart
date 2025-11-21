import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../screens/payment_methods/fast_payment_system.dart';
import '../screens/payment_methods/link_new_card.dart';

class PaymentMethodsController extends GetxController {
  static PaymentMethodsController get instance => Get.find();

  var selectedPaymentMethod = ''.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value = box.read('selectedPaymentMethod') ?? '';
  }

  void setPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
    box.write('selectedPaymentMethod', method);
  }

  Future<void> selectPaymentMethods(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    S.of(context).selectPaymentMethod,
                    style: const TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: [
                Material(
                  color: TColors.transparent,
                  child: InkWell(
                    onTap: () {
                      setPaymentMethod(S.of(context).linkCard);
                      Get.back();
                      Get.to(() => const LinkNewCardScreen());
                    },
                    splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                    highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                    child: Obx(() => ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            TImages.mirCard,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            S.of(context).linkCard,
                            style: TextStyle(
                              color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                              fontSize: TSizes.fontSizeMd,
                            ),
                          ),
                        ],
                      ),
                      selected: selectedPaymentMethod.value == S.of(context).linkCard,
                    )),
                  ),
                ),
                Material(
                  color: TColors.transparent,
                  child: InkWell(
                    onTap: () {
                      setPaymentMethod(S.of(context).linkBankSBP);
                      Get.back();
                      Get.to(() => const FastPaymentSystemScreen());
                    },
                    splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                    highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                    child: Obx(() => ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            TImages.sbp,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            S.of(context).linkBankSBP,
                            style: TextStyle(
                              color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                              fontSize: TSizes.fontSizeMd,
                            ),
                          ),
                        ],
                      ),
                      selected: selectedPaymentMethod.value == S.of(context).linkBankSBP,
                    )),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwDefault),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
