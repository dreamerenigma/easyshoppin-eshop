import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('ru'),
  ];

  /// No description provided for @createIn.
  ///
  /// In en, this message translates to:
  /// **'Create in'**
  String get createIn;

  /// No description provided for @onBoardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Choose your product'**
  String get onBoardingTitle1;

  /// No description provided for @onBoardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get onBoardingTitle2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Deliver at your door step'**
  String get onBoardingTitle3;

  /// No description provided for @onBoardingSubTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!'**
  String get onBoardingSubTitle1;

  /// No description provided for @onBoardingSubTitle2.
  ///
  /// In en, this message translates to:
  /// **'For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!'**
  String get onBoardingSubTitle2;

  /// No description provided for @onBoardingSubTitle3.
  ///
  /// In en, this message translates to:
  /// **'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!'**
  String get onBoardingSubTitle3;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// No description provided for @loginSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Limitless Choices and Unmatched Convenience.'**
  String get loginSubTitle;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Let’s create your account'**
  String get signupTitle;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgetPasswordTitle;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'or sign in with'**
  String get orSignInWith;

  /// No description provided for @orSignUpWith.
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get orSignUpWith;

  /// No description provided for @orSignInPhone.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get orSignInPhone;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @iAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I agree to'**
  String get iAgreeTo;

  /// No description provided for @privacyPolicyRegister.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyRegister;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @phoneNumberNotValid.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is not valid.'**
  String get phoneNumberNotValid;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// No description provided for @loginRegister.
  ///
  /// In en, this message translates to:
  /// **'To login or register'**
  String get loginRegister;

  /// No description provided for @phoneNumberDigital.
  ///
  /// In en, this message translates to:
  /// **'000 000-00-00'**
  String get phoneNumberDigital;

  /// No description provided for @phoneNumberCode.
  ///
  /// In en, this message translates to:
  /// **'To get the code'**
  String get phoneNumberCode;

  /// No description provided for @iAgreeButton.
  ///
  /// In en, this message translates to:
  /// **'Click on the button, I agree to the '**
  String get iAgreeButton;

  /// No description provided for @termsUsePlatform.
  ///
  /// In en, this message translates to:
  /// **'terms of use of the trading platform'**
  String get termsUsePlatform;

  /// No description provided for @selectCodeRegion.
  ///
  /// In en, this message translates to:
  /// **'Select code region'**
  String get selectCodeRegion;

  /// No description provided for @signInProfile.
  ///
  /// In en, this message translates to:
  /// **'Login to your profile'**
  String get signInProfile;

  /// No description provided for @personalDiscounts.
  ///
  /// In en, this message translates to:
  /// **'After logging in, you will have access to products with personal discounts'**
  String get personalDiscounts;

  /// No description provided for @buttonSignInProfile.
  ///
  /// In en, this message translates to:
  /// **'Login to profile'**
  String get buttonSignInProfile;

  /// No description provided for @informationClient.
  ///
  /// In en, this message translates to:
  /// **'Information for clients'**
  String get informationClient;

  /// No description provided for @forgetPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.'**
  String get forgetPasswordSubTitle;

  /// No description provided for @changeYourPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Email Sent'**
  String get changeYourPasswordTitle;

  /// No description provided for @changeYourPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.'**
  String get changeYourPasswordSubTitle;

  /// No description provided for @confirmEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify your email address!'**
  String get confirmEmail;

  /// No description provided for @confirmEmailSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.'**
  String get confirmEmailSubTitle;

  /// No description provided for @emailNotReceivedMessage.
  ///
  /// In en, this message translates to:
  /// **'Didn’t get the email? Check your junk/spam or resend it.'**
  String get emailNotReceivedMessage;

  /// No description provided for @yourAccountCreatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your account successfully created!'**
  String get yourAccountCreatedTitle;

  /// No description provided for @yourAccountCreatedSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!'**
  String get yourAccountCreatedSubTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @store.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get store;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @selectAddress.
  ///
  /// In en, this message translates to:
  /// **'Select address'**
  String get selectAddress;

  /// No description provided for @selectDelivery.
  ///
  /// In en, this message translates to:
  /// **'Selecting a delivery method'**
  String get selectDelivery;

  /// No description provided for @courierDelivery.
  ///
  /// In en, this message translates to:
  /// **'To perform this action, you must log in to your account or register.'**
  String get courierDelivery;

  /// No description provided for @loginAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to account'**
  String get loginAccount;

  /// No description provided for @buttonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get buttonSave;

  /// No description provided for @pickUpPoint.
  ///
  /// In en, this message translates to:
  /// **'Pick-up point'**
  String get pickUpPoint;

  /// No description provided for @courier.
  ///
  /// In en, this message translates to:
  /// **'Courier'**
  String get courier;

  /// No description provided for @yourPickUpPoint.
  ///
  /// In en, this message translates to:
  /// **'Your pick-up points will be here'**
  String get yourPickUpPoint;

  /// No description provided for @addPickUpPointDelivery.
  ///
  /// In en, this message translates to:
  /// **'Add a pick-up point to see current product prices and delivery times'**
  String get addPickUpPointDelivery;

  /// No description provided for @addPickUpPoint.
  ///
  /// In en, this message translates to:
  /// **'Add a pick-up point'**
  String get addPickUpPoint;

  /// No description provided for @addDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Add delivery address'**
  String get addDeliveryAddress;

  /// No description provided for @yourAddresses.
  ///
  /// In en, this message translates to:
  /// **'Your addresses will be here'**
  String get yourAddresses;

  /// No description provided for @yourDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Add your delivery address to see current product prices and delivery times'**
  String get yourDeliveryAddress;

  /// No description provided for @homeAppbarTitle.
  ///
  /// In en, this message translates to:
  /// **'Have a nice day shopping 🛍️'**
  String get homeAppbarTitle;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search in Store'**
  String get search;

  /// No description provided for @bestsellers.
  ///
  /// In en, this message translates to:
  /// **'Bestsellers'**
  String get bestsellers;

  /// No description provided for @popularCategory.
  ///
  /// In en, this message translates to:
  /// **'Popular Categories'**
  String get popularCategory;

  /// No description provided for @popularProducts.
  ///
  /// In en, this message translates to:
  /// **'Popular products'**
  String get popularProducts;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @notificationWarning.
  ///
  /// In en, this message translates to:
  /// **'Easy Shoppin employees never ask for account details'**
  String get notificationWarning;

  /// No description provided for @notificationScammers.
  ///
  /// In en, this message translates to:
  /// **'Do not tell anyone your phone number or login codes - only scammers are interested in them'**
  String get notificationScammers;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile settings'**
  String get profileSettings;

  /// No description provided for @basicSettings.
  ///
  /// In en, this message translates to:
  /// **'Basic settings'**
  String get basicSettings;

  /// No description provided for @addresses.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addresses;

  /// No description provided for @subtitleAddresses.
  ///
  /// In en, this message translates to:
  /// **'Set shopping delivery address'**
  String get subtitleAddresses;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add new Address'**
  String get addNewAddress;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

  /// No description provided for @subtitleFavourite.
  ///
  /// In en, this message translates to:
  /// **'Add or remove products to your favorites and proceed to checkout'**
  String get subtitleFavourite;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @subtitleOrders.
  ///
  /// In en, this message translates to:
  /// **'In-progress and Completed Orders'**
  String get subtitleOrders;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @subtitlePaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Withdraw balance to registered bank account'**
  String get subtitlePaymentMethods;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @subtitlePoints.
  ///
  /// In en, this message translates to:
  /// **'Your user points and cashback'**
  String get subtitlePoints;

  /// No description provided for @coupons.
  ///
  /// In en, this message translates to:
  /// **'Coupons'**
  String get coupons;

  /// No description provided for @subtitleCoupons.
  ///
  /// In en, this message translates to:
  /// **'List of all the discounted coupons'**
  String get subtitleCoupons;

  /// No description provided for @titleCoupons.
  ///
  /// In en, this message translates to:
  /// **'Coupons'**
  String get titleCoupons;

  /// No description provided for @subtitleCouponsOrder.
  ///
  /// In en, this message translates to:
  /// **'Discounts are applied automatically when placing an order.'**
  String get subtitleCouponsOrder;

  /// No description provided for @activeCoupons.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeCoupons;

  /// No description provided for @overdueCoupons.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdueCoupons;

  /// No description provided for @noCoupons.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any coupons yet'**
  String get noCoupons;

  /// No description provided for @toProducts.
  ///
  /// In en, this message translates to:
  /// **'To products'**
  String get toProducts;

  /// No description provided for @productReviews.
  ///
  /// In en, this message translates to:
  /// **'Product Reviews'**
  String get productReviews;

  /// No description provided for @subtitleProductReviews.
  ///
  /// In en, this message translates to:
  /// **'All product reviews'**
  String get subtitleProductReviews;

  /// No description provided for @favouriteStores.
  ///
  /// In en, this message translates to:
  /// **'Favourite stores'**
  String get favouriteStores;

  /// No description provided for @subtitleFavouriteStores.
  ///
  /// In en, this message translates to:
  /// **'Add your favorite stores'**
  String get subtitleFavouriteStores;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @subtitleChats.
  ///
  /// In en, this message translates to:
  /// **'Chats with product sellers'**
  String get subtitleChats;

  /// No description provided for @readAll.
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get readAll;

  /// No description provided for @allChatsRead.
  ///
  /// In en, this message translates to:
  /// **'All chats read'**
  String get allChatsRead;

  /// No description provided for @controversy.
  ///
  /// In en, this message translates to:
  /// **'Controversy'**
  String get controversy;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @chatNotificationEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications are enabled for all chats!'**
  String get chatNotificationEnabled;

  /// No description provided for @chatNotificationDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications are disabled for all chats!'**
  String get chatNotificationDisabled;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @loadData.
  ///
  /// In en, this message translates to:
  /// **'Load Data'**
  String get loadData;

  /// No description provided for @subtitleLoadData.
  ///
  /// In en, this message translates to:
  /// **'Upload Data to your Cloud Firebase'**
  String get subtitleLoadData;

  /// No description provided for @personalData.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personalData;

  /// No description provided for @subtitlePersonalData.
  ///
  /// In en, this message translates to:
  /// **'User profile data'**
  String get subtitlePersonalData;

  /// No description provided for @geolocation.
  ///
  /// In en, this message translates to:
  /// **'Geolocation'**
  String get geolocation;

  /// No description provided for @subtitleGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Set recommendation based on location'**
  String get subtitleGeolocation;

  /// No description provided for @safeMode.
  ///
  /// In en, this message translates to:
  /// **'Safe Mode'**
  String get safeMode;

  /// No description provided for @subtitleSafeMode.
  ///
  /// In en, this message translates to:
  /// **'Search result is safe for all ages'**
  String get subtitleSafeMode;

  /// No description provided for @imageQuality.
  ///
  /// In en, this message translates to:
  /// **'HD Image Quality'**
  String get imageQuality;

  /// No description provided for @subtitleImageQuality.
  ///
  /// In en, this message translates to:
  /// **'Set image quality to be seen'**
  String get subtitleImageQuality;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @subtitleNotifications.
  ///
  /// In en, this message translates to:
  /// **'Set any kind of notification message'**
  String get subtitleNotifications;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @subtitleThemes.
  ///
  /// In en, this message translates to:
  /// **'Change the theme of the application to your liking'**
  String get subtitleThemes;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @subtitleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select application language'**
  String get subtitleLanguage;

  /// No description provided for @currencyPrices.
  ///
  /// In en, this message translates to:
  /// **'In what currency are the prices'**
  String get currencyPrices;

  /// No description provided for @russianRuble.
  ///
  /// In en, this message translates to:
  /// **'Russian ruble'**
  String get russianRuble;

  /// No description provided for @belarusianRuble.
  ///
  /// In en, this message translates to:
  /// **'Belarusian ruble'**
  String get belarusianRuble;

  /// No description provided for @armenianDram.
  ///
  /// In en, this message translates to:
  /// **'Armenian dram'**
  String get armenianDram;

  /// No description provided for @kazakhTenge.
  ///
  /// In en, this message translates to:
  /// **'Kazakh tenge'**
  String get kazakhTenge;

  /// No description provided for @kyrgyzSom.
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstani som'**
  String get kyrgyzSom;

  /// No description provided for @uzbekSum.
  ///
  /// In en, this message translates to:
  /// **'Uzbek sum'**
  String get uzbekSum;

  /// No description provided for @yourDevices.
  ///
  /// In en, this message translates to:
  /// **'Your devices'**
  String get yourDevices;

  /// No description provided for @subtitleYourDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices on which you are logged into your profile Easy Shoppin'**
  String get subtitleYourDevices;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @subtitleSupport.
  ///
  /// In en, this message translates to:
  /// **'Ask questions about the application to the support team'**
  String get subtitleSupport;

  /// No description provided for @becomeSeller.
  ///
  /// In en, this message translates to:
  /// **'Become a seller on Easy Shoppin'**
  String get becomeSeller;

  /// No description provided for @subtitleBecomeSeller.
  ///
  /// In en, this message translates to:
  /// **'You can become a seller on Easy Shoppin'**
  String get subtitleBecomeSeller;

  /// No description provided for @accountPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Account Privacy'**
  String get accountPrivacy;

  /// No description provided for @subtitleAccountPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Manage data usage and connected accounts'**
  String get subtitleAccountPrivacy;

  /// No description provided for @rulesUsingTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **'Rules for using the trading platform'**
  String get rulesUsingTradingPlatform;

  /// No description provided for @subtitleRulesUsingTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **'Marketplace usage data and data usage management'**
  String get subtitleRulesUsingTradingPlatform;

  /// No description provided for @aboutApplication.
  ///
  /// In en, this message translates to:
  /// **'About Application'**
  String get aboutApplication;

  /// No description provided for @subtitleAboutApplication.
  ///
  /// In en, this message translates to:
  /// **'Application version information and other information'**
  String get subtitleAboutApplication;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Easy Shoppin'**
  String get appName;

  /// No description provided for @versionApplication.
  ///
  /// In en, this message translates to:
  /// **'Version application:'**
  String get versionApplication;

  /// No description provided for @modelDevice.
  ///
  /// In en, this message translates to:
  /// **'Model device:'**
  String get modelDevice;

  /// No description provided for @osVersion.
  ///
  /// In en, this message translates to:
  /// **'OS version:'**
  String get osVersion;

  /// No description provided for @localCountry.
  ///
  /// In en, this message translates to:
  /// **'Locale country:'**
  String get localCountry;

  /// No description provided for @noCountrySelected.
  ///
  /// In en, this message translates to:
  /// **'No country selected'**
  String get noCountrySelected;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Share failed!'**
  String get shareFailed;

  /// No description provided for @moreAboutApplication.
  ///
  /// In en, this message translates to:
  /// **'More about the application'**
  String get moreAboutApplication;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @subtitleMoreAboutApplication.
  ///
  /// In en, this message translates to:
  /// **'Detailed information about the application'**
  String get subtitleMoreAboutApplication;

  /// No description provided for @rateThisApp.
  ///
  /// In en, this message translates to:
  /// **'Rate this app'**
  String get rateThisApp;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @feedbackWhatWouldLike.
  ///
  /// In en, this message translates to:
  /// **'What would you like to do?'**
  String get feedbackWhatWouldLike;

  /// No description provided for @feedbackRepostProblem.
  ///
  /// In en, this message translates to:
  /// **'Report a problem'**
  String get feedbackRepostProblem;

  /// No description provided for @feedbackSuggestFeature.
  ///
  /// In en, this message translates to:
  /// **'Suggest a new feature'**
  String get feedbackSuggestFeature;

  /// No description provided for @feedbackProblemOrder.
  ///
  /// In en, this message translates to:
  /// **'Report a problem with your order'**
  String get feedbackProblemOrder;

  /// No description provided for @yourSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Your suggestion'**
  String get yourSuggestion;

  /// No description provided for @describeProposal.
  ///
  /// In en, this message translates to:
  /// **'Describe your proposal. We will not be able to answer you personally, but we will certainly take into account your wishes.'**
  String get describeProposal;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Your email address'**
  String get enterEmailAddress;

  /// No description provided for @notAllFields.
  ///
  /// In en, this message translates to:
  /// **'Not all fields are filled!'**
  String get notAllFields;

  /// No description provided for @sendFeedbackMessage.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sendFeedbackMessage;

  /// No description provided for @feedbackApplication.
  ///
  /// In en, this message translates to:
  /// **'This page is intended for feedback and suggestions on the application. If you want to open a dispute, please go to my orders.'**
  String get feedbackApplication;

  /// No description provided for @chooseAction.
  ///
  /// In en, this message translates to:
  /// **'Choose an action'**
  String get chooseAction;

  /// No description provided for @makePhoto.
  ///
  /// In en, this message translates to:
  /// **'To make a photo'**
  String get makePhoto;

  /// No description provided for @selectAvailable.
  ///
  /// In en, this message translates to:
  /// **'Select available'**
  String get selectAvailable;

  /// No description provided for @feedbackCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get feedbackCancelButton;

  /// No description provided for @selectImages.
  ///
  /// In en, this message translates to:
  /// **'Select images'**
  String get selectImages;

  /// No description provided for @noImagesFound.
  ///
  /// In en, this message translates to:
  /// **'No images found.'**
  String get noImagesFound;

  /// No description provided for @feedbackSent.
  ///
  /// In en, this message translates to:
  /// **'Feedback sent successfully!'**
  String get feedbackSent;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @legalInformation.
  ///
  /// In en, this message translates to:
  /// **'Legal information'**
  String get legalInformation;

  /// No description provided for @recommendationTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Recommendation technologies'**
  String get recommendationTechnologies;

  /// No description provided for @rulesRecommendationTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Rules for using recommendation technologies on Easy Shoppin'**
  String get rulesRecommendationTechnologies;

  /// No description provided for @informationResourceUses.
  ///
  /// In en, this message translates to:
  /// **'The information resource uses recommendation technologies'**
  String get informationResourceUses;

  /// No description provided for @informationResourceUsesRT.
  ///
  /// In en, this message translates to:
  /// **'On the information resource, when using information technologies for providing information, the collection, systematization and analysis of information related to the preferences of Internet users located on the territory of the Russian Federation is carried out.'**
  String get informationResourceUsesRT;

  /// No description provided for @providingInformationRT.
  ///
  /// In en, this message translates to:
  /// **'Recommendation technologies are information technologies for providing information based on the collection, systematization and analysis of information related to the preferences of Internet users (hereinafter referred to as “recommendations”).'**
  String get providingInformationRT;

  /// No description provided for @questionsAboutRecommendations.
  ///
  /// In en, this message translates to:
  /// **'In these Rules, we will answer basic questions about what recommendations are, the recommendation system (hereinafter referred to as the “system”) and how they work on AliExpress.'**
  String get questionsAboutRecommendations;

  /// No description provided for @whatRecommendationSystem.
  ///
  /// In en, this message translates to:
  /// **'What is a recommendation system?'**
  String get whatRecommendationSystem;

  /// No description provided for @modernToolRS.
  ///
  /// In en, this message translates to:
  /// **'The Easy Shoppin recommendation system is a modern tool that helps users easily find products that interest them. The system is responsible for finding candidate products that are relevant for each specific context on a site or application, as well as the logic for sorting and displaying these products.'**
  String get modernToolRS;

  /// No description provided for @productsGeneratedRS.
  ///
  /// In en, this message translates to:
  /// **'The recommendations themselves on Easy Shoppin are a selection of products generated by the recommendation system; they can be located in various places on the website and in the AliExpress application.'**
  String get productsGeneratedRS;

  /// No description provided for @whatRecommendations.
  ///
  /// In en, this message translates to:
  /// **'What are the recommendations?'**
  String get whatRecommendations;

  /// No description provided for @personalProductRecommendations.
  ///
  /// In en, this message translates to:
  /// **'There are two types of recommendations on Easy Shoppin: personal and product. Personalized recommendations analyze the user\'s purchase history and recently viewed products. Such recommendations can be seen on the AliExpress home page, in the user profile or, for example, on the pages of active orders or order details.'**
  String get personalProductRecommendations;

  /// No description provided for @productRecommendationsHelp.
  ///
  /// In en, this message translates to:
  /// **'Product recommendations help the user find offers similar to the one selected. This is done so that the user can find alternatives and compare options. An example of such recommendations can be found on the product card or in a non-empty cart.'**
  String get productRecommendationsHelp;

  /// No description provided for @whatStagesRecommendations.
  ///
  /// In en, this message translates to:
  /// **'What stages does the system go through before making recommendations to the user?'**
  String get whatStagesRecommendations;

  /// No description provided for @selectionProductsThrough.
  ///
  /// In en, this message translates to:
  /// **'Before the user sees a selection of products, the system goes through the following stages: searching for candidate products → ranking products → building the logic for displaying products.'**
  String get selectionProductsThrough;

  /// No description provided for @searchCandidateProducts.
  ///
  /// In en, this message translates to:
  /// **'Stage 1. Search for candidate products'**
  String get searchCandidateProducts;

  /// No description provided for @systemSelectsProductsRelevant.
  ///
  /// In en, this message translates to:
  /// **'At this stage, the system selects M products relevant to the context from a large number of products N. If the context is a product card, then candidate products are selected based on the product on this card, in the cart - based on the list of products in the cart. Thus, for product recommendations, products from the same categories or similar ones as the main product are selected. At the same time, we believe that the more often products from any categories fall into one purchase, the more these categories suit each other.'**
  String get systemSelectsProductsRelevant;

  /// No description provided for @personalizedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'To make personalized recommendations, we take into account information about any user interaction with products (for example, clicks, purchases or views) and select products based on these interactions.'**
  String get personalizedRecommendations;

  /// No description provided for @likelihoodBecomingProduct.
  ///
  /// In en, this message translates to:
  /// **'The likelihood of becoming a product candidate is higher if more similar users clicked on a product.'**
  String get likelihoodBecomingProduct;

  /// No description provided for @productRanking.
  ///
  /// In en, this message translates to:
  /// **'Stage 2. Product ranking'**
  String get productRanking;

  /// No description provided for @relevantProductsRanks.
  ///
  /// In en, this message translates to:
  /// **'At this stage, the system selects the most relevant products and ranks them according to the likelihood of purchase by the user. Machine learning models are used for this. As a result, each product is given a score from 0 to 1. The higher the score, the higher the position the product occupies in the recommendations.'**
  String get relevantProductsRanks;

  /// No description provided for @variousProductProperties.
  ///
  /// In en, this message translates to:
  /// **'The model is based on various product properties, such as views, clicks, orders, ratings, price and much more. Using the gradient boosting method of decision trees, the model predicts the probability of purchase for each product. Different properties may have different weights for the model, for example, price may be more important than the number of views.'**
  String get variousProductProperties;

  /// No description provided for @likelihoodPurchasingProduct.
  ///
  /// In en, this message translates to:
  /// **'The likelihood of purchasing a product will differ for different contexts; the same product may have a high rating on the main page of the site and a lower rating on the order history page.'**
  String get likelihoodPurchasingProduct;

  /// No description provided for @modelAnalyzesUser.
  ///
  /// In en, this message translates to:
  /// **'The model analyzes user behavior in the past, understands what products were of interest to him or users with similar preferences, and predicts what a person will be willing to buy. Recommendations are most strongly influenced by products that the user has purchased on AliExpress before.'**
  String get modelAnalyzesUser;

  /// No description provided for @logicDisplayingSelection.
  ///
  /// In en, this message translates to:
  /// **'Stage 3. Logic for displaying a selection of recommendations'**
  String get logicDisplayingSelection;

  /// No description provided for @businessLogicDisplaying.
  ///
  /// In en, this message translates to:
  /// **'At this stage, the business logic for displaying a selection and filtering products is applied.'**
  String get businessLogicDisplaying;

  /// No description provided for @receivedFinalRatings.
  ///
  /// In en, this message translates to:
  /// **'When the system has received all the final ratings, a selection is formed in which products with a higher rating are shown higher in the search results, and products with a lower rating are shown closer to the end. When a selection of products is formed, the main characteristics of each product are loaded (price, discounts, cashback, delivery, etc.) and images.'**
  String get receivedFinalRatings;

  /// No description provided for @selectionRecommendations.
  ///
  /// In en, this message translates to:
  /// **'A selection of recommendations may show a different number of products depending on their location on the AliExpress website or app. Depending on the type and location of the recommendations, they can be positioned horizontally, with side swipes, or vertically, loading additional products as the user scrolls to the end of the recommendations. We hope our recommendation system will help you find the best products and make your AliExpress journey more fun and convenient!'**
  String get selectionRecommendations;

  /// No description provided for @copyRight.
  ///
  /// In en, this message translates to:
  /// **'© 2024-2025. Easy Shoppin'**
  String get copyRight;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out of your account'**
  String get logout;

  /// No description provided for @loggingAccount.
  ///
  /// In en, this message translates to:
  /// **'Logging out of your account'**
  String get loggingAccount;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your account?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @changeProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Change Profile Picture'**
  String get changeProfilePicture;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @titleChangeName.
  ///
  /// In en, this message translates to:
  /// **'Change Name'**
  String get titleChangeName;

  /// No description provided for @subtitleChangeName.
  ///
  /// In en, this message translates to:
  /// **'User real name for easy verification. This name will appear on several pages.'**
  String get subtitleChangeName;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterFirstName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enterLastName;

  /// No description provided for @titleChangeUsername.
  ///
  /// In en, this message translates to:
  /// **'Change Username'**
  String get titleChangeUsername;

  /// No description provided for @subtitleChangeUsername.
  ///
  /// In en, this message translates to:
  /// **'Username for easy verification. This username will appear on several pages.'**
  String get subtitleChangeUsername;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get enterUsername;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @titleChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get titleChangePassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @passwordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation'**
  String get passwordConfirm;

  /// No description provided for @subTitleChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password to identify. Only displayed on the profile page.'**
  String get subTitleChangePassword;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @userIdCopied.
  ///
  /// In en, this message translates to:
  /// **'User ID copied to clipboard'**
  String get userIdCopied;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @titleChangePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Phone Number'**
  String get titleChangePhoneNumber;

  /// No description provided for @subTitleChangePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change phone number to identify. Only displayed on the profile page.'**
  String get subTitleChangePhoneNumber;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @titleChangeGender.
  ///
  /// In en, this message translates to:
  /// **'Change Gender'**
  String get titleChangeGender;

  /// No description provided for @subTitleChangeGender.
  ///
  /// In en, this message translates to:
  /// **'Select gender to identify. Only displayed on the profile page.'**
  String get subTitleChangeGender;

  /// No description provided for @maleGender.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get maleGender;

  /// No description provided for @femaleGender.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get femaleGender;

  /// No description provided for @dateBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateBirth;

  /// No description provided for @titleChangeDateBirth.
  ///
  /// In en, this message translates to:
  /// **'Change Date of Birth'**
  String get titleChangeDateBirth;

  /// No description provided for @subTitleChangeDateBirth.
  ///
  /// In en, this message translates to:
  /// **'Change your date of birth.'**
  String get subTitleChangeDateBirth;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete your account permanently? This action is not reversible and all or your data will be removed permanently.'**
  String get deleteAccountMessage;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Whoops! Cart is Empty'**
  String get cartEmpty;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @wishlistEmpty.
  ///
  /// In en, this message translates to:
  /// **'Whoops! Wishlist is Empty...'**
  String get wishlistEmpty;

  /// No description provided for @letsAddSome.
  ///
  /// In en, this message translates to:
  /// **'Let\'s add some'**
  String get letsAddSome;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'My Order'**
  String get order;

  /// No description provided for @orderListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Whoops! Order List is Empty...'**
  String get orderListEmpty;

  /// No description provided for @letsFillIt.
  ///
  /// In en, this message translates to:
  /// **'Let\'s fill it'**
  String get letsFillIt;

  /// No description provided for @favoriteStoresListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Whoops! Your favorite stores list is empty.'**
  String get favoriteStoresListEmpty;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @linkCard.
  ///
  /// In en, this message translates to:
  /// **'Link a card'**
  String get linkCard;

  /// No description provided for @linkBankSBP.
  ///
  /// In en, this message translates to:
  /// **'Link the bank to SBP'**
  String get linkBankSBP;

  /// No description provided for @uploadData.
  ///
  /// In en, this message translates to:
  /// **'Upload Data'**
  String get uploadData;

  /// No description provided for @mainRecord.
  ///
  /// In en, this message translates to:
  /// **'Main Record'**
  String get mainRecord;

  /// No description provided for @uploadCategories.
  ///
  /// In en, this message translates to:
  /// **'Upload Categories'**
  String get uploadCategories;

  /// No description provided for @uploadBrands.
  ///
  /// In en, this message translates to:
  /// **'Upload Brands'**
  String get uploadBrands;

  /// No description provided for @uploadProducts.
  ///
  /// In en, this message translates to:
  /// **'Upload Products'**
  String get uploadProducts;

  /// No description provided for @uploadBanners.
  ///
  /// In en, this message translates to:
  /// **'Upload Banners'**
  String get uploadBanners;

  /// No description provided for @uploadSales.
  ///
  /// In en, this message translates to:
  /// **'Upload Sales'**
  String get uploadSales;

  /// No description provided for @loadCategoryData.
  ///
  /// In en, this message translates to:
  /// **'Load category data'**
  String get loadCategoryData;

  /// No description provided for @uploadCategoryDatabase.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to load category and subcategory data into the database? Do not close the window until the data is loading!'**
  String get uploadCategoryDatabase;

  /// No description provided for @loadBrandData.
  ///
  /// In en, this message translates to:
  /// **'Load brands data'**
  String get loadBrandData;

  /// No description provided for @uploadBrandDatabase.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to load brand data into the database? Do not close the window until the data is loading!'**
  String get uploadBrandDatabase;

  /// No description provided for @loadProductData.
  ///
  /// In en, this message translates to:
  /// **'Load products data'**
  String get loadProductData;

  /// No description provided for @uploadProductDatabase.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to load product data into the database? Do not close the window until the data is loading!'**
  String get uploadProductDatabase;

  /// No description provided for @loadBannerData.
  ///
  /// In en, this message translates to:
  /// **'Load banners data'**
  String get loadBannerData;

  /// No description provided for @uploadBannerDatabase.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to load banner data into the database? Do not close the window until the data is loading!'**
  String get uploadBannerDatabase;

  /// No description provided for @loadSaleData.
  ///
  /// In en, this message translates to:
  /// **'Load sale data'**
  String get loadSaleData;

  /// No description provided for @uploadSaleDatabase.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to load sale data into the database? Do not close the window until the data is loading!'**
  String get uploadSaleDatabase;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get relationships;

  /// No description provided for @subtitleRelationships.
  ///
  /// In en, this message translates to:
  /// **'Make sure you have already uploaded all the content above.'**
  String get subtitleRelationships;

  /// No description provided for @uploadBrandsCategories.
  ///
  /// In en, this message translates to:
  /// **'Upload Brands & Categories Relation Data'**
  String get uploadBrandsCategories;

  /// No description provided for @uploadProductsCategories.
  ///
  /// In en, this message translates to:
  /// **'Upload Product Categories Relation Data'**
  String get uploadProductsCategories;

  /// No description provided for @btnUploadBrandsCategories.
  ///
  /// In en, this message translates to:
  /// **'Upload Brand & Categories'**
  String get btnUploadBrandsCategories;

  /// No description provided for @btnUploadProductsCategories.
  ///
  /// In en, this message translates to:
  /// **'Upload Product Categories'**
  String get btnUploadProductsCategories;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @brandsCategoriesUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Brands and categories uploaded successfully'**
  String get brandsCategoriesUploadedSuccess;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @failedUploadBrandsCategories.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload brands and categories'**
  String get failedUploadBrandsCategories;

  /// No description provided for @productCategoriesUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Product categories uploaded successfully'**
  String get productCategoriesUploadedSuccess;

  /// No description provided for @failedUploadProductCategories.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload product categories'**
  String get failedUploadProductCategories;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No Data Found!'**
  String get noDataFound;

  /// No description provided for @wentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get wentWrong;

  /// No description provided for @loggingYouIn.
  ///
  /// In en, this message translates to:
  /// **'Logging you in...'**
  String get loggingYouIn;

  /// No description provided for @ohSnap.
  ///
  /// In en, this message translates to:
  /// **'Oh Snap!'**
  String get ohSnap;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @linkNewCard.
  ///
  /// In en, this message translates to:
  /// **'Link a new card'**
  String get linkNewCard;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @validity.
  ///
  /// In en, this message translates to:
  /// **'Validity'**
  String get validity;

  /// No description provided for @digitsCardBack.
  ///
  /// In en, this message translates to:
  /// **'3 digits on the back'**
  String get digitsCardBack;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @settingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Setting notifications'**
  String get settingNotificationTitle;

  /// No description provided for @notificationSubscribe.
  ///
  /// In en, this message translates to:
  /// **'You can subscribe to the following types of newsletters from our store to receive news about promotions and promotional codes'**
  String get notificationSubscribe;

  /// No description provided for @notificationSms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get notificationSms;

  /// No description provided for @smsMessages.
  ///
  /// In en, this message translates to:
  /// **'SMS-messages'**
  String get smsMessages;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @informationPromotions.
  ///
  /// In en, this message translates to:
  /// **'Information about promotions and offers'**
  String get informationPromotions;

  /// No description provided for @personalNotifications.
  ///
  /// In en, this message translates to:
  /// **'Personal account notifications'**
  String get personalNotifications;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select theme'**
  String get selectTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get selectCountry;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @russianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russianLanguage;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @spanishLanguage.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanishLanguage;

  /// No description provided for @russia.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get russia;

  /// No description provided for @belarus.
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get belarus;

  /// No description provided for @kazakhstan.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get kazakhstan;

  /// No description provided for @kyrgyzstan.
  ///
  /// In en, this message translates to:
  /// **'kyrgyzstan'**
  String get kyrgyzstan;

  /// No description provided for @armenia.
  ///
  /// In en, this message translates to:
  /// **'Armenia'**
  String get armenia;

  /// No description provided for @uzbekistan.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get uzbekistan;

  /// No description provided for @featureBrands.
  ///
  /// In en, this message translates to:
  /// **'Feature Brands'**
  String get featureBrands;

  /// No description provided for @noProductsStock.
  ///
  /// In en, this message translates to:
  /// **'No products with stock status available'**
  String get noProductsStock;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetConnection;

  /// No description provided for @checkInternetSettings.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet settings and try again.'**
  String get checkInternetSettings;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @generalProvisionsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'1. General provisions'**
  String get generalProvisionsPrivacy;

  /// No description provided for @termsPrivacy.
  ///
  /// In en, this message translates to:
  /// **' This Policy regarding the processing of personal data (hereinafter referred to as the Policy) defines the goals, establishes the procedure and conditions for the processing of personal data, measures aimed at protecting personal data, and also contains information about the rights of persons to whom the relevant personal data relates to Easy Shoppin LLC ( hereinafter referred to as the Society).'**
  String get termsPrivacy;

  /// No description provided for @processesPersonalAccordance.
  ///
  /// In en, this message translates to:
  /// **' The Company processes personal data in accordance with the requirements of the Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data” and other regulatory legal acts of the Russian Federation governing legal relations in the field of personal data processing.'**
  String get processesPersonalAccordance;

  /// No description provided for @policyAppliesSubjects.
  ///
  /// In en, this message translates to:
  /// **' The Policy applies to all personal data of personal data subjects specified in clauses 4.1.1., 4.1.2. Policies processed in the Company with and without the use of automation tools.'**
  String get policyAppliesSubjects;

  /// No description provided for @policyAppliesRelated.
  ///
  /// In en, this message translates to:
  /// **' The Policy applies to all actions related to the processing of personal data by the Company on the information resource, which is accessed via the domain name “*.es.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application (hereinafter referred to as the “Site”).'**
  String get policyAppliesRelated;

  /// No description provided for @subjectPersonalPolicy.
  ///
  /// In en, this message translates to:
  /// **' If the subject of personal data objects to the processing of personal data by the Company in accordance with the Policy, the subject of personal data has the right to refuse to use the Site and/or send an appropriate request to the Company. In this case, the functionality of the Site, including registration of a personal account, will not be provided.'**
  String get subjectPersonalPolicy;

  /// No description provided for @processingPersonalCarried.
  ///
  /// In en, this message translates to:
  /// **' The processing of personal data of the subject of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, as well as without obtaining consent in cases provided for by the legislation of the Russian Federation.'**
  String get processingPersonalCarried;

  /// No description provided for @policyComesGeneralDirector.
  ///
  /// In en, this message translates to:
  /// **' This Policy comes into force from the moment of its approval by the General Director of the Organization and is valid indefinitely until it is replaced by a new Policy.'**
  String get policyComesGeneralDirector;

  /// No description provided for @companyUnilaterallyChange.
  ///
  /// In en, this message translates to:
  /// **' The Company has the right to unilaterally change the terms of the Policy.'**
  String get companyUnilaterallyChange;

  /// No description provided for @policyFreelyInternet.
  ///
  /// In en, this message translates to:
  /// **' Due to the fact that the text of the Policy is freely available on the Internet, the subject of personal data must independently monitor changes made to the Policy.'**
  String get policyFreelyInternet;

  /// No description provided for @policyAppliesReceived.
  ///
  /// In en, this message translates to:
  /// **' This Policy applies to personal data received both before and after the entry into force of this Policy.'**
  String get policyAppliesReceived;

  /// No description provided for @internalControlCompany.
  ///
  /// In en, this message translates to:
  /// **' Internal control over compliance with the requirements of the Policy is carried out by the person responsible for organizing the processing of personal data in the Company.'**
  String get internalControlCompany;

  /// No description provided for @followingTermsPolicy.
  ///
  /// In en, this message translates to:
  /// **' The following terms are used in the Policy:'**
  String get followingTermsPolicy;

  /// No description provided for @automatedProcessingPersonal.
  ///
  /// In en, this message translates to:
  /// **' Automated processing of personal data - processing of personal data using computer technology.'**
  String get automatedProcessingPersonal;

  /// No description provided for @blockingTemporaryCessation.
  ///
  /// In en, this message translates to:
  /// **' Blocking is a temporary cessation of processing of personal data (except for cases where processing is necessary to clarify personal data).'**
  String get blockingTemporaryCessation;

  /// No description provided for @securityPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Security of personal data is the state of security of personal data, characterized by the ability of users of personal data information systems, personal data operators, technical means and information technologies to ensure the confidentiality, integrity and availability of personal data when processed in personal data information systems.'**
  String get securityPersonalData;

  /// No description provided for @biometricPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Biometric personal data is data that characterizes the physiological and biological characteristics of a person, on the basis of which his identity can be established.'**
  String get biometricPersonalData;

  /// No description provided for @federalLaw.
  ///
  /// In en, this message translates to:
  /// **' Law - Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data”.'**
  String get federalLaw;

  /// No description provided for @registeredBuyer.
  ///
  /// In en, this message translates to:
  /// **' Registered user (Buyer) - an individual who has a Site user ID (registered on the Site) and uses the Site in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila- polzovaniya-torgovoy-ploshchadkoy.'**
  String get registeredBuyer;

  /// No description provided for @depersonalization.
  ///
  /// In en, this message translates to:
  /// **' Depersonalization - actions as a result of which it becomes impossible to determine the ownership of personal data by a specific subject of personal data without the use of additional information.'**
  String get depersonalization;

  /// No description provided for @processingPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Processing of personal data - any action (operation) or set of actions (operations) performed with or without the use of automation tools with personal data, as well as through mixed processing, including collection, recording, systematization, accumulation, storage, clarification (updating , change), extraction, use, transfer (distribution, provision, access), depersonalization, blocking, deletion, destruction of personal data.'**
  String get processingPersonalData;

  /// No description provided for @society.
  ///
  /// In en, this message translates to:
  /// **' Society - Easy Shoppin LLC.'**
  String get society;

  /// No description provided for @operatorIndependently.
  ///
  /// In en, this message translates to:
  /// **' Operator - a person who, independently or jointly with other persons, organizes and (or) carries out the processing of personal data, as well as determining the purposes of processing personal data, the composition of personal data to be processed, actions (operations) performed with personal data. For the purposes of this Policy, the Company, when processing personal data, is an operator, unless otherwise expressly stated in the Policy.'**
  String get operatorIndependently;

  /// No description provided for @confidentialityPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Confidentiality of personal data is a mandatory requirement for the Company or any other person who has access to personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data or the presence of another legal basis provided for by federal law.'**
  String get confidentialityPersonalData;

  /// No description provided for @personalDataIdentified.
  ///
  /// In en, this message translates to:
  /// **' Personal data - any information relating to a directly or indirectly identified or identifiable individual (subject of personal data).'**
  String get personalDataIdentified;

  /// No description provided for @individualUsingServices.
  ///
  /// In en, this message translates to:
  /// **' User - an individual using the services of the Site (Internet user).'**
  String get individualUsingServices;

  /// No description provided for @websiteCompanyInformation.
  ///
  /// In en, this message translates to:
  /// **' The website is the Company’s information resource on the Internet, accessed via the domain name “*.es.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application.'**
  String get websiteCompanyInformation;

  /// No description provided for @specialCategoryPersonalData.
  ///
  /// In en, this message translates to:
  /// **' A special category of personal data is information relating to race, nationality, political views, religious or philosophical beliefs, health status, intimate life.'**
  String get specialCategoryPersonalData;

  /// No description provided for @provisionActionsAimed.
  ///
  /// In en, this message translates to:
  /// **' Provision - actions aimed at disclosing personal data to a certain person or a certain group of persons.'**
  String get provisionActionsAimed;

  /// No description provided for @distributionActionsAimed.
  ///
  /// In en, this message translates to:
  /// **' Distribution - actions aimed at disclosing personal data to an indefinite number of persons.'**
  String get distributionActionsAimed;

  /// No description provided for @individualDirectly.
  ///
  /// In en, this message translates to:
  /// **' Personal data subject is an individual directly or indirectly identified or determined on the basis of personal data relating to him.'**
  String get individualDirectly;

  /// No description provided for @destructionPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Destruction of personal data - actions as a result of which it becomes impossible to restore the content of personal data in the personal data information system and (or) as a result of which material media of personal data are destroyed.'**
  String get destructionPersonalData;

  /// No description provided for @cookiesCompanyContaining.
  ///
  /// In en, this message translates to:
  /// **' Cookies are text files available to the Company containing information about the device (IP address of the device), browser, application version, and stored in the browser of the computer (mobile device) of the User or Registered User when they visit the Site. The collection of cookies can be configured or disabled independently in the settings of the browser used.'**
  String get cookiesCompanyContaining;

  /// No description provided for @nicknameWebsite.
  ///
  /// In en, this message translates to:
  /// **' Pseudonym (nickname) is the name of the user (PDN subject) in a service, on a website, etc., which the user comes up with independently during registration.'**
  String get nicknameWebsite;

  /// No description provided for @otherTermsNotMentioned.
  ///
  /// In en, this message translates to:
  /// **' Other terms not mentioned above are used in the meaning established by regulatory legal acts of the Russian Federation, documents and local acts of the Company.'**
  String get otherTermsNotMentioned;

  /// No description provided for @purposesPersonalData.
  ///
  /// In en, this message translates to:
  /// **'2. Purposes of processing personal data'**
  String get purposesPersonalData;

  /// No description provided for @companyProcessesData.
  ///
  /// In en, this message translates to:
  /// **' The Company processes personal data for the following purposes:'**
  String get companyProcessesData;

  /// No description provided for @registrationPersonalAccount.
  ///
  /// In en, this message translates to:
  /// **' Registration and use of your personal account to place orders on the Site, as well as to receive informational and advertising mailings.'**
  String get registrationPersonalAccount;

  /// No description provided for @personalAccountRegisteredUser.
  ///
  /// In en, this message translates to:
  /// **' Use of a personal account by a Registered User on the Site by filling out information about yourself; placing orders (including payment and delivery of orders), tracking the status of an order, writing reviews about products, drawing up requests regarding work on the Site through a special form in the Registered User’s personal account, exercising the possibility of returning goods or funds (within the warranty period).'**
  String get personalAccountRegisteredUser;

  /// No description provided for @providingPossibilityBooking.
  ///
  /// In en, this message translates to:
  /// **' Providing the possibility of booking (purchasing) air and ground transport tickets on the Site.'**
  String get providingPossibilityBooking;

  /// No description provided for @providingCustomsClearance.
  ///
  /// In en, this message translates to:
  /// **' Providing data for customs clearance and delivery of goods, in case of ordering goods from abroad.'**
  String get providingCustomsClearance;

  /// No description provided for @providingDataCompletingTraining.
  ///
  /// In en, this message translates to:
  /// **' Providing data for completing training courses published by third parties on the Company’s Website.'**
  String get providingDataCompletingTraining;

  /// No description provided for @usingSiteCapabilities.
  ///
  /// In en, this message translates to:
  /// **' Using the Site\'s capabilities to make audio and video calls'**
  String get usingSiteCapabilities;

  /// No description provided for @legalGrounds.
  ///
  /// In en, this message translates to:
  /// **'3. Legal grounds for processing personal data'**
  String get legalGrounds;

  /// No description provided for @carriedCompany.
  ///
  /// In en, this message translates to:
  /// **' The processing of personal data is carried out by the Company on the following legal grounds:'**
  String get carriedCompany;

  /// No description provided for @consentSubjectPersonal.
  ///
  /// In en, this message translates to:
  /// **'- the processing of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, which the subject provides by active action, including putting a mark in the interface opposite the phrase: “I agree to the processing of personal data, with the rules for using the trading platform and returning”;'**
  String get consentSubjectPersonal;

  /// No description provided for @internationalTreaty.
  ///
  /// In en, this message translates to:
  /// **'- processing of personal data is necessary to achieve the goals provided for by an international treaty of the Russian Federation or law, to implement and fulfill the functions, powers and responsibilities assigned by the legislation of the Russian Federation to the operator'**
  String get internationalTreaty;

  /// No description provided for @executionAgreement.
  ///
  /// In en, this message translates to:
  /// **'- the processing of personal data is necessary for the execution of an agreement to which the subject of personal data is a party or beneficiary or guarantor, as well as for concluding an agreement on the initiative of the subject of personal data or an agreement under which the subject of personal data will be a beneficiary or guarantor. An agreement concluded with a personal data subject cannot contain provisions limiting the rights and freedoms of the personal data subject;'**
  String get executionAgreement;

  /// No description provided for @legitimateInterests.
  ///
  /// In en, this message translates to:
  /// **'- the processing of personal data is necessary to exercise the rights and legitimate interests of the operator or third parties, provided that the rights and freedoms of the subject of personal data are not violated.'**
  String get legitimateInterests;

  /// No description provided for @categoriesProcessed.
  ///
  /// In en, this message translates to:
  /// **'4. Categories of personal data processed, categories of personal data subjects'**
  String get categoriesProcessed;

  /// No description provided for @followingPersonalDataSubjects.
  ///
  /// In en, this message translates to:
  /// **' The Company processes personal data of the following personal data subjects:'**
  String get followingPersonalDataSubjects;

  /// No description provided for @individualsUsers.
  ///
  /// In en, this message translates to:
  /// **' Individuals - Users, in accordance with the purpose of processing specified in paragraphs. 2.1.1., 2.1.6.'**
  String get individualsUsers;

  /// No description provided for @individualsRegisteredUsers.
  ///
  /// In en, this message translates to:
  /// **' Individuals - Registered users, in accordance with the purposes of processing specified in paragraphs. 2.1.2., 2.1.3., 2.1.4., 2.1.5., 2.1.6.'**
  String get individualsRegisteredUsers;

  /// No description provided for @followingCategories.
  ///
  /// In en, this message translates to:
  /// **' The Company processes the following categories of personal data of personal data subjects:'**
  String get followingCategories;

  /// No description provided for @policyTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goals specified in clause 2.1.1 of the Policy - telephone number.'**
  String get policyTelephoneNumber;

  /// No description provided for @policyUserData1.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goals specified in clause 2.1.2 of the Policy - Site user ID; phone number; nickname (nickname); E-mail address; floor; order delivery address; Payment Methods; fiscal receipt; information about purchased goods.'**
  String get policyUserData1;

  /// No description provided for @policyUserData2.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goal specified in clause 2.1.3 of the Policy - full name; Date of Birth; citizenship; floor; details of identity documents; phone number; E-mail address; Site user ID.'**
  String get policyUserData2;

  /// No description provided for @policyUserData3.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goal specified in clause 2.1.4 of the Policy - full name; Date of Birth; details of identity documents; phone number; TIN; order delivery address; order list; Site user ID.'**
  String get policyUserData3;

  /// No description provided for @policyUserData4.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goal specified in clause 2.1.5 of the Policy - full name; phone number; E-mail address; information about taking courses in educational institutions (regional department and/or association/union), Site user ID.'**
  String get policyUserData4;

  /// No description provided for @policyUserData5.
  ///
  /// In en, this message translates to:
  /// **' As part of achieving the goal specified in clause 2.1.6 of the Policy - pseudonym (nickname); video recordings (without the purpose of identification).'**
  String get policyUserData5;

  /// No description provided for @procedureConditions.
  ///
  /// In en, this message translates to:
  /// **'5. Procedure and conditions for processing personal data'**
  String get procedureConditions;

  /// No description provided for @companyProcessesEnsures.
  ///
  /// In en, this message translates to:
  /// **' The Company processes and ensures the security of personal data for the implementation of the functions, powers and responsibilities assigned to the Company by the legislation of the Russian Federation, including, but not limited to, in accordance with the Constitution of the Russian Federation, federal laws, in particular Federal Law No. 152-FZ of July 27 2006 “On Personal Data”, by-laws, other defining cases and features of the processing of said personal data by the federal laws of the Russian Federation, as well as the Civil Code of the Russian Federation, Law of the Russian Federation No. 2300-1 of February 7, 1992 “On the Protection of Consumer Rights” , as well as the charter and local acts of the Company.'**
  String get companyProcessesEnsures;

  /// No description provided for @processesAutomationTools.
  ///
  /// In en, this message translates to:
  /// **' The Company processes personal data using automation tools, including collection, recording, systematization, accumulation, storage, clarification (updating, changing), extraction, use, transfer (provision, access, distribution), depersonalization, blocking, deletion, destruction of personal data within the time period necessary to achieve the purposes of processing personal data.'**
  String get processesAutomationTools;

  /// No description provided for @registeredUserConsents.
  ///
  /// In en, this message translates to:
  /// **' The registered user consents to the processing of personal data, valid from the date he begins using his personal account on the Site, and for a period of 30 days after the date of withdrawal of consent and deletion of the user’s personal account on the Site, since 30 days are necessary for the Company to complete the processing of all goods , returned by the user. Exceptions to this period are provided by the provisions of the Law.'**
  String get registeredUserConsents;

  /// No description provided for @notProcessSpecialCategories.
  ///
  /// In en, this message translates to:
  /// **' The Company does not process special categories of personal data and biometric personal data, except in cases where the processing of personal data is due to current business objectives, with the obligatory consent of the subject of personal data to the processing of personal data, or is necessary in accordance with the requirements of the legislation of the Russian Federation.'**
  String get notProcessSpecialCategories;

  /// No description provided for @rightEntrustProcessing.
  ///
  /// In en, this message translates to:
  /// **' The Company has the right to entrust the processing of personal data to third parties - processors - on the basis of contracts concluded with these persons and with the consent of the subject of personal data. If the Company entrusts the processing of personal data to another person, the Company is responsible to the subject of personal data for the actions of the said person. The person processing personal data on behalf of the Company is responsible for the security of personal data and compliance with the requirements of the Law to the Company. A person processing personal data on behalf of the Operator is not required to obtain the consent of the subject of personal data to process his personal data.'**
  String get rightEntrustProcessing;

  /// No description provided for @personsProcessingPersonal.
  ///
  /// In en, this message translates to:
  /// **' Persons processing personal data on the basis of an agreement concluded with the Company (operator’s instructions), under the terms of the agreements concluded with them, undertake to comply with the principles, rules for the processing and protection of personal data provided for by current legislation.'**
  String get personsProcessingPersonal;

  /// No description provided for @entrustProcessingPersonal.
  ///
  /// In en, this message translates to:
  /// **' The Company has the right to entrust the processing of personal data, or to transfer the personal data specified in paragraphs. 4.2.1. — 4.2.7. Policy, to third parties only if there are proper grounds for processing, and also on the condition that the data will be transferred to the minimum extent necessary to achieve the specified purposes, and third parties will take measures aimed at complying with the requirements for ensuring the security of personal data to achieve the following purposes:'**
  String get entrustProcessingPersonal;

  /// No description provided for @deliveryOrdersReturnGoods.
  ///
  /// In en, this message translates to:
  /// **' Delivery of orders and return of goods.'**
  String get deliveryOrdersReturnGoods;

  /// No description provided for @receiptProcessingTransfer.
  ///
  /// In en, this message translates to:
  /// **' Receipt, processing and transfer of funds.'**
  String get receiptProcessingTransfer;

  /// No description provided for @carryingCustomsClearance.
  ///
  /// In en, this message translates to:
  /// **' Carrying out customs clearance and delivery of goods in case of ordering goods from abroad.'**
  String get carryingCustomsClearance;

  /// No description provided for @groundTransportTickets.
  ///
  /// In en, this message translates to:
  /// **' Issuing air and ground transport tickets, hotel reservations.'**
  String get groundTransportTickets;

  /// No description provided for @completingTrainingCourses.
  ///
  /// In en, this message translates to:
  /// **' Completing training courses published by third parties on the Company’s Website.'**
  String get completingTrainingCourses;

  /// No description provided for @policiesInstructionsTransfer.
  ///
  /// In en, this message translates to:
  /// **' In accordance with clause 5.7. Policies, instructions for processing and transfer of personal data are carried out on the basis of agreements concluded by the Company with the following third parties: legal entities providing services to the Company, including ensuring security, delivery and customs clearance of goods; legal entities providing educational and other services to Registered users of the Site. The assignment of processing and transfer of personal data is carried out in cases provided for by agreements in which the subject of personal data is a party, beneficiary or guarantor, in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila -polzovaniya-torgovoy-ploshchadkoy.'**
  String get policiesInstructionsTransfer;

  /// No description provided for @obligesPersonsAuthorized.
  ///
  /// In en, this message translates to:
  /// **' The Company undertakes and obliges persons authorized to process personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data, unless otherwise provided by federal law.'**
  String get obligesPersonsAuthorized;

  /// No description provided for @destroyingPersonalData.
  ///
  /// In en, this message translates to:
  /// **' The procedure for destroying personal data on media containing personal data, including external/removable electronic media, paper media and in personal data information systems, is determined by the Company in its internal documents and local regulations.'**
  String get destroyingPersonalData;

  /// No description provided for @companyNotVerify.
  ///
  /// In en, this message translates to:
  /// **' The Company does not verify (does not have the ability to verify) the relevance and accuracy of the information provided by personal data subjects obtained through the Site. The Company proceeds from the fact that subjects of personal data provide reliable and sufficient personal data and keep them up to date.'**
  String get companyNotVerify;

  /// No description provided for @controlComplianceTerms.
  ///
  /// In en, this message translates to:
  /// **' The Company does not control compliance with the terms of confidentiality and processing of personal data of personal data subjects by owners or users of other sites to which the subject of personal data can click on links available on the Site, and is not responsible for the actions or inactions of owners or users of such sites in the field of processing personal data. data and privacy.'**
  String get controlComplianceTerms;

  /// No description provided for @representativesAuthorized.
  ///
  /// In en, this message translates to:
  /// **' Representatives of authorized government bodies (including regulatory, supervisory, law enforcement, inquiry and investigation) receive access to personal data processed in the Company to the extent and in the manner established by the legislation of the Russian Federation.'**
  String get representativesAuthorized;

  /// No description provided for @companyNecessaryLegal.
  ///
  /// In en, this message translates to:
  /// **' The Company takes the necessary legal, organizational and technical measures to protect personal data from unauthorized or accidental access, destruction, modification, blocking, copying, provision, distribution of personal data, as well as from other unlawful actions in relation to personal data in accordance with legal requirements Russian Federation and internal documents. Ensuring the security of personal data and fulfillment of the Company’s obligations in accordance with the Law is achieved, including:'**
  String get companyNecessaryLegal;

  /// No description provided for @determiningThreatsSecurity.
  ///
  /// In en, this message translates to:
  /// **' Determining threats to the security of personal data during their processing in personal data information systems.'**
  String get determiningThreatsSecurity;

  /// No description provided for @applicationOrganizational.
  ///
  /// In en, this message translates to:
  /// **' Application of organizational and technical measures to ensure the security of personal data during their processing in personal data information systems necessary to fulfill the requirements for the protection of personal data, the implementation of which ensures the levels of personal data security established by the Government of the Russian Federation.'**
  String get applicationOrganizational;

  /// No description provided for @assessingEffectiveness.
  ///
  /// In en, this message translates to:
  /// **' Assessing the effectiveness of measures taken to ensure the security of personal data before putting into operation the personal data information system.'**
  String get assessingEffectiveness;

  /// No description provided for @appointmentPersonResponsible.
  ///
  /// In en, this message translates to:
  /// **' Appointment of a person responsible for organizing the processing of personal data.'**
  String get appointmentPersonResponsible;

  /// No description provided for @publicationCompanyDocuments.
  ///
  /// In en, this message translates to:
  /// **' Publication by the Company of documents defining the Company\'s policy regarding the processing of personal data, local acts on the processing of personal data, defining for each purpose of processing personal data the categories and list of processed personal data, categories of subjects whose personal data is processed, methods, terms of their processing and storage , the procedure for the destruction of personal data upon achieving the purposes of their processing or upon the occurrence of other legal grounds, as well as local acts establishing procedures aimed at preventing and identifying violations of the legislation of the Russian Federation, eliminating the consequences of such violations. Such documents and local acts cannot contain provisions limiting the rights of personal data subjects, as well as imposing on the Company powers and obligations not provided for by the legislation of the Russian Federation.'**
  String get publicationCompanyDocuments;

  /// No description provided for @carryingInternalControl.
  ///
  /// In en, this message translates to:
  /// **' Carrying out internal control and (or) audit of compliance of personal data processing with the Law and regulatory legal acts adopted in accordance with it, requirements for the protection of personal data, the Company’s policy regarding the processing of personal data, internal documents of the Company.'**
  String get carryingInternalControl;

  /// No description provided for @familiarizationCompanys.
  ///
  /// In en, this message translates to:
  /// **' Familiarization of the Company\'s employees directly involved in the processing of personal data with the provisions of the legislation of the Russian Federation on personal data, including requirements for the protection of personal data, documents defining the Company\'s policy regarding the processing of personal data, local regulations on the processing of personal data, and (or ) training of these employees.'**
  String get familiarizationCompanys;

  /// No description provided for @assessmentAccordance.
  ///
  /// In en, this message translates to:
  /// **' Assessment of harm in accordance with the requirements established by the authorized body for the protection of the rights of personal data subjects that may be caused to personal data subjects in the event of a violation of this Federal Law, the relationship between this harm and the measures taken by the operator aimed at ensuring the fulfillment of the obligations provided for by this Federal Law.'**
  String get assessmentAccordance;

  /// No description provided for @detectionFactsUnauthorized.
  ///
  /// In en, this message translates to:
  /// **' Detection of facts of unauthorized access to personal data and taking measures, including measures to detect, prevent and eliminate the consequences of computer attacks on personal data information systems and to respond to computer incidents in them.'**
  String get detectionFactsUnauthorized;

  /// No description provided for @controlSecurityPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Control over the measures taken to ensure the security of personal data and the level of security of personal data information systems.'**
  String get controlSecurityPersonalData;

  /// No description provided for @companyStops.
  ///
  /// In en, this message translates to:
  /// **' The Company stops processing personal data and destroys it in the following cases:'**
  String get companyStops;

  /// No description provided for @liquidationCompany.
  ///
  /// In en, this message translates to:
  /// **' liquidation of the Company;'**
  String get liquidationCompany;

  /// No description provided for @reorganizationCompany.
  ///
  /// In en, this message translates to:
  /// **' reorganization of the Company, entailing the termination of its activities;'**
  String get reorganizationCompany;

  /// No description provided for @terminationLegalGrounds.
  ///
  /// In en, this message translates to:
  /// **' termination of the legal grounds for processing personal data and/or achieving the purposes of processing personal data;'**
  String get terminationLegalGrounds;

  /// No description provided for @revocationConsentSubject.
  ///
  /// In en, this message translates to:
  /// **' revocation of the consent of the subject of personal data to the processing of personal data.'**
  String get revocationConsentSubject;

  /// No description provided for @storagePersonalData.
  ///
  /// In en, this message translates to:
  /// **' The storage of personal data is carried out by the Company in a form that allows identifying the subject of personal data no longer than required by the purposes of processing personal data and in accordance with the provisions of the Law.'**
  String get storagePersonalData;

  /// No description provided for @collectingPersonalData.
  ///
  /// In en, this message translates to:
  /// **' When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.'**
  String get collectingPersonalData;

  /// No description provided for @procedureDestruction.
  ///
  /// In en, this message translates to:
  /// **' The procedure for the destruction of personal data on media containing personal data, including external/removable electronic media, paper media and personal data information systems, is being developed in accordance with the Order of the Federal Service for Supervision of Communications, Information Technology and Mass Communications dated October 28 2022 No. 179 “On approval of the Requirements for confirming the destruction of personal data” and is enshrined in the Rules for the destruction and depersonalization of personal data of the Company.'**
  String get procedureDestruction;

  /// No description provided for @deletePersonalAccount.
  ///
  /// In en, this message translates to:
  /// **' Consent to the processing of personal data can be withdrawn by the subject of personal data, including by clicking on the special “Delete personal account” button on the Site.'**
  String get deletePersonalAccount;

  /// No description provided for @cookies.
  ///
  /// In en, this message translates to:
  /// **'6. Cookies'**
  String get cookies;

  /// No description provided for @cookiesSiteServiceUsed.
  ///
  /// In en, this message translates to:
  /// **' The Site and/or the Service may use the Cookies listed in paragraph 6.1. The User Documents of the Site and/or the Service may provide for the use of other Cookies.'**
  String get cookiesSiteServiceUsed;

  /// No description provided for @necessaryCookies.
  ///
  /// In en, this message translates to:
  /// **'Necessary Cookies These cookies ensure the proper functioning of the Site and/or Service, they are necessary'**
  String get necessaryCookies;

  /// No description provided for @optOutUseCookies.
  ///
  /// In en, this message translates to:
  /// **' To refuse the use of Cookies, the User and Registered User have the right to use the browser settings, where it is possible to disable the use of Cookies, as well as in the interface of the Site and / or Service, if applicable. Complete disabling of Cookies may lead to limitation of the functionality of the Site and / or Service. Detailed instructions on disabling Cookies are available at external links:'**
  String get optOutUseCookies;

  /// No description provided for @responsesRequests.
  ///
  /// In en, this message translates to:
  /// **'7. Responses to requests from subjects for access to personal data'**
  String get responsesRequests;

  /// No description provided for @collectingPersonalDataCompany.
  ///
  /// In en, this message translates to:
  /// **' When collecting personal data, the Company is obliged to provide the subject of personal data, at his request, with the information provided for in Part 7 of Article 14 of the Law.'**
  String get collectingPersonalDataCompany;

  /// No description provided for @demandCompanyClarification.
  ///
  /// In en, this message translates to:
  /// **' The subject of personal data has the right to demand from the Company clarification of his personal data, blocking or destruction of it if the personal data is incomplete, outdated, inaccurate, illegally obtained or is not necessary for the stated purpose of processing, as well as take measures provided by law to protect his rights.'**
  String get demandCompanyClarification;

  /// No description provided for @stopTransfer.
  ///
  /// In en, this message translates to:
  /// **' The subject of personal data has the right to apply to the Company with a request to stop the transfer (distribution, provision, access) of his personal data, previously authorized by the Subject of personal data, in terms of the specified actions for distribution, in case of non-compliance with the provisions of Article 10.1 of the Law, or to apply with such a demand to the court . The Company is obliged to stop the transfer (distribution, provision, access) of personal data within three working days from the receipt of the request of the subject of personal data or within the period specified in the court decision that has entered into legal force, and if such a period is not specified in the court decision, then within three working days from the moment the court decision enters into legal force.'**
  String get stopTransfer;

  /// No description provided for @appealInactionCompany.
  ///
  /// In en, this message translates to:
  /// **' The subject of personal data has the right to appeal the actions or inaction of the Company to the Federal Service for Supervision in the Sphere of Communications, Information Technologies and Mass Communications (Roskomnadzor) or in court if the subject of personal data believes that the Company is processing his personal data in violation of the requirements of the Law or otherwise violates his rights and freedoms.'**
  String get appealInactionCompany;

  /// No description provided for @protectLegitimateInterests.
  ///
  /// In en, this message translates to:
  /// **' To exercise his rights and protect legitimate interests, the subject of personal data has the right to contact the Company. To send official requests to the Company, you must use the contact information specified in paragraphs. 6.17., 6.18. Politicians.'**
  String get protectLegitimateInterests;

  /// No description provided for @unlawfulProcessing.
  ///
  /// In en, this message translates to:
  /// **' If unlawful processing of personal data is detected upon application by the subject of personal data or his representative or at the request of the subject of personal data or his representative or the authorized body for the protection of the rights of personal data subjects, the operator is obliged to block unlawfully processed personal data relating to this subject of personal data, or ensure their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) from the moment of such an appeal or receipt of the specified request for the period of verification.'**
  String get unlawfulProcessing;

  /// No description provided for @inaccuratePersonalData.
  ///
  /// In en, this message translates to:
  /// **' If inaccurate personal data is identified when contacting the subject of personal data or his representative or at their request or at the request of the authorized body for the protection of the rights of subjects of personal data, the operator is obliged to block personal data relating to this subject of personal data or ensure their blocking (if processing personal data is carried out by another person acting on behalf of the operator) from the moment of such application or receipt of the specified request for the period of verification, if blocking of personal data does not violate the rights and legitimate interests of the subject of personal data or third parties.'**
  String get inaccuratePersonalData;

  /// No description provided for @factInaccuracyPersonalData.
  ///
  /// In en, this message translates to:
  /// **' If the fact of inaccuracy of personal data is confirmed, the Company, on the basis of information provided by the subject of personal data or his representative or an authorized body for the protection of the rights of subjects of personal data, or other necessary documents, is obliged to clarify the personal data or ensure their clarification (if the processing of personal data is carried out by another person, acting on behalf of the operator) within seven working days from the date of submission of such information and remove the blocking of personal data.'**
  String get factInaccuracyPersonalData;

  /// No description provided for @purposeProcessingPersonalData.
  ///
  /// In en, this message translates to:
  /// **' If the purpose of processing personal data is achieved, the Company is obliged to stop processing personal data or ensure its termination (if the processing of personal data is carried out by another person acting on behalf of the operator) and destroy personal data or ensure its destruction (if the processing of personal data is carried out by another person acting on behalf of the operator). on behalf of the Company) within a period not exceeding thirty days from the date of achieving the purpose of processing personal data, unless otherwise provided by an agreement to which the subject of personal data is a party, beneficiary or guarantor, another agreement between the Company and the subject of personal data, or if the Company has no right carry out the processing of personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.'**
  String get purposeProcessingPersonalData;

  /// No description provided for @withdrawsConsent.
  ///
  /// In en, this message translates to:
  /// **' If the subject of personal data withdraws consent to the processing of his personal data, the Company is obliged to stop processing them or ensure the termination of such processing (if the processing of personal data is carried out by another person acting on behalf of the Company) and in the event that the preservation of personal data is no longer required for the purposes of processing personal data, destroy personal data or ensure their destruction (if the processing of personal data is carried out by another person acting on behalf of the Company) within a period not exceeding thirty days from the date of receipt of the said response, unless otherwise provided by the agreement to which the beneficiary or guarantor is a party which is the subject of personal data, another agreement between the Company and the subject of personal data, or if the Company does not have the right to process personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.'**
  String get withdrawsConsent;

  /// No description provided for @subjectPersonalDataApplies.
  ///
  /// In en, this message translates to:
  /// **' If a subject of personal data applies to the Company with a request to stop processing personal data, the Company is obliged, within a period not exceeding ten working days from the date the Company receives the corresponding request, to stop processing them or ensure the termination of such processing (if such processing is carried out by the person processing personal data). data), except for the cases provided for in paragraphs 2 - 11 of part 1 of Article 6, part 2 of Article 10 and part 2 of Article 11 of the Law. This period may be extended, but not more than by five working days, if the operator sends a motivated notification to the personal data subject indicating the reasons for extending the period for providing the requested information.'**
  String get subjectPersonalDataApplies;

  /// No description provided for @possibleDestroyPersonalData.
  ///
  /// In en, this message translates to:
  /// **' If it is not possible to destroy personal data within the period established by the Law, the Company blocks such personal data or ensures their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) and ensures the destruction of personal data within a period of no more than six months , unless another period is established by federal laws.'**
  String get possibleDestroyPersonalData;

  /// No description provided for @personalDataProcessed.
  ///
  /// In en, this message translates to:
  /// **' If the personal data processed by the Company for the purposes of purchasing air and (or) ground transport tickets is not received from the subject of personal data, then such personal data is considered by the Company to have been legally received by the Registered User of the Site, transferring to the Company the personal data of the subject of personal data. Before processing such personal data, the Company is obliged to notify the subject of personal data and provide him with the following information:'**
  String get personalDataProcessed;

  /// No description provided for @nameAddressCompany.
  ///
  /// In en, this message translates to:
  /// **' Name and address of the Company or its representative.'**
  String get nameAddressCompany;

  /// No description provided for @purposeProcessingPersonal.
  ///
  /// In en, this message translates to:
  /// **' Purpose of processing personal data and its legal basis.'**
  String get purposeProcessingPersonal;

  /// No description provided for @listPersonalData.
  ///
  /// In en, this message translates to:
  /// **' List of personal data.'**
  String get listPersonalData;

  /// No description provided for @intendedUsersPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Intended users of personal data.'**
  String get intendedUsersPersonalData;

  /// No description provided for @rightsSubjectPersonalData.
  ///
  /// In en, this message translates to:
  /// **' Rights of the subject of personal data established by law.'**
  String get rightsSubjectPersonalData;

  /// No description provided for @sourcePersonalData.
  ///
  /// In en, this message translates to:
  /// **' Source of personal data.'**
  String get sourcePersonalData;

  /// No description provided for @companyReleased.
  ///
  /// In en, this message translates to:
  /// **' The Company is released from the obligation to provide the subject of personal data with the information provided for in the relevant paragraphs of this Policy in cases where:'**
  String get companyReleased;

  /// No description provided for @personalDataNotified.
  ///
  /// In en, this message translates to:
  /// **' The subject of personal data is notified of the processing of his personal data by the Company.'**
  String get personalDataNotified;

  /// No description provided for @personalDataAuthorized.
  ///
  /// In en, this message translates to:
  /// **' The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.'**
  String get personalDataAuthorized;

  /// No description provided for @personalDataStatistical.
  ///
  /// In en, this message translates to:
  /// **' The Company processes personal data for statistical or other research purposes, unless the rights and legitimate interests of the subject of personal data are violated.'**
  String get personalDataStatistical;

  /// No description provided for @relevantParagraphs.
  ///
  /// In en, this message translates to:
  /// **' Providing the subject of personal data with the information provided for in the relevant paragraphs of this Policy violates the rights and legitimate interests of third parties.'**
  String get relevantParagraphs;

  /// No description provided for @companyEnsuresRecording.
  ///
  /// In en, this message translates to:
  /// **' When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.'**
  String get companyEnsuresRecording;

  /// No description provided for @investigatesViolations.
  ///
  /// In en, this message translates to:
  /// **' The Company considers any requests and complaints from subjects of personal data, investigates violations and takes all necessary measures to immediately eliminate them and resolve disputes out of court. The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.'**
  String get investigatesViolations;

  /// No description provided for @informationRegardingProcessing.
  ///
  /// In en, this message translates to:
  /// **' A written request from a personal data subject to provide information regarding the processing of his personal data must contain the mandatory information established by Part 3 of Article 14 of the Law, including the telephone number used to enter the Site. A written appeal (request) is sent to the legal address of the Company: 142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1.'**
  String get informationRegardingProcessing;

  /// No description provided for @electronicDocument.
  ///
  /// In en, this message translates to:
  /// **' The request can also be sent by the subject of personal data in the form of an electronic document and signed with an electronic signature in accordance with the legislation of the Russian Federation. To obtain information about your personal data, familiarize yourself with it, clarify it, block or destroy it, or withdraw consent to its processing, requests can be sent to the email address: sales@easyshoppin.ru.'**
  String get electronicDocument;

  /// No description provided for @interactionOtherIssues.
  ///
  /// In en, this message translates to:
  /// **' Interaction on other issues related to the processing of personal data by the Company is also carried out using the following contact information: postal address (142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1) and / or email address (sales@easyshoppin.ru).'**
  String get interactionOtherIssues;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'1. Terms'**
  String get terms;

  /// No description provided for @termsRules.
  ///
  /// In en, this message translates to:
  /// **' In these rules, unless the context otherwise requires, the following terms have the following meanings:\n'**
  String get termsRules;

  /// No description provided for @tradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' - the website https://www.easyshoppin.ru and the Easy Shoppin mobile application, which are a service that provides access to information about products intended for potential Buyers (consumers).'**
  String get tradingPlatform;

  /// No description provided for @ownerPlatform.
  ///
  /// In en, this message translates to:
  /// **' - of the Trading Platform is Easy Shoppin LLC (according to the text of these Rules - Easy Shoppin (Legal address: 142181 Ulyanovsk region, building 1, OGRN 1067746062449, Email: sale@easyshoppin.ru).'**
  String get ownerPlatform;

  /// No description provided for @userTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' - any individual using the Trading Platform under the terms of these Rules.'**
  String get userTradingPlatform;

  /// No description provided for @sellerTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' is an individual entrepreneur, legal entity or self-employed citizen, duly registered in Russian or foreign jurisdiction, engaged in the sale of goods and offering the Buyer to enter into a purchase and sale agreement for the Goods by placing the Goods on the Marketplace.'**
  String get sellerTradingPlatform;

  /// No description provided for @bayerTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' - an individual who purchases Goods on the Marketplace for personal and/or household needs not related to business activities, by placing and paying for an Order through the payment services of the Marketplace.'**
  String get bayerTradingPlatform;

  /// No description provided for @goodsTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' - are the subject of a purchase and sale agreement concluded between the Buyer and the Seller. The Seller is the owner of the Goods being sold. All relationships related to the purchase and sale of Goods arise between the Seller, who places the Goods on the Marketplace, and the Buyer.'**
  String get goodsTradingPlatform;

  /// No description provided for @personalAccountPlatform.
  ///
  /// In en, this message translates to:
  /// **' - is a personal section of the Trading Platform that is not accessible to third parties, created by the Buyer and used for the purpose of placing Orders and processing Services, as well as receiving special offers in accordance with these Rules, which is accessed after registration by entering the Buyer’s authentication data.'**
  String get personalAccountPlatform;

  /// No description provided for @orderPickUpPlatform.
  ///
  /// In en, this message translates to:
  /// **' - point is a unit of the logistics infrastructure that issues Orders to Buyers who have indicated the address of the corresponding Order pick-up point as the delivery location.'**
  String get orderPickUpPlatform;

  /// No description provided for @postamat.
  ///
  /// In en, this message translates to:
  /// **' - is an automated terminal for issuing goods.'**
  String get postamat;

  /// No description provided for @orderBayer.
  ///
  /// In en, this message translates to:
  /// **' - the implementation by the Buyer of actions aimed at concluding an agreement for the provision of delivery services for the Goods, as well as an agreement/sales agreements for the corresponding Goods/Goods with Easy Shoppin  and/or other Seller/Sellers, by registering the specified services and Goods on the Marketplace.'**
  String get orderBayer;

  /// No description provided for @servicesDelivery.
  ///
  /// In en, this message translates to:
  /// **' - delivery services provided by Easy Shoppin to the Buyer in relation to Goods purchased by the Buyer from Easy Shoppin or other Sellers on the Marketplace or returned by the Buyer to Easy Shoppin  or the Seller.'**
  String get servicesDelivery;

  /// No description provided for @deliveryGoods.
  ///
  /// In en, this message translates to:
  /// **' - delivery of goods to the address specified by the Buyer, different from the addresses of Order Pickup Points and Post Office addresses.'**
  String get deliveryGoods;

  /// No description provided for @promotionLoyalty.
  ///
  /// In en, this message translates to:
  /// **'- is a loyalty program conducted by Easy Shoppin, which includes special conditions for ordering certain Products.'**
  String get promotionLoyalty;

  /// No description provided for @promotionalDiscount.
  ///
  /// In en, this message translates to:
  /// **'- is a discount that is provided on a specific Product. The discount amount is indicated on the Product page. The price of the Product is indicated taking into account the promotional discount. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.'**
  String get promotionalDiscount;

  /// No description provided for @discountPromotionalCode.
  ///
  /// In en, this message translates to:
  /// **'- discount using a is a discount that is provided for a specific group of Products when the Buyer places an Order. The price difference between a product without a discount and a product with a discount is the advantage of the final Buyer within the framework of the action to purchase a specific specified product'**
  String get discountPromotionalCode;

  /// No description provided for @promotional.
  ///
  /// In en, this message translates to:
  /// **'- code is a special code that provides a discount on a specific group of Products and has an expiration date. Promo codes are applied automatically. Only one promotional code can be applied to one item of goods. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.'**
  String get promotional;

  /// No description provided for @esDiscount.
  ///
  /// In en, this message translates to:
  /// **'- is a discount provided to the Buyer under certain conditions established by the Marketplace.'**
  String get esDiscount;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'- the amount of available funds at the buyer’s disposal, which he can dispose of at his own discretion by transferring them to the bank details specified by the Buyer or by paying for subsequent orders on the Trading Platform website in the amount of up to 100% of the cost of the goods. When canceling/returning an order paid using “Balance”, the funds are returned back to “Balance”.'**
  String get balance;

  /// No description provided for @returnGoods.
  ///
  /// In en, this message translates to:
  /// **'- refusal by the Buyer of the Goods of proper quality in order to return them to Easy Shoppin or the Seller of the goods.'**
  String get returnGoods;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'- is a service of the Marketplace for interaction between the Buyer and Easy Shoppin and/or the Seller.'**
  String get chat;

  /// No description provided for @productCard.
  ///
  /// In en, this message translates to:
  /// **'- information about the product, containing a visual and text description of the product, its main characteristics, information about the seller of the product, its price, as well as other information, the indication of which is necessary to make a decision about ordering the product. The product card contains the essential terms of the purchase and sale agreement and is filled out by the Seller of the goods independently.'**
  String get productCard;

  /// No description provided for @registrationData.
  ///
  /// In en, this message translates to:
  /// **'Registration data - data that is indicated (contained) in the Personal Account after registration and data specified by the User when placing an order.'**
  String get registrationData;

  /// No description provided for @esElectronicWallet.
  ///
  /// In en, this message translates to:
  /// **'- is an electronic means of payment provided to the Buyer by Easy Shoppin Bank LLC on the basis of an agreement concluded between Easy Shoppin Bank LLC and the Buyer.'**
  String get esElectronicWallet;

  /// No description provided for @generationProvisions.
  ///
  /// In en, this message translates to:
  /// **'2. General provisions'**
  String get generationProvisions;

  /// No description provided for @tradingPlatformSearch.
  ///
  /// In en, this message translates to:
  /// **' The trading platform provides the Buyer with a free opportunity to search for information about the Products, familiarize yourself with the product offerings of Easy Shoppin  and other Sellers, receive (including based on search results) product offers and information, order Products, select a delivery method, pay for Products, as well as other functional possibilities.'**
  String get tradingPlatformSearch;

  /// No description provided for @usingTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' By using the Trading Platform, placing Orders, paying for Orders, refusing Goods, the Buyer unconditionally agrees to the terms of these Rules, which are a Public Offer within the meaning of Art. 437 of the Civil Code of the Russian Federation, as well as with the terms of the Rules for the Application of Recommendation Technologies, and undertakes to comply with them.'**
  String get usingTradingPlatform;

  /// No description provided for @sellersMarketplace.
  ///
  /// In en, this message translates to:
  /// **' Sellers on the Marketplace include both Easy Shoppin and other legal entities of various organizational and legal forms, individual entrepreneurs, citizens using the special tax regime “Professional Income Tax”, including also foreign citizens and legal entities.'**
  String get sellersMarketplace;

  /// No description provided for @infoSellerProduct.
  ///
  /// In en, this message translates to:
  /// **' Information about the Seller of the Product is placed in the Product Card on the Marketplace under the “i” icon (or by hovering over the icon). This information is provided directly by the Seller of the goods and is published by Easy Shoppin  without changing its content or meaning. Responsibility for the completeness of the information and its accuracy lies with the Seller providing the information.'**
  String get infoSellerProduct;

  /// No description provided for @cardGoodsOffered.
  ///
  /// In en, this message translates to:
  /// **' A card of goods offered for sale by a foreign seller may not contain information about the identification number due to the difference in formats and the absence of such numbers in foreign jurisdictions. If necessary, information allowing the identification of such a Seller will be provided at the consumer\'s request by the Seller itself or Easy Shoppin  (if Easy Shoppin  has such information).'**
  String get cardGoodsOffered;

  /// No description provided for @reviewRatingsMarketplace.
  ///
  /// In en, this message translates to:
  /// **' The Marketplace has implemented a service for reviews and ratings of Buyers for purchased Products, which operates according to the following rules, with which the Buyer who leaves a review of the Product and evaluates the Product agrees:'**
  String get reviewRatingsMarketplace;

  /// No description provided for @authorizedBuyer.
  ///
  /// In en, this message translates to:
  /// **' Any authorized Buyer can leave reviews about Products posted on the Marketplace and rate Products when using the Marketplace;'**
  String get authorizedBuyer;

  /// No description provided for @buyersReview.
  ///
  /// In en, this message translates to:
  /// **' With the Buyer’s review, his name indicated in the Personal Account of the Trading Platform will be published in the appropriate section of the Trading Platform;'**
  String get buyersReview;

  /// No description provided for @noReviewMarketplace.
  ///
  /// In en, this message translates to:
  /// **' Reviews, the content of which is not related to the work of the Marketplace or making purchases on it, are not published;'**
  String get noReviewMarketplace;

  /// No description provided for @noReviewActualExperience.
  ///
  /// In en, this message translates to:
  /// **' Reviews, the content of which does not relate to the actual experience of using the relevant Product, are not published;'**
  String get noReviewActualExperience;

  /// No description provided for @noReviewProfanity.
  ///
  /// In en, this message translates to:
  /// **' Reviews that contain profanity, offensive statements, including photographs and images that are unacceptable for publication from an ethical point of view, are not published;'**
  String get noReviewProfanity;

  /// No description provided for @noReviewOtherWebsites.
  ///
  /// In en, this message translates to:
  /// **' Reviews and comments containing links to other websites, personal data of third parties, as well as other information prohibited or restricted for distribution, are not published;'**
  String get noReviewOtherWebsites;

  /// No description provided for @publishedReviewDeleted.
  ///
  /// In en, this message translates to:
  /// **' A published review may be deleted at any time without explanation;'**
  String get publishedReviewDeleted;

  /// No description provided for @reviewConsideredRelevant.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin independently determines the period during which reviews are considered relevant and for which they are published.'**
  String get reviewConsideredRelevant;

  /// No description provided for @buyerAgreesMessages.
  ///
  /// In en, this message translates to:
  /// **' The Buyer agrees that messages and materials posted by him on the Marketplace may be used by Easy Shoppin, including in other Easy Shoppin services and applications, in advertising or marketing materials posted on Easy Shoppin resources on the Internet, as well as on other resources and sites on the Internet, to attract the attention of other consumers to the Marketplace as a whole or to the goods and services of third parties, as with the indication of the author of the message or material (the name of the author will be indicated as the name of the Buyer, which he indicated during registration or in the settings of his data in the Personal Account), and without it, without the obligation to provide reports on the use of such messages and materials, without the need to obtain special permission from the Buyer and without paying royalties, throughout the world without a time limit, with the right of Easy Shoppin to provide the specified rights to use such messages and materials to third parties.'**
  String get buyerAgreesMessages;

  /// No description provided for @buyerAgreesReview.
  ///
  /// In en, this message translates to:
  /// **' The Buyer agrees that the reviews and ratings he left may be published and used by Easy Shoppin on the Marketplace or on third party websites without additional consent from the Buyer. In this case, reviews and images attached to them are published and used “as is”, preserving the author’s grammar and punctuation, under the Buyer’s name indicated in the Personal Account. The buyer is responsible for the accuracy of the information contained in the reviews he left.'**
  String get buyerAgreesReview;

  /// No description provided for @buyerInformedTrading.
  ///
  /// In en, this message translates to:
  /// **' The Buyer is informed that the Trading Platform, which collectively represents computer programs, as well as the generated graphic and audiovisual displays, the user interface as a whole, design elements, text, graphic images and other information posted by Easy Shoppin, are protected results of intellectual activity, the exclusive right to which belongs to Easy Shoppin.'**
  String get buyerInformedTrading;

  /// No description provided for @providesUsers.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin provides Users with a non-exclusive license to use databases and computer programs necessary for using the Trading Platform for the purposes provided for in this Offer free of charge.'**
  String get providesUsers;

  /// No description provided for @licenseGranted.
  ///
  /// In en, this message translates to:
  /// **' A non-exclusive license is granted from the moment of access to the Marketplace and continues to be valid as long as the User uses the Marketplace for personal, non-commercial purposes. Searching and viewing offers on the Marketplace is available to all users, regardless of registration and authorization. In order to gain access to other functionality of the Marketplace, namely: make a purchase, place an order, you need to register a Personal Account.'**
  String get licenseGranted;

  /// No description provided for @registrationTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' From the moment of registration on the Trading Platform, Easy Shoppin provides the User (the owner of the personal account) for the entire term of the Agreement with a non-exclusive, non-transferable license to use the Trading Platform in the part directly related to the User, namely, the right to use the functionality of the Trading Platform solely for the purpose of exercising the rights and obligations in within the framework of this Offer, including: for registration and identification on the Marketplace, for interaction with support specialists for users/customers on the Portal, with sellers, including, but not limited to, for the purpose of receiving services provided for in the Agreement, transfer and return of Goods, to request and receive information in the manner and under the conditions provided for in the Agreement.'**
  String get registrationTradingPlatform;

  /// No description provided for @userBuyer.
  ///
  /// In en, this message translates to:
  /// **' The user/buyer is not entitled to:'**
  String get userBuyer;

  /// No description provided for @useTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' use the Trading Platform, its individual elements in ways and/or for purposes not provided for in this Offer;'**
  String get useTradingPlatform;

  /// No description provided for @sourceCodeTradingPlatform.
  ///
  /// In en, this message translates to:
  /// **' carry out any actions related to modification of the source code of the Trading Platform;'**
  String get sourceCodeTradingPlatform;

  /// No description provided for @registeringPersonalAccount.
  ///
  /// In en, this message translates to:
  /// **' By registering in your personal account/using the Trading Platform, the User fully and unconditionally agrees to the terms of use of the Trading Platform, as well as other intellectual property of Easy Shoppin. In case of violation by the User of the terms of use of the Trading Platform and/or other intellectual property of Easy Shoppin, including, but not limited to, means of individualization of Easy Shoppin, Easy Shoppin has the right to demand payment by the User of a penalty (fine) in accordance with the Agreement, and also reserves the right to block the User’s personal account at the market.'**
  String get registeringPersonalAccount;

  /// No description provided for @ongoingPromotion.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin has the right, as part of the ongoing promotion, to determine individual Products, upon leaving reviews for which the Buyer can be awarded Bonus Points. Bonus points are accrued under the following conditions:'**
  String get ongoingPromotion;

  /// No description provided for @productsParticipatePromotion.
  ///
  /// In en, this message translates to:
  /// **' Bonus points are awarded only for reviews of Products that participate in the promotion, which is reflected in the Product Card.'**
  String get productsParticipatePromotion;

  /// No description provided for @productParticipatingBuyer.
  ///
  /// In en, this message translates to:
  /// **' A review of a Product participating in the promotion can be left by the Buyer who purchased this Product no later than 5 (five) days after the Buyer receives this Product.'**
  String get productParticipatingBuyer;

  /// No description provided for @numberBonusPoints.
  ///
  /// In en, this message translates to:
  /// **' The number of Bonus Points awarded for a review depends on the availability of a text description, video and photographs of the Product and is reflected in the review registration interface on the Marketplace.'**
  String get numberBonusPoints;

  /// No description provided for @reviewChecked.
  ///
  /// In en, this message translates to:
  /// **' Each review is checked for compliance with the conditions of clause 2.4 of these Rules and is published on the Marketplace, subject to approval based on the results of the check. Bonus points are awarded to the Buyer for a published review 14 days after its publication.'**
  String get reviewChecked;

  /// No description provided for @bonusPointsAwarded.
  ///
  /// In en, this message translates to:
  /// **' Bonus points will not be awarded if the review has not passed the compliance check and is therefore not published.'**
  String get bonusPointsAwarded;

  /// No description provided for @bonusPointsBuyer.
  ///
  /// In en, this message translates to:
  /// **' Bonus points are not awarded if the Buyer, after writing a review, returns the product in the manner prescribed by these Rules. A review left for such a Product, if it complies with the conditions of clause 2.4 of these Rules, may be published on the Marketplace.'**
  String get bonusPointsBuyer;

  /// No description provided for @bonusPointsGoods.
  ///
  /// In en, this message translates to:
  /// **' Bonus points can be used to pay for orders of Goods on the Marketplace and cannot be transferred to an account with a credit institution in the manner provided for in clause 5.17 of these Rules. When paying for an order, 1 bonus point is equal to 1 Russian ruble.'**
  String get bonusPointsGoods;

  /// No description provided for @publishingReview.
  ///
  /// In en, this message translates to:
  /// **' If, after publishing a review, it is determined that the review does not comply with the conditions specified in clause 2.4 of these Rules, Easy Shoppin reserves the right to delete it with a subsequent reduction in the Personal Account Balance of the Buyer who left the review by the amount of previously accrued Bonus Points.'**
  String get publishingReview;

  /// No description provided for @registrationSite.
  ///
  /// In en, this message translates to:
  /// **'3. Registration and authorization on the Trading Platform'**
  String get registrationSite;

  /// No description provided for @onlyRegisteredBuyers.
  ///
  /// In en, this message translates to:
  /// **' Only registered Buyers can place an Order on the Marketplace, and the Buyer has the right to register on the site only 1 (one) time, i.e. can have only one Personal Account. Having two personal accounts with the same registration data is not allowed.'**
  String get onlyRegisteredBuyers;

  /// No description provided for @registeringMarketplace.
  ///
  /// In en, this message translates to:
  /// **' When registering on the Marketplace, as well as during its further use, the Buyer provides Easy Shoppin with his registration data (including personal data): telephone number, delivery address, details of electronic means of payment (number, expiration date, CVV/CVC code). The Buyer has the right, at his discretion, to provide Easy Shoppin with additional registration data (including personal data), namely: full name, gender, date of birth, information about body measurements (clothing size), as well as other information that the Buyer deems it possible to provide.'**
  String get registeringMarketplace;

  /// No description provided for @accessPersonalAccount.
  ///
  /// In en, this message translates to:
  /// **' To gain access to the Personal Account, a buyer who has registered on the Marketplace undergoes individual identification by entering an access code sent by Easy Shoppin to the contact phone number specified in the Personal Account via SMS message or push notification. Individual identification of the Buyer allows you to avoid unauthorized actions by third parties on behalf of the Buyer and provides access to additional services.'**
  String get accessPersonalAccount;

  /// No description provided for @accessCodeBuyer.
  ///
  /// In en, this message translates to:
  /// **' Transfer of the access code by the Buyer to third parties is not permitted. The Buyer is responsible for all possible negative consequences, including material losses, in the event of transferring the access code, Personal Account credentials, as well as providing access to the Personal Account to third parties.'**
  String get accessCodeBuyer;

  /// No description provided for @changingPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **' Changing the phone number in your Personal Account cannot be done for technical reasons.'**
  String get changingPhoneNumber;

  /// No description provided for @lossTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **' The loss of the telephone number for which the Personal Account is registered, as well as its transfer to another person, is the responsibility of the Buyer. The buyer is responsible for all possible negative consequences, including material losses.'**
  String get lossTelephoneNumber;

  /// No description provided for @registeringAccountMarketplace.
  ///
  /// In en, this message translates to:
  /// **' By registering a Personal Account on the Marketplace, as well as entering an access identification code, the Buyer confirms his agreement that:'**
  String get registeringAccountMarketplace;

  /// No description provided for @registrationDataVoluntarily.
  ///
  /// In en, this message translates to:
  /// **' Registration data (including personal data) is provided by him voluntarily. In the case of using data from third parties, the specified data is indicated with the informed and prior and confirmed consent of these persons;'**
  String get registrationDataVoluntarily;

  /// No description provided for @registrationDataElectronically.
  ///
  /// In en, this message translates to:
  /// **' Registration data (including personal data) is transmitted electronically via open communication channels of the Internet, used (processed, collected, systematized, stored and processed in other ways) by Easy Shoppin to implement the purposes specified in these Rules and for the same purposes may be transferred to third parties;'**
  String get registrationDataElectronically;

  /// No description provided for @registrationDataPolicy.
  ///
  /// In en, this message translates to:
  /// **' Registration data (including personal data) may be processed by Easy Shoppin for the purpose of promoting goods and services by making direct contacts with the Buyer using communication channels in accordance with the Policy regarding the processing of personal data;'**
  String get registrationDataPolicy;

  /// No description provided for @registrationDatInternet.
  ///
  /// In en, this message translates to:
  /// **' Registration data (including personal data) is processed by Easy Shoppin for the purpose of sending advertising and information to the Buyer via telecommunication networks, including via the Internet, in accordance with Article 18 of the Federal Law of June 13, 2006 No. 38-FZ “On Advertising”;'**
  String get registrationDatInternet;

  /// No description provided for @registrationDataProtection.
  ///
  /// In en, this message translates to:
  /// **' Registration data (including personal data) specified by the Buyer, for the purpose of additional protection against fraudulent activities, may be transferred to the credit institution that carries out transactions for payment of Orders placed on the Marketplace, as well as to other third parties ensuring the security of Easy Shoppin;'**
  String get registrationDataProtection;

  /// No description provided for @registrationDataEmail.
  ///
  /// In en, this message translates to:
  /// **' The consent given by the Buyer to the processing of his registration data (including personal data) is unlimited and can be revoked by the Buyer or his legal representative by submitting a written application sent to the email address: sales@easyshoppin.ru.'**
  String get registrationDataEmail;

  /// No description provided for @buyerInformed.
  ///
  /// In en, this message translates to:
  /// **' The Buyer is informed and agrees that Easy Shoppin collects, records, systematizes, accumulates, stores, refines (updates, changes), extracts, analyzes and uses, transfers (distributes, provides, access), entrusts processing to third parties, receives from third parties persons, depersonalization, blocking, deletion, destruction of the Buyer’s registration data (including personal data).'**
  String get buyerInformed;

  /// No description provided for @bankCard.
  ///
  /// In en, this message translates to:
  /// **' The buyer is informed and agrees that hiding a bank card in the Personal Account does not mean withdrawing consent to the processing of this part of personal data. Consent to the processing of personal bank card data may be withdrawn by the Buyer by notification sent to the email address: sales@easyshoppin.ru.'**
  String get bankCard;

  /// No description provided for @copyingApp.
  ///
  /// In en, this message translates to:
  /// **' By copying the Easy Shoppin Mobile Application and installing it on his mobile device, the User expresses his full and unconditional agreement with all the terms of this Offer.'**
  String get copyingApp;

  /// No description provided for @correctnessInformation.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin is not responsible for the accuracy and correctness of the information provided by the Buyer during registration, as well as for possible negative consequences caused by the Buyer providing inaccurate or incorrect information about himself.'**
  String get correctnessInformation;

  /// No description provided for @placingOrder.
  ///
  /// In en, this message translates to:
  /// **'4. Placing an order'**
  String get placingOrder;

  /// No description provided for @purchaseTermsRules.
  ///
  /// In en, this message translates to:
  /// **' The purchase and sale agreement is considered concluded under the terms of these Rules and entails legal consequences for the Seller, Easy Shoppin and the Buyer only when ordering the Product and paying for it through the use of the services of the Marketplace, as a result of which information about the order is reflected in the Buyer’s Personal Account.'**
  String get purchaseTermsRules;

  /// No description provided for @concludingAgreements.
  ///
  /// In en, this message translates to:
  /// **' Concluding agreements with any third parties outside of software methods on the website or mobile application of the Trading Platform, as well as paying for an order in a way other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third person, transfer of funds to bank details, payment of bills, invoices, invoice agreements and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin, as for the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.'**
  String get concludingAgreements;

  /// No description provided for @placingOrderPersonalAccount.
  ///
  /// In en, this message translates to:
  /// **' When placing an order using the Personal Account, responsibility for the Order, including possible financial losses, lies with the Buyer - the owner of the Personal Account.'**
  String get placingOrderPersonalAccount;

  /// No description provided for @orderingGoods.
  ///
  /// In en, this message translates to:
  /// **' By ordering Goods on the Marketplace, the Buyer enters into a purchase and sale agreement with the Seller of the Goods, as well as an agreement for the provision of delivery services for Goods with Easy Shoppin. Within the framework of one Order, the Buyer may enter into an agreement for the provision of delivery services for the Goods of several Sellers, with the simultaneous conclusion of several purchase and sale agreements in relation to the Goods selected by the Buyer.'**
  String get orderingGoods;

  /// No description provided for @orderingProduct.
  ///
  /// In en, this message translates to:
  /// **' When ordering a Product, the Seller of which is any seller, with the exception of Easy Shoppin, the Buyer, within the framework of the purchase and sale agreement, enters into a contractual relationship directly with the Seller selling this Product.'**
  String get orderingProduct;

  /// No description provided for @clickingButtonPlacePay.
  ///
  /// In en, this message translates to:
  /// **' By clicking the “place”/“pay” button (or another button that confirms the Buyer’s will to complete the Order and transfer payment for it), the Buyer confirms familiarization with these Rules and full agreement with all the terms of these Rules: including the conditions for the processing of personal data , payment for goods, conditions and procedure for delivery of the Goods both to the Buyer and from the Buyer, conditions for returning goods and filing claims.'**
  String get clickingButtonPlacePay;

  /// No description provided for @informationProductCard.
  ///
  /// In en, this message translates to:
  /// **' The information presented in the Product Card cannot fully convey all the characteristics of the product (including color, shape, availability and description of some functions). To obtain complete information, the Buyer must contact the Seller. The Buyer’s placing an Order without such a request is a confirmation that the information about the Product was complete, understandable and sufficient for placing the Order.'**
  String get informationProductCard;

  /// No description provided for @placingOrderBuyer.
  ///
  /// In en, this message translates to:
  /// **' By placing an Order, the Buyer agrees that Easy Shoppin may entrust the execution of the contract to a third party, remaining responsible for its execution to the Buyer.'**
  String get placingOrderBuyer;

  /// No description provided for @placingOrderMarketplace.
  ///
  /// In en, this message translates to:
  /// **' By placing an order on the Marketplace, the Buyer agrees to receive:'**
  String get placingOrderMarketplace;

  /// No description provided for @emailsPushNotifications.
  ///
  /// In en, this message translates to:
  /// **' Emails/push notifications that Easy Shoppin may send to the Buyer;'**
  String get emailsPushNotifications;

  /// No description provided for @messagesSMS.
  ///
  /// In en, this message translates to:
  /// **' Messages (SMS) to the phone number specified by the Buyer;'**
  String get messagesSMS;

  /// No description provided for @callTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **' A call with an offer to evaluate the quality of the Trading Platform to the telephone number specified by the Buyer.'**
  String get callTelephoneNumber;

  /// No description provided for @buyerPersonalAccount.
  ///
  /// In en, this message translates to:
  /// **'The Buyer has the right to refuse these methods of interaction by disabling them in the Personal Account.'**
  String get buyerPersonalAccount;

  /// No description provided for @orderCountryEAEU.
  ///
  /// In en, this message translates to:
  /// **' By placing an Order in a country that is a member of the Eurasian Economic Union (hereinafter referred to as the “EAEU”), in relation to Goods that are delivered from a country that is not a member of the EAEU and is subject to customs clearance when imported into the EAEU, the Buyer confirms that he is duly informed and agrees with the following:'**
  String get orderCountryEAEU;

  /// No description provided for @importEAEU.
  ///
  /// In en, this message translates to:
  /// **' The norm for duty-free import of Goods into the territory of the EAEU is determined by the regulations of the EAEU (as of February 1, 2024, it was 1000 Euros).'**
  String get importEAEU;

  /// No description provided for @obligationDuties.
  ///
  /// In en, this message translates to:
  /// **' If the cost of the Goods exceeds the duty-free import rate, the obligation to pay customs duties lies with the Buyer; Easy Shoppin is not responsible for customs duties.'**
  String get obligationDuties;

  /// No description provided for @customsClearanceGoods.
  ///
  /// In en, this message translates to:
  /// **' For customs clearance of the Goods, the Buyer may be required to provide additional data, including personal data, to the customs representative.'**
  String get customsClearanceGoods;

  /// No description provided for @availableCustomsRepresentatives.
  ///
  /// In en, this message translates to:
  /// **' The list of available customs representatives is determined by Easy Shoppin at its discretion. The buyer enters into an agreement with such a customs representative in the manner specified in these Rules.'**
  String get availableCustomsRepresentatives;

  /// No description provided for @returnGoodsCarried.
  ///
  /// In en, this message translates to:
  /// **' Return of goods is carried out in accordance with Section 7 of the Rules.'**
  String get returnGoodsCarried;

  /// No description provided for @orderGoodsUnitrade.
  ///
  /// In en, this message translates to:
  /// **' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of services to him by a customs representative of Unitrade JSC, published at http://sms.unitrade.su/, and also gives your consent to the transfer and processing of your personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of your orders.'**
  String get orderGoodsUnitrade;

  /// No description provided for @orderGoodsTANAIS.
  ///
  /// In en, this message translates to:
  /// **' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of TANAIS JSC (121596, Moscow, internal ter.g. municipal district Mozhaisky, st. . Gorbunova, 2, building 3, floor/room 6/II, room 36, INN: 7730642532, OGRN: 1117746295314), published at https://tanais.express/pages/offerta/ also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of his orders.'**
  String get orderGoodsTANAIS;

  /// No description provided for @orderGoodsJSC.
  ///
  /// In en, this message translates to:
  /// **' By paying for the Goods sent by international mail, the Buyer enters into an Offer Agreement with Russian Post JSC (you can also read the text of the Offer Agreement at https://customs.pochta.ru/oferta), which is an authorized operator for the purposes of declaring goods sent in international mail and paying customs duties in relation to such goods. Easy Shoppin does not bear any responsibility for the Buyer’s fulfillment of obligations to pay customs duties and declare goods, as well as for the fulfillment by the authorized operator (as indicated above) of its obligations to the Buyer in accordance with the Offer Agreement. In accordance with these provisions, the Buyer grants Easy Shoppin the right to transfer to the authorized operator information about the number and date of the Order, as well as the amount of payments payable in accordance with the requirements of the legislation of Russia and the Eurasian Economic Union in connection with the declaration of goods and payment of customs duties. Easy Shoppin is not responsible for the processing of the Buyer\'s payment, as well as the processing of data provided by the Buyer to the authorized operator and does not participate in these operations in any way.'**
  String get orderGoodsJSC;

  /// No description provided for @orderGoodsGBSBroker.
  ///
  /// In en, this message translates to:
  /// **' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of GBS-broker LLC (105066, Moscow, Olkhovskaya St., 16, building 5- 5A, basement room 1 room 15, TIN: 9701083788, OGRN: 1177746840787), published at https://www.gbs-broker.ru/docs/customs_repr_03032023.docx, and also gives his consent to the transfer and processing of his personal data partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.'**
  String get orderGoodsGBSBroker;

  /// No description provided for @orderGoodsLOGISTIC.
  ///
  /// In en, this message translates to:
  /// **' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of SEL LOGISTIC LLC (690025, Vladivostok, Fanzavod St., 1, building 2, premises 1, INN: 2725106960, OGRN: 1112722010026), published at https://cellog.ru/oferta, and also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.'**
  String get orderGoodsLOGISTIC;

  /// No description provided for @paymentOrder.
  ///
  /// In en, this message translates to:
  /// **'5. Payment for the order'**
  String get paymentOrder;

  /// No description provided for @returnGoodsCarriedAccordance.
  ///
  /// In en, this message translates to:
  /// **' The price of the goods is indicated in the Product Card in rubles of the Russian Federation and includes value added tax.'**
  String get returnGoodsCarriedAccordance;

  /// No description provided for @priceGoodsIndicated.
  ///
  /// In en, this message translates to:
  /// **' Prices for the Products are determined by the Sellers and are indicated in the Product Card. The cost of delivery services is determined by Easy Shoppin unilaterally and indisputably and is indicated on the Marketplace. Payment for the Order means the Buyer’s agreement with the price of the Product and the cost of delivery.'**
  String get priceGoodsIndicated;

  /// No description provided for @pricesProductsDetermined.
  ///
  /// In en, this message translates to:
  /// **' The final Price of the Product is determined by the sequential effect of discounts on the Price of the Product in the following order:'**
  String get pricesProductsDetermined;

  /// No description provided for @finalPriceProduct.
  ///
  /// In en, this message translates to:
  /// **' Promotional discount;'**
  String get finalPriceProduct;

  /// No description provided for @promotionalDiscountPayment.
  ///
  /// In en, this message translates to:
  /// **' Discount using Promo Code;'**
  String get promotionalDiscountPayment;

  /// No description provided for @discountPromoCode.
  ///
  /// In en, this message translates to:
  /// **' ES Discount.'**
  String get discountPromoCode;

  /// No description provided for @esDiscountPayment.
  ///
  /// In en, this message translates to:
  /// **' You can take advantage of the ES Discount only by placing orders in your Personal Account and logging into the Marketplace using your credentials. ES The discount is tied to your Personal Account and is calculated based on purchases made through it. In case of re-registration on the site, purchase history and ES Discount are not transferred from the old Personal Account to the new Personal Account. Order statistics in the new Personal Account are kept from scratch.'**
  String get esDiscountPayment;

  /// No description provided for @onlyPlacingOrders.
  ///
  /// In en, this message translates to:
  /// **' Payment for an order in a manner other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third party, transfer of funds to bank details, payment of bills, invoices, contracts - invoices and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin as the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.'**
  String get onlyPlacingOrders;

  /// No description provided for @paymentOrderManner.
  ///
  /// In en, this message translates to:
  /// **' The Buyer may have access to advance payment for the Order, as well as payment for the Order upon receipt. The choice of payment method belongs to the Buyer. Easy Shoppin may unilaterally limit the choice of payment method by establishing prepayment for the Order.'**
  String get paymentOrderManner;

  /// No description provided for @accessAdvancePayment.
  ///
  /// In en, this message translates to:
  /// **' The trading platform does not use cash payments in its activities.'**
  String get accessAdvancePayment;

  /// No description provided for @buyersPreviouslyPurchased.
  ///
  /// In en, this message translates to:
  /// **' Buyers who previously purchased goods in cash and who have returned or intend to return the goods on legal grounds have the right to demand a refund to the account specified by the Buyer with a credit institution.'**
  String get buyersPreviouslyPurchased;

  /// No description provided for @tradingPlatformPayments.
  ///
  /// In en, this message translates to:
  /// **' The Buyer placing an Order on the Marketplace is given the opportunity to choose a payment option in accordance with the methods provided by the Marketplace:'**
  String get tradingPlatformPayments;

  /// No description provided for @paymentUsingBankCard.
  ///
  /// In en, this message translates to:
  /// **' Payment using a bank card;'**
  String get paymentUsingBankCard;

  /// No description provided for @personalAccountBalance.
  ///
  /// In en, this message translates to:
  /// **' Payment from the Personal Account Balance;'**
  String get personalAccountBalance;

  /// No description provided for @paymentInstallments.
  ///
  /// In en, this message translates to:
  /// **' Payment by installments;'**
  String get paymentInstallments;

  /// No description provided for @fastPaymentSystem.
  ///
  /// In en, this message translates to:
  /// **' Payment through the Fast Payment System (FPS);'**
  String get fastPaymentSystem;

  /// No description provided for @creditPaymentInstallments.
  ///
  /// In en, this message translates to:
  /// **' Payment using credit funds. Payment in installments;'**
  String get creditPaymentInstallments;

  /// No description provided for @paymentElectronicWallet.
  ///
  /// In en, this message translates to:
  /// **' Payment using ES Electronic Wallet;'**
  String get paymentElectronicWallet;

  /// No description provided for @otherPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **' Other payment methods introduced into the Marketplace.'**
  String get otherPaymentMethods;

  /// No description provided for @paymentUponReceipt.
  ///
  /// In en, this message translates to:
  /// **' Payment upon receipt using a bank card'**
  String get paymentUponReceipt;

  /// No description provided for @paymentMethodUpon.
  ///
  /// In en, this message translates to:
  /// **' When choosing a payment method upon receipt using a bank card or other available services that allow payment for orders placed on the Marketplace using the specified method, the Buyer sends Easy Shoppin an order to make a payment from the account, providing consent to the processing of payment personal data.'**
  String get paymentMethodUpon;

  /// No description provided for @absenceDebitingFunds.
  ///
  /// In en, this message translates to:
  /// **' In the absence of debiting funds from the Buyer\'s account in favor of the Trading Platform in the amount of the cost of the order or part thereof, or cancellation of payment due to a technical failure and (or) other unforeseen error, the Buyer agrees that Easy Shoppin, on the basis of the previously given order of the Buyer in order to ensure the execution of the purchase and sale agreement and to prevent the formation of debt, it has the right, based on available payment personal data, consent to the processing of which has not been revoked, to initiate actions aimed at the Buyer fulfilling payment for the order without additional notice.'**
  String get absenceDebitingFunds;

  /// No description provided for @buyerUnderstandsAbove.
  ///
  /// In en, this message translates to:
  /// **' The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.'**
  String get buyerUnderstandsAbove;

  /// No description provided for @endingOrderAgreeing.
  ///
  /// In en, this message translates to:
  /// **' The buyer, sending an order and agreeing to write off funds, incl. debt incurred by the Owner of the Trading Platform, understands and agrees that the processing of personal data hidden by him (data on means of payment) by the Owner of the Trading Platform continues for the purposes reflected in these Rules and provided for by the current legislation on the protection of personal data. Hiding a bank card from your Personal Account in accordance with clause 3.9 of the Rules does not constitute a withdrawal of consent to the processing of such personal data.'**
  String get endingOrderAgreeing;

  /// No description provided for @paymentPersonalAccountBalance.
  ///
  /// In en, this message translates to:
  /// **' Payment from Personal Account Balance'**
  String get paymentPersonalAccountBalance;

  /// No description provided for @orderPersonalAccountBalance.
  ///
  /// In en, this message translates to:
  /// **' When choosing to pay for the Order from the Personal Account Balance, the price of the Product and the cost of the delivery service are debited from the Personal Account Balance. If Advances and Return Payments are simultaneously taken into account in the Personal Account Balance, when paying for goods, the amounts of Return Payments are taken into account first.'**
  String get orderPersonalAccountBalance;

  /// No description provided for @insufficientFundsReflected.
  ///
  /// In en, this message translates to:
  /// **' If there are insufficient funds reflected in the Personal Account Balance, the unpaid balance of the price of the Product and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.'**
  String get insufficientFundsReflected;

  /// No description provided for @paymentByInstallments.
  ///
  /// In en, this message translates to:
  /// **' Payment by installments'**
  String get paymentByInstallments;

  /// No description provided for @paymentMethodInstallments.
  ///
  /// In en, this message translates to:
  /// **' When choosing the payment method in installments, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for goods and (or) services occurs on the terms of this organization.'**
  String get paymentMethodInstallments;

  /// No description provided for @choosingInstallmentPayment.
  ///
  /// In en, this message translates to:
  /// **' When choosing an installment payment method on the Marketplace website, the Buyer is given a discount on the product, which is equal to the cost of services of a banking or financial organization in connection with the purchase of the product in installments, and covers the cost of these services. Thus, the amount payable to such organization does not exceed the original cost of the goods, provided that additional services of such organization are not purchased.'**
  String get choosingInstallmentPayment;

  /// No description provided for @buyerAssumesObligations.
  ///
  /// In en, this message translates to:
  /// **' The Buyer assumes all obligations and risks associated with concluding an agreement to provide installment plans and/or credit funds to pay for goods and (or) services on the Marketplace. Neither the Owner of the Marketplace nor any other Seller takes part in the consideration by a banking or financial institution of the possibility of providing installment plans and/or credit funds to the Buyer and are not responsible in case of refusal to the Buyer in such payment, and are not responsible for the actions of the Buyer regarding transactions and acquisitions other services provided by a banking or financial organization to which they are not a party.'**
  String get buyerAssumesObligations;

  /// No description provided for @paymentUsingCreditFunds.
  ///
  /// In en, this message translates to:
  /// **' Payment using credit funds. Payment in installments'**
  String get paymentUsingCreditFunds;

  /// No description provided for @paymentInInstallments.
  ///
  /// In en, this message translates to:
  /// **' Payment in installments from Easy Shoppin.'**
  String get paymentInInstallments;

  /// No description provided for @paymentMethodGoods.
  ///
  /// In en, this message translates to:
  /// **'When choosing the “Payment in installments” payment method for Goods on the Trading Platform website, the Buyer agrees to the terms of the contract set forth in the Agreement on concluding contracts with the payment term “Payment in installments,” which are an integral part of these Rules. When choosing the “Payment in installments” payment method for the Goods, the terms of the Agreement on concluding contracts with the payment term “Payment in installments” regarding payment for the Order and refund of funds for the Goods have priority.'**
  String get paymentMethodGoods;

  /// No description provided for @paymentInstallmentsPartners.
  ///
  /// In en, this message translates to:
  /// **' Payment in installments from Easy Shoppin partners'**
  String get paymentInstallmentsPartners;

  /// No description provided for @buyerChoosesPayment.
  ///
  /// In en, this message translates to:
  /// **'When the Buyer chooses a payment method in installments from Easy Shoppin partners, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for Goods and (or) services occurs on the terms of this organization.'**
  String get buyerChoosesPayment;

  /// No description provided for @buyerAssumesObligationsRisks.
  ///
  /// In en, this message translates to:
  /// **'The Buyer assumes all obligations and risks associated with concluding an agreement with a banking or financial organization for payment for Goods and/or services on the Marketplace. Neither Easy Shoppin nor any other Seller takes part in the consideration by a banking or financial organization of the possibility of providing funds to the Buyer and are not responsible in the event of the Buyer’s refusal to make such payment, and are also not responsible for the Buyer’s actions in transactions and the purchase of other services of the banking or financial organization, which they are not a party to.'**
  String get buyerAssumesObligationsRisks;

  /// No description provided for @paymentUsingElectronicWallet.
  ///
  /// In en, this message translates to:
  /// **' Payment using ES Electronic Wallet'**
  String get paymentUsingElectronicWallet;

  /// No description provided for @orderUsingElectronicWallet.
  ///
  /// In en, this message translates to:
  /// **'When choosing to pay for the Order using the ES Electronic Wallet, the cost of the Product and the cost of the delivery service are debited from the ES Electronic Wallet. If there are insufficient funds on the balance of the ES Electronic Wallet, the unpaid balance of the cost of the Order and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.'**
  String get orderUsingElectronicWallet;

  /// No description provided for @orderingServices.
  ///
  /// In en, this message translates to:
  /// **' By purchasing a product or ordering services on the Marketplace, the Buyer provides Easy Shoppin with consent to write off funds using the bank card details provided by the Buyer when placing an order for the product or the details of which are specified by the Buyer in the Personal Account (hereinafter referred to as Payment Data), consent to the processing of which has not been revoked in accordance with the established procedure, in the manner and cases provided for in this paragraph.'**
  String get orderingServices;

  /// No description provided for @reasonFundsGoods.
  ///
  /// In en, this message translates to:
  /// **' If for some reason the funds for goods or services were not written off immediately after placing the Order (receipt of the Order), Easy Shoppin has the right, on its own initiative, to write off funds for all submitted Payment Data in accordance with the rules of payment systems, including VISA, MasterCard, MIR, Fast Payment System, and on the following conditions:'**
  String get reasonFundsGoods;

  /// No description provided for @reasonFundsGoods1.
  ///
  /// In en, this message translates to:
  /// **' the write-off amount is the unpaid cost of goods or services, which the Buyer was familiar with at the time of placing the order or before that moment;'**
  String get reasonFundsGoods1;

  /// No description provided for @reasonFundsGoods2.
  ///
  /// In en, this message translates to:
  /// **' write-off is made in Russian Rubles, unless another currency was agreed upon by the parties when placing the order;'**
  String get reasonFundsGoods2;

  /// No description provided for @reasonFundsGoods3.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin does not charge the Buyer a commission or other fee for such write-offs;'**
  String get reasonFundsGoods3;

  /// No description provided for @reasonFundsGoods4.
  ///
  /// In en, this message translates to:
  /// **' Cancellation of transactions and refund of funds are carried out according to the rules of the payment system, in accordance with which the debit is carried out.'**
  String get reasonFundsGoods4;

  /// No description provided for @paragraphRevoked.
  ///
  /// In en, this message translates to:
  /// **' The consent given in accordance with this paragraph may be revoked by the Buyer by deleting the Payment Data from the Personal Account.'**
  String get paragraphRevoked;

  /// No description provided for @uponReceiptOrder.
  ///
  /// In en, this message translates to:
  /// **' Upon receipt of an Order with the selected payment method upon receipt, payment for the cost of the Order can be received by Easy Shoppin in any method available for selection when placing an order, regardless of the payment method for the Order selected by the Buyer. The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.'**
  String get uponReceiptOrder;

  /// No description provided for @purchaseSaleAgreement.
  ///
  /// In en, this message translates to:
  /// **' If the purchase and sale agreement for a Product presented on the Marketplace is concluded not with Easy Shoppin, but with another Seller who has placed an offer for the Product on the Marketplace, payment is made to the account of Easy Shoppin, acting on behalf of the relevant Seller in terms of accepting funds in payment account for Goods with the involvement of an authorized payment acceptance operator or electronic money operator and is the recipient of the payment as a representative of the Seller.'**
  String get purchaseSaleAgreement;

  /// No description provided for @accordanceTermsRules.
  ///
  /// In en, this message translates to:
  /// **' In accordance with the terms of these Rules, a cash receipt in electronic form is provided by telephone number by displaying information in the form of a message in the Personal Account. The cash receipt in electronic form is sent to the “Electronic Receipts” section of your Personal Account. The buyer can provide an email address in the “Profile” section and independently send a cash receipt to the email address in the “Electronic Receipts” section.'**
  String get accordanceTermsRules;

  /// No description provided for @buyerInitiateTransfer.
  ///
  /// In en, this message translates to:
  /// **' The Buyer has the right at any time to initiate the transfer of funds recorded and displayed on the Personal Account Balance to an account with a credit institution in full or in part, with the exception of Bonus Points accrued in accordance with clause 2.10 of these Rules. Easy Shoppin transfers the funds accounted for and displayed on the Balance within 10 days from the date of receipt of the Buyer’s order. The Buyer’s order is sent using the “Withdrawal of Funds” functionality in the “Balance and Transaction History” section of the Personal Account.'**
  String get buyerInitiateTransfer;

  /// No description provided for @buyerAcknowledges.
  ///
  /// In en, this message translates to:
  /// **' The Buyer acknowledges that payment methods, as a result of which Easy Shoppin does not receive information from which account the payment was made by the Buyer, include payment for the Goods using the Faster Payment System (FPS).'**
  String get buyerAcknowledges;

  /// No description provided for @userData.
  ///
  /// In en, this message translates to:
  /// **'6. User data'**
  String get userData;

  /// No description provided for @processingUserData.
  ///
  /// In en, this message translates to:
  /// **' User data is processed in accordance with the Data Processing Policy, which contains detailed information about such processing.'**
  String get processingUserData;

  /// No description provided for @userDataProcessedMarketplace.
  ///
  /// In en, this message translates to:
  /// **' User data is processed on the Marketplace in accordance with the Offer in cases where it is necessary to provide the functionality of the Marketplace, including registration and authorization in the Personal Account and other services; to Order a Product, select a delivery method, pay for the Products, refuse the Product; for customs clearance when delivering Products from abroad; for proper operation, ease of use, personalization and improvement of the Marketplace.'**
  String get userDataProcessedMarketplace;

  /// No description provided for @userRightProvideUserData.
  ///
  /// In en, this message translates to:
  /// **' The User has the right to provide and delete some User data at his own discretion, in particular: nickname (name), last name, patronymic, gender, email address. The User understands and agrees that this data will be displayed and available in the Personal Account.'**
  String get userRightProvideUserData;

  /// No description provided for @dataProvidedUserReliable.
  ///
  /// In en, this message translates to:
  /// **' The data provided by the User must be reliable, up-to-date and must not violate the law or the rights of third parties. The User is responsible for ensuring that the User data meets the requirements specified in the Offer and is obliged to update the User data in the Personal Account as necessary.'**
  String get dataProvidedUserReliable;

  /// No description provided for @userAccessManageMarketingMessages.
  ///
  /// In en, this message translates to:
  /// **' The User has access to manage marketing messages, as well as messages for the purpose of fulfilling the Order in the Personal Account.'**
  String get userAccessManageMarketingMessages;

  /// No description provided for @userUnderstandsAgrees.
  ///
  /// In en, this message translates to:
  /// **' The User understands and agrees that when calling Easy Shoppin, telephone conversations may be recorded for the purpose of monitoring the quality of the support service and resolving disputes.'**
  String get userUnderstandsAgrees;

  /// No description provided for @purposeCombatingFraud.
  ///
  /// In en, this message translates to:
  /// **' In order to combat fraud, including ensuring increased security of bank card details, other payment information, the Order payment process, as well as in order to verify the reliability of the User, including when concluding an Offer, a contract for the sale and purchase of Goods and a contract for the provision of Goods delivery services, during their execution, Easy Shoppin may verify the data provided by the User, data on the use of the Trading Platform, according to open and other legally available sources, as well as with the involvement of third parties, including credit institutions - issuers of bank cards used for payment. For the purpose of additional protection against fraudulent activities, the data of Users who have expressed their intention to apply for a credit product may be transferred to a credit institution that carries out transactions for payment of Orders placed using credit funds on the Trading Platform, as well as to other third parties that ensure the security of Easy Shoppin'**
  String get purposeCombatingFraud;

  /// No description provided for @stopProcessingUserData.
  ///
  /// In en, this message translates to:
  /// **' o stop processing all User data, it is necessary to delete the Personal Account, since without such data it is impossible to properly use the relevant functionality. The User independently deletes the Personal Account using the functionality of the Trading Platform. Deletion of the Personal Account may be unavailable if the User has active deliveries, a positive or negative Balance, debts on the Trading Platform, an open Electronic ES Wallet, as well as if Easy Shoppin suspects a violation of the terms of the Offer, including suspicions of fraudulent and other illegal actions on the Trading Platform. The User has the functionality to hide the bank card details in the Personal Account. The hidden bank card details will not be used to pay for Orders placed 30 calendar days after hiding, provided that the User has no obligations to Easy Shoppin or Sellers, and also if Easy Shoppin does not suspect a violation of the Offer terms, including suspicions of fraudulent or other illegal actions on the Trading Platform.'**
  String get stopProcessingUserData;

  /// No description provided for @tradingRecommendationTechnologies.
  ///
  /// In en, this message translates to:
  /// **' Easy Shoppin uses recommendation technologies in accordance with the Rules for the Application of Recommendation Technologies. Recommendation technologies can also be used to personalize the information available on the Trading Platform by grouping users into different categories, including on the basis of the offer of gender, age and specified location.'**
  String get tradingRecommendationTechnologies;

  /// No description provided for @sellerInformation.
  ///
  /// In en, this message translates to:
  /// **'7. Information about the seller'**
  String get sellerInformation;

  /// No description provided for @placedProductCard.
  ///
  /// In en, this message translates to:
  /// **' Information about the Seller of the Product is placed in the Product Card on the Trading Platform. This information is provided directly by the Seller of the Product, published by Easy Shoppin without changing its content and meaning.'**
  String get placedProductCard;

  /// No description provided for @productCardOfferedSaleForeignSeller.
  ///
  /// In en, this message translates to:
  /// **' The product card offered for sale by a foreign Seller may not contain information about the identification number due to the difference in formats and the absence of such numbers in a foreign jurisdiction. If necessary, information allowing to identify such a Seller will be provided at the request of the Consumer by the Seller himself or Easy Shoppin (if Easy Shoppin has such information).'**
  String get productCardOfferedSaleForeignSeller;

  /// No description provided for @orderDelivery.
  ///
  /// In en, this message translates to:
  /// **'8. Order delivery'**
  String get orderDelivery;

  /// No description provided for @transferOwnership.
  ///
  /// In en, this message translates to:
  /// **' Transfer of ownership of the Product The ownership of the ordered Products passes to the Consumer from the moment of actual transfer of the Product to him. The risk of accidental loss of or damage to the Product passes to the Consumer from the moment of actual transfer of the Product to him.'**
  String get transferOwnership;

  /// No description provided for @deliveryTimeProduct.
  ///
  /// In en, this message translates to:
  /// **' Delivery time The Product is delivered to the Consumer on the terms set out in the Offer within the time period automatically determined by the Trading Platform system when placing the Order. Information about the delay in the delivery of the Product is displayed in the \'Deliveries\' section in the Personal Account Consumer.'**
  String get deliveryTimeProduct;

  /// No description provided for @cancelOrderConsumer.
  ///
  /// In en, this message translates to:
  /// **' Cancellation of an Order If the Consumer, after the delivery of the Goods to the place specified by him, does not pick up the Order within the storage period specified in the Personal Account, Easy Shoppin has the right to cancel the Order without additional notification of the Consumer. When choosing the method of prepayment for the Goods, the funds are returned to the Consumer within the period established by the current legislation, with the exception of Easy Shoppin\'s expenses for the return transportation of the returned Goods from the cancelled Order from the Consumer. The amount of Easy Shoppin\'s expenses for the return transportation of the Goods of the cancelled Order is determined in advance, about which the Consumer is notified in the Personal Account when placing the Order. By confirming the Order, the Consumer agrees to these terms.'**
  String get cancelOrderConsumer;

  /// No description provided for @refusalCarryDelivery.
  ///
  /// In en, this message translates to:
  /// **' Refusal to carry out delivery The delivery of the Goods may be refused in the absence of prepayment for the Goods, when such a form of payment was agreed upon when placing the Order.'**
  String get refusalCarryDelivery;

  /// No description provided for @placeDeliveryGoods.
  ///
  /// In en, this message translates to:
  /// **' Place of delivery of the Goods The Goods are delivered to the Consumer to the place specified by the Consumer when placing the Order on the Marketplace. As the place of delivery, the Consumer can specify one of the following addresses: - the address of the Order pick-up point - the address of the parcel terminal - another address, in this case the Goods are delivered \'to the door\'. The User understands and agrees that when choosing a place of delivery of the Goods located in another country, the Marketplace may be provided on terms different from this Offer and by another person, including one affiliated with Easy Shoppin, since this is required to ensure the functioning of the Marketplace in the territory of the relevant country. By changing the address to one located in another country, the User accepts the current version of the agreement corresponding to a specific country, available at any time in the interface of the Trading Platform, and also provides their data on the terms of the specified agreement.'**
  String get placeDeliveryGoods;

  /// No description provided for @deliveryGoodsPickPoint.
  ///
  /// In en, this message translates to:
  /// **' Delivery of Goods to the Pick-up Point Ordered Goods, with the exception of large-sized Goods, are delivered in factory packaging or a transparent bag. All Goods delivered to the Pick-up Point are issued at the same time, regardless of the date of the Order and their shelf life. The Consumer is advised to open the packaging of the Goods and check the Goods for integrity, absence of defects and correct insertion at the time of receipt of the Goods by the Consumer in the presence of an employee of the Pick-up Point, without leaving the customer area and without entering the fitting room. After opening the packaging and checking the Goods in the presence of an employee of the Pick-up Point, the Consumer has the right to try on the Goods without time limitation. The goods received at the Pick-up Point are stored there until a predetermined date specified in the Personal Account. The Consumer is considered to be notified of the storage period of the Goods at the time the specified information is displayed in the Personal Account.'**
  String get deliveryGoodsPickPoint;

  /// No description provided for @deliveryGoodsParcelTerminal.
  ///
  /// In en, this message translates to:
  /// **' Delivery of Goods to the Parcel Terminal Goods, with the exception of large-sized Goods, can be delivered to Parcel Terminals located in Moscow and the Moscow Region. The receipt of the Goods at the Parcel Terminal is displayed in the Consumer\'s Personal Account. The Consumer receives a code in a push notification, which must be entered on the screen of the Parcel Terminal to receive the Goods. The goods received at the Parcel Terminal are stored there until a predetermined date specified in the Personal Account. The Consumer is considered to be notified of the storage period of the Goods at the time the specified information is displayed in the Personal Account. It is possible to arrange delivery of the Goods to Parcel Terminals only upon prepayment for the Goods. The return of the Goods received at the Parcel Terminal is carried out at the pick-up point from which they were delivered to the Parcel Terminal, or through a delivery service employee who can be called using the functionality of the Personal Account.'**
  String get deliveryGoodsParcelTerminal;

  /// No description provided for @deliveryToDoorOrderedGoods.
  ///
  /// In en, this message translates to:
  /// **'Door-to-door delivery Ordered Goods, with the exception of large-sized Goods, are delivered in the original packaging or a transparent bag. When choosing the \'upon receipt\' payment method for the Goods, the Goods are issued to the Consumer by a delivery service employee after full payment for the Goods. The Consumer is advised to open the packaging of the Goods and check the Goods for integrity, absence of defects and correct insertion at the time of receipt of the Goods by the Consumer in the presence of a delivery service employee, with the exception of the delivery of large-sized Goods (clause 8.7 of the Offer). After opening the packaging and checking the Goods in the presence of a delivery service employee, the Consumer has the right to try on the Goods for no more than 20 minutes. The Consumer understands and agrees that his telephone number, as well as comments left on the Order for Goods when choosing the \'door-to-door\' delivery location, may be transferred to the delivery service employee for the purpose of delivering the Goods or to the Seller for the purpose of delivering the Goods if delivery is carried out by the Seller.'**
  String get deliveryToDoorOrderedGoods;

  /// No description provided for @clickDelivery.
  ///
  /// In en, this message translates to:
  /// **' Click-to-Delivery The Consumer can order the Click-to-Delivery Delivery Service for all Products ordered by them and located at the Pick-Up Point, having paid for them in advance, via the Personal Account functionality. The cost of this Delivery Service is specified in the Consumer\'s Personal Account. The Products can be received upon presentation of the passport and the code from the Personal Account to the delivery service employee. The Products can be returned to the Pick-Up Point from which they were delivered by the delivery service employee, or through the delivery service employee, who can be called using the Personal Account functionality. If the Consumer is not present at the address specified when ordering the Click-to-Delivery Delivery Service, the delivery service employee returns the Products to the Pick-Up Point, where they will be stored for delivery to the Consumer (the storage period is reflected in the Personal Account). In this case, the cost of the Delivery Service is not refunded to the Consumer. The Consumer understands and agrees that their phone number, as well as comments left on the Order for the Goods when choosing the delivery location for \'Click to deliver\', may be transferred to the delivery service employee for the purpose of delivering the Goods.'**
  String get clickDelivery;

  /// No description provided for @receivingOrder.
  ///
  /// In en, this message translates to:
  /// **' Receiving an Order To issue an Order, the pick-up point employee or the delivery service employee requests from the Consumer a code for receiving the Order, reflected in the Consumer\'s Personal Account or a QR code from the Consumer\'s mobile application. If the Consumer fails to present the specified code or QR code, the Consumer will be denied the delivery of the Goods.'**
  String get receivingOrder;

  /// No description provided for @deliveryLargeSizedGoods.
  ///
  /// In en, this message translates to:
  /// **' Delivery of large-sized Goods Delivery of large-sized Goods is carried out under general conditions, with the exception of special conditions specified in this clause of the Offer. Delivery of large-sized Goods is carried out by an engaged third party, who is not the Seller of the Goods or Easy Shoppin, and therefore, when large-sized Goods are delivered \'to the door\', the Consumer inspects only the external condition of the consumer packaging of the Goods. Inspection of large-sized Goods in the presence of a delivery service employee upon receipt is not available and is carried out by the Consumer independently after payment and receipt of the Goods.'**
  String get deliveryLargeSizedGoods;

  /// No description provided for @deliveryElectronicDevices.
  ///
  /// In en, this message translates to:
  /// **' Delivery of electronic devices, devices and other technically complex goods Electronic devices, devices and other technically complex goods are delivered either in factory packaging or in special packaging. The Consumer is advised to inspect such Goods without damaging the packaging in the presence of an employee of the Order Pick-up Point or an employee of the delivery service. When ordering electronic devices, devices and other technically complex Goods with payment for the cost of the goods upon receipt, the Consumer, before receiving from an employee of the Order Pick-up Point or an employee of the delivery service, agrees to write off the cost of electronic devices, devices and other technically complex goods. In case of successful write-off of the cost of electronic devices, instruments and other technically complex goods, the employee of the Pick-up Point or the employee of the delivery service transfers the goods to the Consumer.'**
  String get deliveryElectronicDevices;

  /// No description provided for @deliveryOrderedVehicles.
  ///
  /// In en, this message translates to:
  /// **' Delivery of ordered vehicles'**
  String get deliveryOrderedVehicles;

  /// No description provided for @purchasingVehicle.
  ///
  /// In en, this message translates to:
  /// **' When purchasing a Vehicle, the Consumer enters into contractual relations directly with the Seller selling this Product. Easy Shoppin acts as the Seller\'s agent, acting on behalf of and on behalf of the Seller, while the rights and obligations under the purchase and sale agreement arise exclusively for the Seller.'**
  String get purchasingVehicle;

  /// No description provided for @consumerUnderstandsAgrees.
  ///
  /// In en, this message translates to:
  /// **' The Consumer understands and agrees that in the event of placing an Order for the purchase of a Vehicle, it is necessary to process his personal data, including his full name, telephone number, and to transfer the telephone number to the Seller of the Vehicle for further interaction between the Seller and the Consumer to agree on the terms and place of delivery of the Vehicle, to conclude a sales contract between them and to prepare a package of documents for the delivery of the Vehicle to the Consumer.'**
  String get consumerUnderstandsAgrees;

  /// No description provided for @purchaseOrderVehicle.
  ///
  /// In en, this message translates to:
  /// **' An order for the purchase of a Vehicle is placed only after full prepayment of the cost of the Vehicle on the Trading Platform.'**
  String get purchaseOrderVehicle;

  /// No description provided for @afterPlacingOrder.
  ///
  /// In en, this message translates to:
  /// **' Within 24 hours after placing an Order for the purchase of a Vehicle and making an advance payment, the Seller contacts the Consumer to confirm the Order and agree on the terms of the sales contract, including the terms and place of delivery of the Vehicle.'**
  String get afterPlacingOrder;

  /// No description provided for @saleVehiclesWarehouse.
  ///
  /// In en, this message translates to:
  /// **' Vehicles are sold exclusively from the warehouse Seller.'**
  String get saleVehiclesWarehouse;

  /// No description provided for @consumerRightInspect.
  ///
  /// In en, this message translates to:
  /// **' The Consumer has the right to inspect the Vehicle before concluding the purchase and sale agreement. If the Consumer is not satisfied with the Vehicle, he/she has the right to refuse to sign the purchase and sale agreement for the Vehicle.'**
  String get consumerRightInspect;

  /// No description provided for @conclusionPurchaseSaleAgreement.
  ///
  /// In en, this message translates to:
  /// **' To conclude the purchase and sale agreement for the Vehicle, Easy Shoppin provides the Consumer with a QR code using the Personal Account functionality.'**
  String get conclusionPurchaseSaleAgreement;

  /// No description provided for @purchaseSaleAgreementVehicle.
  ///
  /// In en, this message translates to:
  /// **' The purchase and sale agreement for the Vehicle is signed between the Seller and the Consumer at the time of transfer of the Vehicle, after the Consumer presents to the Seller a unique code and an identity document of the Consumer. Easy Shoppin is not a party to the purchase and sale agreement for the vehicle. The Consumer independently provides the Seller with the data of the identity document, without the participation of Easy Shoppin and the functionality of the Trading Platform.'**
  String get purchaseSaleAgreementVehicle;

  /// No description provided for @concludedSellerConsumer.
  ///
  /// In en, this message translates to:
  /// **' The contract of sale and purchase of the Vehicle concluded between the Seller and the Consumer must contain the identification number of the Vehicle and other information that allows identifying the Vehicle being sold.'**
  String get concludedSellerConsumer;

  /// No description provided for @sellerCarriesDelivery.
  ///
  /// In en, this message translates to:
  /// **' The Seller delivers and transfers the Vehicle to the Consumer on its own.'**
  String get sellerCarriesDelivery;

  /// No description provided for @packageDocumentsVehicle.
  ///
  /// In en, this message translates to:
  /// **' The package of documents for the Vehicle, including the Vehicle passport and the keys to the Vehicle, are transferred by the Seller to the Consumer after signing the contract of sale and purchase of the Vehicle.'**
  String get packageDocumentsVehicle;

  /// No description provided for @qualityClaims.
  ///
  /// In en, this message translates to:
  /// **' Claims regarding the quality, quantity and other properties of the Vehicles are submitted directly to the Seller of the Goods by any available means of communication at the discretion of the Consumer, unless otherwise agreed upon by the Seller and the Consumer in the contract purchase and sale of the Vehicle, Easy Shoppin is not responsible for the quality of the Vehicle and does not bear liability.'**
  String get qualityClaims;

  /// No description provided for @pickupSellerStore.
  ///
  /// In en, this message translates to:
  /// **' Pickup from the Seller\'s Store The Marketplace does not sell alcoholic beverages, Easy Shoppin does not organize the delivery of alcoholic beverages. In the alcoholic beverages section of the Marketplace, the Consumer can reserve the Product in the Seller\'s Store. Reservation of the Product does not guarantee its availability in the Seller\'s Store. Responsibility for the availability of the Product lies with the Seller. When purchasing a Product in the Seller\'s Store, the Consumer enters into a contractual relationship directly with the Seller selling this Product, while the rights and obligations under the purchase and sale agreement arise exclusively with the Seller. Pickup is carried out from the Seller\'s Store. The time of sale of alcoholic beverages is determined by current legislation, the Consumer is informed of the time of sale of alcoholic beverages when placing an Order. The obligation to comply with the legislation on the circulation of alcoholic beverages lies with the Seller of such Product. When placing an Order, the Consumer is informed about the storage period of the Order in the Seller\'s Store. To receive the Order, the Consumer must name (show) the Seller\'s Store employee the code for receiving the Order, reflected in the Consumer\'s Personal Account. If the Consumer does not present the specified code, the Consumer will be denied the Order. To receive the Order, the Consumer must name (show) the Seller\'s Store employee the code for receiving the Order, reflected in the Consumer\'s Personal Account. The Consumer understands and agrees that when picking up from the Seller\'s Store, the method of contacting him and his name may be provided to the Seller to clarify the status of the reservation of the Product.'**
  String get pickupSellerStore;

  /// No description provided for @cancelReturnOrdersConsumers.
  ///
  /// In en, this message translates to:
  /// **'9. Cancellation and return of orders to consumers'**
  String get cancelReturnOrdersConsumers;

  /// No description provided for @reviewsRatingsProductConsumers.
  ///
  /// In en, this message translates to:
  /// **'10. Reviews and ratings of the Product by Consumers on the Trading Platform'**
  String get reviewsRatingsProductConsumers;

  /// No description provided for @appealsComplaints.
  ///
  /// In en, this message translates to:
  /// **'11. Appeals and complaints'**
  String get appealsComplaints;

  /// No description provided for @caseQuestions.
  ///
  /// In en, this message translates to:
  /// **'In case of any questions, including questions related to the provision of information about the Sellers of the Products, the User has the right to contact Easy Shoppin in any of the following ways: - by e-mail sales@easyshoppin.ru - through the Chat on the Trading Platform - through the \'Appeals\' form in the Personal Account on the Trading Platform - other methods available at the link: https://www.easyshoppin.ru/services/kontakty'**
  String get caseQuestions;

  /// No description provided for @allClaimsGoods.
  ///
  /// In en, this message translates to:
  /// **'All claims regarding products sold by Easy Shoppin must be sent by Consumers through the \'Appeals\' form in the Personal Account on the Trading Platform. In the event of a claim being sent in the \'Appeals\' form, the Consumer agrees to receive a response to such claim in the specified form in the Personal Account. When If a claim arises related to other issues, the Consumer must send it by Russian Post by registered mail with acknowledgment of receipt to the address: 142181 Ulyanovsk Region.'**
  String get allClaimsGoods;

  /// No description provided for @jan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get jan;

  /// No description provided for @feb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get feb;

  /// No description provided for @mar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get mar;

  /// No description provided for @apr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get apr;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @jun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get jun;

  /// No description provided for @jul.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get jul;

  /// No description provided for @aug.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get aug;

  /// No description provided for @sep.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get sep;

  /// No description provided for @oct.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get oct;

  /// No description provided for @nov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get nov;

  /// No description provided for @dec.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get dec;

  /// No description provided for @updatingYourInfo.
  ///
  /// In en, this message translates to:
  /// **'We are updating your information...'**
  String get updatingYourInfo;

  /// No description provided for @dataNotBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'The data has not been changed or one of the fields is not filled in'**
  String get dataNotBeenChanged;

  /// No description provided for @dataNotBeenChangedOption.
  ///
  /// In en, this message translates to:
  /// **'No data was changed or no options were selected.'**
  String get dataNotBeenChangedOption;

  /// No description provided for @congratulation.
  ///
  /// In en, this message translates to:
  /// **'Congratulation'**
  String get congratulation;

  /// No description provided for @usernameBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your Username has been updated'**
  String get usernameBeenUpdated;

  /// No description provided for @nameBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your Name has been updated'**
  String get nameBeenUpdated;

  /// No description provided for @genderBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your gender has been updated'**
  String get genderBeenUpdated;

  /// No description provided for @updatingPassword.
  ///
  /// In en, this message translates to:
  /// **'Updating your password...'**
  String get updatingPassword;

  /// No description provided for @passwordBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your password has been updated'**
  String get passwordBeenUpdated;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordRequired;

  /// No description provided for @passwordCharactersLong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get passwordCharactersLong;

  /// No description provided for @passwordUppercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter.'**
  String get passwordUppercaseLetter;

  /// No description provided for @passwordOneNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number.'**
  String get passwordOneNumber;

  /// No description provided for @passwordSpecialCharacter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character.'**
  String get passwordSpecialCharacter;

  /// No description provided for @passwordConfirmationRequired.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is required.'**
  String get passwordConfirmationRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwordsDoNotMatch;

  /// No description provided for @phoneNumberBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your Phone Number has been updated'**
  String get phoneNumberBeenUpdated;

  /// No description provided for @dateBirthBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your date of birth has been updated'**
  String get dateBirthBeenUpdated;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get women;

  /// No description provided for @shoes.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoes;

  /// No description provided for @kids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kids;

  /// No description provided for @mens.
  ///
  /// In en, this message translates to:
  /// **'Mens'**
  String get mens;

  /// No description provided for @house.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get house;

  /// No description provided for @beauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get beauty;

  /// No description provided for @accessories.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessories;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @toys.
  ///
  /// In en, this message translates to:
  /// **'Toys'**
  String get toys;

  /// No description provided for @furniture.
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furniture;

  /// No description provided for @productsForAdults.
  ///
  /// In en, this message translates to:
  /// **'Products For Adults'**
  String get productsForAdults;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @householdAppliances.
  ///
  /// In en, this message translates to:
  /// **'Household Appliances'**
  String get householdAppliances;

  /// No description provided for @petSupplies.
  ///
  /// In en, this message translates to:
  /// **'Pet Supplies'**
  String get petSupplies;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @automotiveGoods.
  ///
  /// In en, this message translates to:
  /// **'Automotive Goods'**
  String get automotiveGoods;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @jewelery.
  ///
  /// In en, this message translates to:
  /// **'Jewelery'**
  String get jewelery;

  /// No description provided for @forRepair.
  ///
  /// In en, this message translates to:
  /// **'For Repair'**
  String get forRepair;

  /// No description provided for @gardenSummerHouse.
  ///
  /// In en, this message translates to:
  /// **'Garden Summer House'**
  String get gardenSummerHouse;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @stationery.
  ///
  /// In en, this message translates to:
  /// **'Stationery'**
  String get stationery;

  /// No description provided for @blousesShirts.
  ///
  /// In en, this message translates to:
  /// **'Blouses and Shirts'**
  String get blousesShirts;

  /// No description provided for @outerwear.
  ///
  /// In en, this message translates to:
  /// **'Outerwear'**
  String get outerwear;

  /// No description provided for @jumpersTurtlenecksCardigans.
  ///
  /// In en, this message translates to:
  /// **'Jumpers, Turtlenecks and Cardigans'**
  String get jumpersTurtlenecksCardigans;

  /// No description provided for @jeans.
  ///
  /// In en, this message translates to:
  /// **'Jeans'**
  String get jeans;

  /// No description provided for @overalls.
  ///
  /// In en, this message translates to:
  /// **'Overalls'**
  String get overalls;

  /// No description provided for @costumes.
  ///
  /// In en, this message translates to:
  /// **'Costumes'**
  String get costumes;

  /// No description provided for @longsleeves.
  ///
  /// In en, this message translates to:
  /// **'Longsleeves'**
  String get longsleeves;

  /// No description provided for @jacketsVestsBlazers.
  ///
  /// In en, this message translates to:
  /// **'Jackets, Vests and Blazers'**
  String get jacketsVestsBlazers;

  /// No description provided for @dressesSundresses.
  ///
  /// In en, this message translates to:
  /// **'Dresses and Sundresses'**
  String get dressesSundresses;

  /// No description provided for @sweatshirtsSweatshirtsHoodies.
  ///
  /// In en, this message translates to:
  /// **'Sweatshirts, Sweatshirts and Hoodies'**
  String get sweatshirtsSweatshirtsHoodies;

  /// No description provided for @tunics.
  ///
  /// In en, this message translates to:
  /// **'Tunics'**
  String get tunics;

  /// No description provided for @tshirtsTops.
  ///
  /// In en, this message translates to:
  /// **'Tshirts and Tops'**
  String get tshirtsTops;

  /// No description provided for @robes.
  ///
  /// In en, this message translates to:
  /// **'Robes'**
  String get robes;

  /// No description provided for @shorts.
  ///
  /// In en, this message translates to:
  /// **'Shorts'**
  String get shorts;

  /// No description provided for @skirts.
  ///
  /// In en, this message translates to:
  /// **'Skirts'**
  String get skirts;

  /// No description provided for @underwear.
  ///
  /// In en, this message translates to:
  /// **'Underwear'**
  String get underwear;

  /// No description provided for @largeSizes.
  ///
  /// In en, this message translates to:
  /// **'Large Sizes'**
  String get largeSizes;

  /// No description provided for @futureMothers.
  ///
  /// In en, this message translates to:
  /// **'Future Mothers'**
  String get futureMothers;

  /// No description provided for @forTall.
  ///
  /// In en, this message translates to:
  /// **'For Tall'**
  String get forTall;

  /// No description provided for @forShort.
  ///
  /// In en, this message translates to:
  /// **'For Short'**
  String get forShort;

  /// No description provided for @childrens.
  ///
  /// In en, this message translates to:
  /// **'childrens'**
  String get childrens;

  /// No description provided for @forNewborns.
  ///
  /// In en, this message translates to:
  /// **'For Newborns'**
  String get forNewborns;

  /// No description provided for @womens.
  ///
  /// In en, this message translates to:
  /// **'Womens'**
  String get womens;

  /// No description provided for @specialFootwear.
  ///
  /// In en, this message translates to:
  /// **'Special Footwear'**
  String get specialFootwear;

  /// No description provided for @shoeAccessories.
  ///
  /// In en, this message translates to:
  /// **'Shoe Accessories'**
  String get shoeAccessories;

  /// No description provided for @forGirls.
  ///
  /// In en, this message translates to:
  /// **'For Girls'**
  String get forGirls;

  /// No description provided for @forBoys.
  ///
  /// In en, this message translates to:
  /// **'For Boys'**
  String get forBoys;

  /// No description provided for @childrensElectronics.
  ///
  /// In en, this message translates to:
  /// **'Childrens Electronics'**
  String get childrensElectronics;

  /// No description provided for @constructors.
  ///
  /// In en, this message translates to:
  /// **'Constructors'**
  String get constructors;

  /// No description provided for @childrensTransport.
  ///
  /// In en, this message translates to:
  /// **'Childrens Transport'**
  String get childrensTransport;

  /// No description provided for @walksTravels.
  ///
  /// In en, this message translates to:
  /// **'Walks and Travels'**
  String get walksTravels;

  /// No description provided for @babyFood.
  ///
  /// In en, this message translates to:
  /// **'Baby Food'**
  String get babyFood;

  /// No description provided for @childrensRoom.
  ///
  /// In en, this message translates to:
  /// **'Childrens Room'**
  String get childrensRoom;

  /// No description provided for @religiousClothing.
  ///
  /// In en, this message translates to:
  /// **'Religious Clothing'**
  String get religiousClothing;

  /// No description provided for @babyProducts.
  ///
  /// In en, this message translates to:
  /// **'Baby Products'**
  String get babyProducts;

  /// No description provided for @diapers.
  ///
  /// In en, this message translates to:
  /// **'Diapers'**
  String get diapers;

  /// No description provided for @giftsChildren.
  ///
  /// In en, this message translates to:
  /// **'Gifts for Children'**
  String get giftsChildren;

  /// No description provided for @trousers.
  ///
  /// In en, this message translates to:
  /// **'Trousers'**
  String get trousers;

  /// No description provided for @overallsSemioveralls.
  ///
  /// In en, this message translates to:
  /// **'Overalls and Semioveralls'**
  String get overallsSemioveralls;

  /// No description provided for @tshirts.
  ///
  /// In en, this message translates to:
  /// **'T-shirts'**
  String get tshirts;

  /// No description provided for @pajamas.
  ///
  /// In en, this message translates to:
  /// **'Pajamas'**
  String get pajamas;

  /// No description provided for @poloShirts.
  ///
  /// In en, this message translates to:
  /// **'Polo Shirts'**
  String get poloShirts;

  /// No description provided for @beachwear.
  ///
  /// In en, this message translates to:
  /// **'Beachwear'**
  String get beachwear;

  /// No description provided for @sportShoes.
  ///
  /// In en, this message translates to:
  /// **'Sport Shoes'**
  String get sportShoes;

  /// No description provided for @trackSuits.
  ///
  /// In en, this message translates to:
  /// **'Track suits'**
  String get trackSuits;

  /// No description provided for @sportsEquipments.
  ///
  /// In en, this message translates to:
  /// **'Sports Equipments'**
  String get sportsEquipments;

  /// No description provided for @bedroomFurniture.
  ///
  /// In en, this message translates to:
  /// **'Bedroom furniture'**
  String get bedroomFurniture;

  /// No description provided for @kitchenFurniture.
  ///
  /// In en, this message translates to:
  /// **'Kitchen furniture'**
  String get kitchenFurniture;

  /// No description provided for @officeFurniture.
  ///
  /// In en, this message translates to:
  /// **'Office furniture'**
  String get officeFurniture;

  /// No description provided for @laptop.
  ///
  /// In en, this message translates to:
  /// **'Laptop'**
  String get laptop;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @officeEquipment.
  ///
  /// In en, this message translates to:
  /// **'Office Equipment'**
  String get officeEquipment;

  /// No description provided for @shirts.
  ///
  /// In en, this message translates to:
  /// **'Shirts'**
  String get shirts;

  /// No description provided for @peakSales.
  ///
  /// In en, this message translates to:
  /// **'Peak sales'**
  String get peakSales;

  /// No description provided for @hit.
  ///
  /// In en, this message translates to:
  /// **'Hit'**
  String get hit;

  /// No description provided for @burning.
  ///
  /// In en, this message translates to:
  /// **'Burning'**
  String get burning;

  /// No description provided for @clothes.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothes;

  /// No description provided for @smartphones.
  ///
  /// In en, this message translates to:
  /// **'Smartphones'**
  String get smartphones;

  /// No description provided for @lighting.
  ///
  /// In en, this message translates to:
  /// **'Lighting'**
  String get lighting;

  /// No description provided for @fishing.
  ///
  /// In en, this message translates to:
  /// **'Fishing'**
  String get fishing;

  /// No description provided for @smartHouse.
  ///
  /// In en, this message translates to:
  /// **'Smart House'**
  String get smartHouse;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @youMightLike.
  ///
  /// In en, this message translates to:
  /// **'You might like'**
  String get youMightLike;

  /// No description provided for @findStore.
  ///
  /// In en, this message translates to:
  /// **'Find a store'**
  String get findStore;

  /// No description provided for @favoriteStores.
  ///
  /// In en, this message translates to:
  /// **'Favorite Stores'**
  String get favoriteStores;

  /// No description provided for @whatAreWeGoingLookFor.
  ///
  /// In en, this message translates to:
  /// **'What are we going to look for?'**
  String get whatAreWeGoingLookFor;

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search history'**
  String get searchHistory;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @haveGoodDay.
  ///
  /// In en, this message translates to:
  /// **'Have a good day, {userFullName}, '**
  String haveGoodDay(Object userFullName);

  /// No description provided for @forShopping.
  ///
  /// In en, this message translates to:
  /// **'for shopping 🛍️'**
  String get forShopping;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @imageUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your Profile Image has been updated!'**
  String get imageUpdated;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @categoriesUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Categories uploaded successfully'**
  String get categoriesUploadedSuccess;

  /// No description provided for @categoriesAndSubCategoriesUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Categories and subcategories loaded successfully'**
  String get categoriesAndSubCategoriesUploadedSuccess;

  /// No description provided for @failedUploadCategories.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload categories'**
  String get failedUploadCategories;

  /// No description provided for @failedUploadSubCategories.
  ///
  /// In en, this message translates to:
  /// **'Failed to load subcategories'**
  String get failedUploadSubCategories;

  /// No description provided for @brandsUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Brands uploaded successfully'**
  String get brandsUploadedSuccess;

  /// No description provided for @failedUploadBrands.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload brands'**
  String get failedUploadBrands;

  /// No description provided for @productsUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Products uploaded successfully'**
  String get productsUploadedSuccess;

  /// No description provided for @failedUploadProducts.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload products'**
  String get failedUploadProducts;

  /// No description provided for @bannersUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Banners uploaded successfully'**
  String get bannersUploadedSuccess;

  /// No description provided for @failedUploadBanners.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload banners'**
  String get failedUploadBanners;

  /// No description provided for @salesUploadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sales uploaded successfully'**
  String get salesUploadedSuccessfully;

  /// No description provided for @failedUploadSales.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload sales'**
  String get failedUploadSales;

  /// No description provided for @chatsHaveUpdated.
  ///
  /// In en, this message translates to:
  /// **'Chats have been updated - we are reloading your correspondence. Please wait'**
  String get chatsHaveUpdated;

  /// No description provided for @disputesHaveRenewed.
  ///
  /// In en, this message translates to:
  /// **'Disputes have been updated - re-downloading your sports with sellers. Please wait'**
  String get disputesHaveRenewed;

  /// No description provided for @archiveHaveUpdated.
  ///
  /// In en, this message translates to:
  /// **'The archive has been updated - we are re-downloading your correspondence archive. Please wait'**
  String get archiveHaveUpdated;

  /// No description provided for @noOpenDisputes.
  ///
  /// In en, this message translates to:
  /// **'No open disputes'**
  String get noOpenDisputes;

  /// No description provided for @createDisputeGoTo.
  ///
  /// In en, this message translates to:
  /// **'To create a dispute, go to '**
  String get createDisputeGoTo;

  /// No description provided for @chatWithSupport.
  ///
  /// In en, this message translates to:
  /// **'chat with support'**
  String get chatWithSupport;

  /// No description provided for @noChatsArchiveYet.
  ///
  /// In en, this message translates to:
  /// **'There are no chats in the archive yet.'**
  String get noChatsArchiveYet;

  /// No description provided for @addChatArchiveAppear.
  ///
  /// In en, this message translates to:
  /// **'Add the chat to the archive and it will appear here'**
  String get addChatArchiveAppear;

  /// No description provided for @invalidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmailAddress;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordIsRequired;

  /// No description provided for @passwordLeastSixCharactersLong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get passwordLeastSixCharactersLong;

  /// No description provided for @passwordLeastOneUppercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter.'**
  String get passwordLeastOneUppercaseLetter;

  /// No description provided for @passwordLeastOneNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number.'**
  String get passwordLeastOneNumber;

  /// No description provided for @passwordLeastOneSpecialCharacter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character.'**
  String get passwordLeastOneSpecialCharacter;

  /// No description provided for @phoneNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required.'**
  String get phoneNumberIsRequired;

  /// No description provided for @invalidPhoneNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format (10 digits required).'**
  String get invalidPhoneNumberFormat;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
