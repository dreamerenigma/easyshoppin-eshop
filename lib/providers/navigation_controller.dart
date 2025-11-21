import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easyshoppin_eshop/features/utils/screens/internet_aware_screen.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/sign_in_profile.dart';
import '../data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/home_screen.dart';
import 'package:easyshoppin_eshop/features/shop/screens/store/store.dart';
import 'package:easyshoppin_eshop/features/shop/screens/stock/stock.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/cart_screen.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/profile_screen.dart';

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

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      isConnected.value = !result.contains(ConnectivityResult.none);
    });

    _checkInitialConnectivity();
    _checkAuthentication();

    ever(Get.find<AuthenticationRepository>().isAuthenticated, (bool authenticated) {
      isAuthenticated.value = authenticated;
    });
  }

  Future<void> _checkInitialConnectivity() async {
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = !connectivityResult.contains(ConnectivityResult.none);
  }

  Future<void> _checkAuthentication() async {
    isAuthenticated.value = Get.find<AuthenticationRepository>().isAuthenticated.value;
  }

  Widget getScreen(int index) {
    Widget screen;
    if (index == 4) {
      screen = isAuthenticated.value ? screens[index] : const SignInProfile();
    } else {
      screen = screens[index];
    }

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

