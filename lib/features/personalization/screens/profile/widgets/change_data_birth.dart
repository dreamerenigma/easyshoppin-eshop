import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/update_data_birth_controller.dart';

class ChangeDataBirth extends StatelessWidget {
  const ChangeDataBirth({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateDateBirthController());

    final List<String> days = List.generate(31, (index) => (index + 1).toString());
    final List<String> months = List.generate(12, (index) => (index + 1).toString());
    final List<String> years = List.generate(100, (index) => (DateTime.now().year - index).toString());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).titleChangeDateBirth, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).subTitleChangeDateBirth,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updateDateBirthFormKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).day),
                              Obx(() => SizedBox(
                                width: double.infinity,
                                child: DropdownButton<String>(
                                  alignment: Alignment.center,
                                  isExpanded: true, // Makes the dropdown take full width
                                  value: controller.selectedDay.value.isEmpty ? null : controller.selectedDay.value,
                                  onChanged: (value) {
                                    controller.selectedDay.value = value!;
                                  },
                                  items: days.map((day) {
                                    return DropdownMenuItem(
                                      value: day,
                                      child: Center(child: Text(day)),
                                    );
                                  }).toList(),
                                ),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).month),
                              Obx(() => SizedBox(
                                width: double.infinity,
                                child: DropdownButton<String>(
                                  alignment: Alignment.center,
                                  isExpanded: true, // Makes the dropdown take full width
                                  value: controller.selectedMonth.value.isEmpty ? null : controller.selectedMonth.value,
                                  onChanged: (value) {
                                    controller.selectedMonth.value = value!;
                                  },
                                  items: months.map((month) {
                                    return DropdownMenuItem(
                                      value: month,
                                      child: Center(child: Text(month)),
                                    );
                                  }).toList(),
                                ),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).year),
                              Obx(() => SizedBox(
                                width: double.infinity,
                                child: DropdownButton<String>(
                                  alignment: Alignment.center,
                                  isExpanded: true, // Makes the dropdown take full width
                                  value: controller.selectedYear.value.isEmpty ? null : controller.selectedYear.value,
                                  onChanged: (value) {
                                    controller.selectedYear.value = value!;
                                  },
                                  items: years.map((year) {
                                    return DropdownMenuItem(
                                      value: year,
                                      child: Center(child: Text(year)),
                                    );
                                  }).toList(),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateDateBirth(),
                child: Text(S.of(context).save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
