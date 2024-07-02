import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/image_strings.dart';
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
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).selectPaymentMethod,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const Divider(),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 6),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            TImages.mirCard,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(width: 16),
                          Text(S.of(context).linkCard),
                        ],
                      ),
                      selected: selectedPaymentMethod.value == S.of(context).linkCard,
                      onTap: () {
                        setPaymentMethod(S.of(context).linkCard);
                        Get.back();
                        Get.to(() => const LinkNewCardScreen());
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            TImages.sbp,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(width: 16),
                          Text(S.of(context).linkBankSBP),
                        ],
                      ),
                      selected: selectedPaymentMethod.value == S.of(context).linkBankSBP,
                      onTap: () {
                        setPaymentMethod(S.of(context).linkBankSBP);
                        Get.back();
                        Get.to(() => const FastPaymentSystemScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
