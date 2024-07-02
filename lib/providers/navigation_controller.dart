import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easyshoppin_eshop/features/utils/screens/internet_aware_screen.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/sign_in_profile.dart';
import '../data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/home.dart';
import 'package:easyshoppin_eshop/features/shop/screens/store/store.dart';
import 'package:easyshoppin_eshop/features/shop/screens/stock/stock.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/cart.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/settings.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final cartItemCount = 2.obs;
  var isConnected = true.obs;
  var isAuthenticated = false.obs;

  List<Widget> screens = [
    const HomeScreen(),
    const StoreScreen(),
    const StockScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
    });

    _checkInitialConnectivity();
    _checkAuthentication();

    // Listen to authentication changes
    ever(Get.find<AuthenticationRepository>().isAuthenticated, (bool authenticated) {
      isAuthenticated.value = authenticated;
    });
  }

  Future<void> _checkInitialConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = connectivityResult != ConnectivityResult.none;
  }

  Future<void> _checkAuthentication() async {
    isAuthenticated.value = Get.find<AuthenticationRepository>().isAuthenticated.value;
  }

  Widget getScreen(int index) {
    Widget screen;
    if (index == 4) {
      // Check if it's the Profile screen
      screen = isAuthenticated.value ? screens[index] : const SignInProfile();
    } else {
      screen = screens[index];
    }

    // Wrap all screens in InternetAwareScreen
    return InternetAwareScreen(
      connectedScreen: screen,
      title: _getScreenTitle(index),
    );
  }

  String _getScreenTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Store';
      case 2:
        return 'Stock';
      case 3:
        return 'Cart';
      case 4:
        return 'Profile';
      default:
        return '';
    }
  }
}

