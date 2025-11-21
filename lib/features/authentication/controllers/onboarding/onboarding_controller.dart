import 'package:audioplayers/audioplayers.dart';
import 'package:easyshoppin_eshop/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  /// Update Current Index when Page Scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
    playSwipeSound();
  }

  /// Method to play swipe sound
  void playSwipeSound() async {
    await audioPlayer.play(AssetSource('sounds/swipe_sound.mp3'));
  }

  /// Method to play button click sound
  void playButtonClickSound() async {
    await audioPlayer.play(AssetSource('sounds/click_button.mp3'));
  }

  /// Jump to the specific dot selected page.
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2){
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const NavigationMenu());
    } else {
      int page = currentPageIndex.value + 1;
      currentPageIndex.value = page;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
