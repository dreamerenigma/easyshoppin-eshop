import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/notification_controller.dart';

class NotificationToggle extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  NotificationToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Transform.scale(
            scale: 0.8,
            child: Switch(
              value: controller.isSwitched.value,
              onChanged: controller.handleSwitchChange,
              activeColor: Colors.blueAccent,
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
