import 'dart:io';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/login/login_screen.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/select_country/select_country.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/signup/verify_email.dart';
import 'package:easyshoppin_eshop/navigation_menu.dart';
import 'package:easyshoppin_eshop/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../features/personalization/controllers/user_controller.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../features/shop/controllers/product/cart_controller.dart';
import '../../../features/shop/controllers/product/variation_controller.dart';
import '../../../features/shop/screens/home/home_screen.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  var isAuthenticated = false.obs;

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  String? _verificationId;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      isAuthenticated.value = user != null;
    });
    isAuthenticated.value = authUser != null;

    if (!Get.isRegistered<VariationController>()) {
      Get.put(VariationController());
    }

    if (!Get.isRegistered<CartController>()) {
      Get.put(CartController());
    }
  }

  void someFunction() {
    if (isAuthenticated.value) {
      // User is authenticated
    } else {
      // User is not authenticated
    }
  }

  /// Called from main.dart on app launch
  @override
  void onReady() {
    super.onReady();
    // Initial check
    isAuthenticated.value = authUser != null;
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to determine the relevant screen and redirect accordingly.
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // Initialize User Specific Storage
        await LocalStorage.init(user.uid);
        // If the user's email is verified, navigate to the main Navigation Menu
        if (Platform.isWindows) {
          Get.offAll(() => const HomeScreen());
        } else {
          Get.offAll(() => const NavigationMenu());
        }
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      if (deviceStorage.read('IsFirstTime') != true) {
          Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => const SelectCountryScreen());
      }
    }
  }

  // Email & Password sign-in
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      isAuthenticated.value = true;
      handleNavigation();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  void handleNavigation() {
    if (Platform.isWindows) {
      Get.offAll(() => const HomeScreen());
    } else {
      if (isAuthenticated.value) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      isAuthenticated.value = true;
      handleNavigation();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      final GoogleSignInAccount account = await googleSignIn.authenticate();
      final GoogleSignInAuthentication auth = account.authentication;
      final credential = GoogleAuthProvider.credential(idToken: auth.idToken);

      isAuthenticated.value = true;
      handleNavigation();

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw _handleFirebaseException(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  String _handleFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-phone-number':
        return 'The provided phone number is not valid.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'Failed to verify phone number: ${e.message}';
    }
  }

  Future<void> logout() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      final userController = UserController.instance;
      userController.user.value = UserModel.empty();
      userController.user.refresh();

      Get.offAll(() => const NavigationMenu());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord((_auth.currentUser!.uid));
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
