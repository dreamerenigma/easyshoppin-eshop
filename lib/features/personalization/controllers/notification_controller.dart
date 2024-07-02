import 'dart:convert';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  var smsSubscribed = false.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final logger = Logger();
  var isSwitched = false.obs;F
  final storage = GetStorage();

  @override
  void onInit() {
    initializeSmsSubscription();
    loadSwitchState();
    super.onInit();
  }

  Future<void> initializeSmsSubscription() async {
    smsSubscribed.value = userController.user.value.smsSubscribed;
  }

  Future<void> loadSwitchState() async {
    var storage = GetStorage();
    bool? savedState = storage.read('isSwitched');
    isSwitched.value = savedState ?? false;
  }

  Future<void> updateSmsSubscription() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Updating SMS Subscription...', TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> updatedData = {'SmsSubscribed': smsSubscribed.value};
      await userRepository.updateSingleField(updatedData);

      userController.user.value.smsSubscribed = smsSubscribed.value;

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackbar(title: 'Success', message: 'SMS subscription updated.');

      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> updateFirestoreSubscription(bool subscribe) async {
    const userId = "wTM5ZR6PlZYF5GGByxXerMlrc9v2";
    const url = "https://firestore.googleapis.com/v1/projects/easyshoppin-ecd7f/databases/(default)/documents/users/$userId";
    final response = await http.patch(
      Uri.parse(url),
      body: json.encode({'smsSubscribed': subscribe}),
    );
    if (response.statusCode == 200) {
      logger.d('Firestore updated successfully');
    } else {
      logger.d('Failed to update Firestore');
    }
  }

  Future<void> handleSwitchChange(bool value) async {
    isSwitched.value = value;

    if (value) {
      await FirebaseMessaging.instance.subscribeToTopic('promotions');
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic('promotions');
    }

    storage.write('isSwitched', value);
  }

  Future<void> sendPromotionNotification(String message) async {
    final url = Uri.parse('http://localhost:3000/sendPromoFcm');
    final headers = {
      'Content-Type': 'application/json',
    };
    final payload = {
      'message': message,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        logger.d('Notification sent successfully');
      } else {
        logger.e('Failed to send notification');
      }
    } catch (e) {
      logger.e('Error sending notification: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsersFromFirestore() async {
    final url = Uri.parse('https://firestore.googleapis.com/v1/projects/easyshoppin-ecd7f/databases/(default)/documents/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> users = [];

      final data = json.decode(response.body);
      if (data['documents'] != null) {
        for (var document in data['documents']) {
          final userData = document['fields'];
          final userId = document['name'].split('/').last;
          userData['userId'] = userId;
          users.add(userData);
        }
      }

      return users;
    } else {
      throw Exception('Failed to load users from Firestore');
    }
  }

  Future<void> updateFirestoreSubscriptionForAll(bool subscribe) async {
    final allUsers = await getAllUsersFromFirestore();

    await Future.wait(
      allUsers.map((user) async {
        final userId = user['userId'];
        final url = "https://firestore.googleapis.com/v1/projects/easyshoppin-ecd7f/databases/(default)/documents/users/$userId";

        final response = await http.patch(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({'fields': {'smsSubscribed': {'booleanValue': subscribe}}}),
        );

        if (response.statusCode == 200) {
          logger.d('Firestore updated successfully for user $userId');
        } else {
          logger.d('Failed to update Firestore for user $userId: ${response.reasonPhrase}');
        }
      }),
    );

    logger.d('Firestore subscription update complete');
  }
}
