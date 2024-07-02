import 'package:easyshoppin_eshop/features/authentication/screens/login/login.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/signup/signup.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/signup/verify_email.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/address.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/cart.dart';
import 'package:easyshoppin_eshop/features/shop/screens/checkout/checkout.dart';
import 'package:easyshoppin_eshop/features/shop/screens/order/order.dart';
import 'package:easyshoppin_eshop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:easyshoppin_eshop/features/shop/screens/store/store.dart';
import 'package:easyshoppin_eshop/features/shop/screens/wishlist/wishlist.dart';
import 'package:easyshoppin_eshop/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/personalization/screens/feedback/widgets/screen/feedback_screen.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/home/home.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileSettingScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: TRoutes.feedback, page: () => const FeedbackScreen()),
  ];
}
