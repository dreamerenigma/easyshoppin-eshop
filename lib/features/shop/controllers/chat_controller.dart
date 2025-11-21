import 'package:get/get.dart';

class ChatController extends GetxController {
  var hasNewMessages = false.obs;

  void checkForNewMessages() {
    hasNewMessages.value = true;
  }
}
