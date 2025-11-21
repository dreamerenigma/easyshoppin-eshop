import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/notification_controller.dart';

class NotificationPersonalAccountToggle extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  NotificationPersonalAccountToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
              () => Transform.scale(
            scale: 0.8,
            child: Switch(
              value: controller.isSwitchedPersonalAccount.value,
              onChanged: controller.handleSwitchPersonalAccount,
              activeThumbColor: Colors.blueAccent.withAlpha((0.5 * 255).toInt()),
              activeTrackColor: Colors.blue,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }
}
