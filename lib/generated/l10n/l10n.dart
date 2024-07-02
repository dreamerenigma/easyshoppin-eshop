// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose your product`
  String get onBoardingTitle1 {
    return Intl.message(
      'Choose your product',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get onBoardingTitle2 {
    return Intl.message(
      'Select Payment Method',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Deliver at your door step`
  String get onBoardingTitle3 {
    return Intl.message(
      'Deliver at your door step',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to a World of Limitless Choices - Your Perfect Product Awaits!`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get loginTitle {
    return Intl.message(
      'Welcome back',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover Limitless Choices and Unmatched Convenience.`
  String get loginSubTitle {
    return Intl.message(
      'Discover Limitless Choices and Unmatched Convenience.',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let’s create your account`
  String get signupTitle {
    return Intl.message(
      'Let’s create your account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forget password',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get orSignInWith {
    return Intl.message(
      'or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get orSignInPhone {
    return Intl.message(
      'Or',
      name: 'orSignInPhone',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get iAgreeTo {
    return Intl.message(
      'I agree to',
      name: 'iAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyRegister {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyRegister',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `The provided phone number is not valid.`
  String get phoneNumberNotValid {
    return Intl.message(
      'The provided phone number is not valid.',
      name: 'phoneNumberNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `To login or register`
  String get loginRegister {
    return Intl.message(
      'To login or register',
      name: 'loginRegister',
      desc: '',
      args: [],
    );
  }

  /// `000 000-00-00`
  String get phoneNumberDigital {
    return Intl.message(
      '000 000-00-00',
      name: 'phoneNumberDigital',
      desc: '',
      args: [],
    );
  }

  /// `To get the code`
  String get phoneNumberCode {
    return Intl.message(
      'To get the code',
      name: 'phoneNumberCode',
      desc: '',
      args: [],
    );
  }

  /// `Click on the button, I agree to the `
  String get iAgreeButton {
    return Intl.message(
      'Click on the button, I agree to the ',
      name: 'iAgreeButton',
      desc: '',
      args: [],
    );
  }

  /// `terms of use of the trading platform`
  String get termsUsePlatform {
    return Intl.message(
      'terms of use of the trading platform',
      name: 'termsUsePlatform',
      desc: '',
      args: [],
    );
  }

  /// `Select code region`
  String get selectCodeRegion {
    return Intl.message(
      'Select code region',
      name: 'selectCodeRegion',
      desc: '',
      args: [],
    );
  }

  /// `Login to your profile`
  String get signInProfile {
    return Intl.message(
      'Login to your profile',
      name: 'signInProfile',
      desc: '',
      args: [],
    );
  }

  /// `After logging in, you will have access to products with personal discounts`
  String get personalDiscounts {
    return Intl.message(
      'After logging in, you will have access to products with personal discounts',
      name: 'personalDiscounts',
      desc: '',
      args: [],
    );
  }

  /// `Login to profile`
  String get buttonSignInProfile {
    return Intl.message(
      'Login to profile',
      name: 'buttonSignInProfile',
      desc: '',
      args: [],
    );
  }

  /// `Information for clients`
  String get informationClient {
    return Intl.message(
      'Information for clients',
      name: 'informationClient',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgetPasswordSubTitle {
    return Intl.message(
      'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgetPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Email Sent`
  String get changeYourPasswordTitle {
    return Intl.message(
      'Password Reset Email Sent',
      name: 'changeYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get changeYourPasswordSubTitle {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'changeYourPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email address!`
  String get confirmEmail {
    return Intl.message(
      'Verify your email address!',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.`
  String get confirmEmailSubTitle {
    return Intl.message(
      'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
      name: 'confirmEmailSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t get the email? Check your junk/spam or resend it.`
  String get emailNotReceivedMessage {
    return Intl.message(
      'Didn’t get the email? Check your junk/spam or resend it.',
      name: 'emailNotReceivedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your account successfully created!`
  String get yourAccountCreatedTitle {
    return Intl.message(
      'Your account successfully created!',
      name: 'yourAccountCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!`
  String get yourAccountCreatedSubTitle {
    return Intl.message(
      'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
      name: 'yourAccountCreatedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get stock {
    return Intl.message(
      'Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Select address`
  String get selectAddress {
    return Intl.message(
      'Select address',
      name: 'selectAddress',
      desc: '',
      args: [],
    );
  }

  /// `Selecting a delivery method`
  String get selectDelivery {
    return Intl.message(
      'Selecting a delivery method',
      name: 'selectDelivery',
      desc: '',
      args: [],
    );
  }

  /// `To perform this action, you must log in to your account or register.`
  String get courierDelivery {
    return Intl.message(
      'To perform this action, you must log in to your account or register.',
      name: 'courierDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Login to account`
  String get loginAccount {
    return Intl.message(
      'Login to account',
      name: 'loginAccount',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get buttonSave {
    return Intl.message(
      'Save',
      name: 'buttonSave',
      desc: '',
      args: [],
    );
  }

  /// `Pick-up point`
  String get pickUpPoint {
    return Intl.message(
      'Pick-up point',
      name: 'pickUpPoint',
      desc: '',
      args: [],
    );
  }

  /// `Courier`
  String get courier {
    return Intl.message(
      'Courier',
      name: 'courier',
      desc: '',
      args: [],
    );
  }

  /// `Your pick-up points will be here`
  String get yourPickUpPoint {
    return Intl.message(
      'Your pick-up points will be here',
      name: 'yourPickUpPoint',
      desc: '',
      args: [],
    );
  }

  /// `Add a pick-up point to see current product prices and delivery times`
  String get addPickUpPointDelivery {
    return Intl.message(
      'Add a pick-up point to see current product prices and delivery times',
      name: 'addPickUpPointDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Add a pick-up point`
  String get addPickUpPoint {
    return Intl.message(
      'Add a pick-up point',
      name: 'addPickUpPoint',
      desc: '',
      args: [],
    );
  }

  /// `Add delivery address`
  String get addDeliveryAddress {
    return Intl.message(
      'Add delivery address',
      name: 'addDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Your addresses will be here`
  String get yourAddresses {
    return Intl.message(
      'Your addresses will be here',
      name: 'yourAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Add your delivery address to see current product prices and delivery times`
  String get yourDeliveryAddress {
    return Intl.message(
      'Add your delivery address to see current product prices and delivery times',
      name: 'yourDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Good day for shopping`
  String get homeAppbarTitle {
    return Intl.message(
      'Good day for shopping',
      name: 'homeAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Search in Store`
  String get search {
    return Intl.message(
      'Search in Store',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Popular Categories`
  String get popularCategory {
    return Intl.message(
      'Popular Categories',
      name: 'popularCategory',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Easy Shoppin employees never ask for account details`
  String get notificationWarning {
    return Intl.message(
      'Easy Shoppin employees never ask for account details',
      name: 'notificationWarning',
      desc: '',
      args: [],
    );
  }

  /// `Do not tell anyone your phone number or login codes - only scammers are interested in them`
  String get notificationScammers {
    return Intl.message(
      'Do not tell anyone your phone number or login codes - only scammers are interested in them',
      name: 'notificationScammers',
      desc: '',
      args: [],
    );
  }

  /// `Profile settings`
  String get profileSettings {
    return Intl.message(
      'Profile settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `Basic settings`
  String get basicSettings {
    return Intl.message(
      'Basic settings',
      name: 'basicSettings',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message(
      'Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Set shopping delivery address`
  String get subtitleAddresses {
    return Intl.message(
      'Set shopping delivery address',
      name: 'subtitleAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Add new Address`
  String get addNewAddress {
    return Intl.message(
      'Add new Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message(
      'Postal Code',
      name: 'postalCode',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Add or remove products to your favorites and proceed to checkout`
  String get subtitleFavourite {
    return Intl.message(
      'Add or remove products to your favorites and proceed to checkout',
      name: 'subtitleFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `In-progress and Completed Orders`
  String get subtitleOrders {
    return Intl.message(
      'In-progress and Completed Orders',
      name: 'subtitleOrders',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw balance to registered bank account`
  String get subtitlePaymentMethods {
    return Intl.message(
      'Withdraw balance to registered bank account',
      name: 'subtitlePaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `List of all the discounted coupons`
  String get subtitleCoupons {
    return Intl.message(
      'List of all the discounted coupons',
      name: 'subtitleCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get titleCoupons {
    return Intl.message(
      'Coupons',
      name: 'titleCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Discounts are applied automatically when placing an order.`
  String get subtitleCouponsOrder {
    return Intl.message(
      'Discounts are applied automatically when placing an order.',
      name: 'subtitleCouponsOrder',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get activeCoupons {
    return Intl.message(
      'Active',
      name: 'activeCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get overdueCoupons {
    return Intl.message(
      'Overdue',
      name: 'overdueCoupons',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any coupons yet`
  String get noCoupons {
    return Intl.message(
      'You don\'t have any coupons yet',
      name: 'noCoupons',
      desc: '',
      args: [],
    );
  }

  /// `To products`
  String get toProducts {
    return Intl.message(
      'To products',
      name: 'toProducts',
      desc: '',
      args: [],
    );
  }

  /// `Product Reviews`
  String get productReviews {
    return Intl.message(
      'Product Reviews',
      name: 'productReviews',
      desc: '',
      args: [],
    );
  }

  /// `All product reviews`
  String get subtitleProductReviews {
    return Intl.message(
      'All product reviews',
      name: 'subtitleProductReviews',
      desc: '',
      args: [],
    );
  }

  /// `Favourite stores`
  String get favouriteStores {
    return Intl.message(
      'Favourite stores',
      name: 'favouriteStores',
      desc: '',
      args: [],
    );
  }

  /// `Add your favorite stores`
  String get subtitleFavouriteStores {
    return Intl.message(
      'Add your favorite stores',
      name: 'subtitleFavouriteStores',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Chats with product sellers`
  String get subtitleChats {
    return Intl.message(
      'Chats with product sellers',
      name: 'subtitleChats',
      desc: '',
      args: [],
    );
  }

  /// `Read all`
  String get readAll {
    return Intl.message(
      'Read all',
      name: 'readAll',
      desc: '',
      args: [],
    );
  }

  /// `Controversy`
  String get controversy {
    return Intl.message(
      'Controversy',
      name: 'controversy',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Notifications are enabled for all chats!`
  String get chatNotificationEnabled {
    return Intl.message(
      'Notifications are enabled for all chats!',
      name: 'chatNotificationEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Notifications are disabled for all chats!`
  String get chatNotificationDisabled {
    return Intl.message(
      'Notifications are disabled for all chats!',
      name: 'chatNotificationDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Load Data`
  String get loadData {
    return Intl.message(
      'Load Data',
      name: 'loadData',
      desc: '',
      args: [],
    );
  }

  /// `Upload Data to your Cloud Firebase`
  String get subtitleLoadData {
    return Intl.message(
      'Upload Data to your Cloud Firebase',
      name: 'subtitleLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get personalData {
    return Intl.message(
      'Personal Data',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `User profile data`
  String get subtitlePersonalData {
    return Intl.message(
      'User profile data',
      name: 'subtitlePersonalData',
      desc: '',
      args: [],
    );
  }

  /// `Geolocation`
  String get geolocation {
    return Intl.message(
      'Geolocation',
      name: 'geolocation',
      desc: '',
      args: [],
    );
  }

  /// `Set recommendation based on location`
  String get subtitleGeolocation {
    return Intl.message(
      'Set recommendation based on location',
      name: 'subtitleGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Safe Mode`
  String get safeMode {
    return Intl.message(
      'Safe Mode',
      name: 'safeMode',
      desc: '',
      args: [],
    );
  }

  /// `Search result is safe for all ages`
  String get subtitleSafeMode {
    return Intl.message(
      'Search result is safe for all ages',
      name: 'subtitleSafeMode',
      desc: '',
      args: [],
    );
  }

  /// `HD Image Quality`
  String get imageQuality {
    return Intl.message(
      'HD Image Quality',
      name: 'imageQuality',
      desc: '',
      args: [],
    );
  }

  /// `Set image quality to be seen`
  String get subtitleImageQuality {
    return Intl.message(
      'Set image quality to be seen',
      name: 'subtitleImageQuality',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Set any kind of notification message`
  String get subtitleNotifications {
    return Intl.message(
      'Set any kind of notification message',
      name: 'subtitleNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message(
      'Themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `Change the theme of the application to your liking`
  String get subtitleThemes {
    return Intl.message(
      'Change the theme of the application to your liking',
      name: 'subtitleThemes',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Select application language`
  String get subtitleLanguage {
    return Intl.message(
      'Select application language',
      name: 'subtitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `In what currency are the prices`
  String get currencyPrices {
    return Intl.message(
      'In what currency are the prices',
      name: 'currencyPrices',
      desc: '',
      args: [],
    );
  }

  /// `Russian ruble`
  String get russianRuble {
    return Intl.message(
      'Russian ruble',
      name: 'russianRuble',
      desc: '',
      args: [],
    );
  }

  /// `Belarusian ruble`
  String get belarusianRuble {
    return Intl.message(
      'Belarusian ruble',
      name: 'belarusianRuble',
      desc: '',
      args: [],
    );
  }

  /// `Armenian dram`
  String get armenianDram {
    return Intl.message(
      'Armenian dram',
      name: 'armenianDram',
      desc: '',
      args: [],
    );
  }

  /// `Kazakh tenge`
  String get kazakhTenge {
    return Intl.message(
      'Kazakh tenge',
      name: 'kazakhTenge',
      desc: '',
      args: [],
    );
  }

  /// `Kyrgyzstani som`
  String get kyrgyzSom {
    return Intl.message(
      'Kyrgyzstani som',
      name: 'kyrgyzSom',
      desc: '',
      args: [],
    );
  }

  /// `Uzbek sum`
  String get uzbekSum {
    return Intl.message(
      'Uzbek sum',
      name: 'uzbekSum',
      desc: '',
      args: [],
    );
  }

  /// `Your devices`
  String get yourDevices {
    return Intl.message(
      'Your devices',
      name: 'yourDevices',
      desc: '',
      args: [],
    );
  }

  /// `Devices on which you are logged into your profile Easy Shoppin`
  String get subtitleYourDevices {
    return Intl.message(
      'Devices on which you are logged into your profile Easy Shoppin',
      name: 'subtitleYourDevices',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Ask questions about the application to the support team`
  String get subtitleSupport {
    return Intl.message(
      'Ask questions about the application to the support team',
      name: 'subtitleSupport',
      desc: '',
      args: [],
    );
  }

  /// `Become seller`
  String get becomeSeller {
    return Intl.message(
      'Become seller',
      name: 'becomeSeller',
      desc: '',
      args: [],
    );
  }

  /// `You can become a seller on Easy Shoppin`
  String get subtitleBecomeSeller {
    return Intl.message(
      'You can become a seller on Easy Shoppin',
      name: 'subtitleBecomeSeller',
      desc: '',
      args: [],
    );
  }

  /// `Account Privacy`
  String get accountPrivacy {
    return Intl.message(
      'Account Privacy',
      name: 'accountPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Manage data usage and connected accounts`
  String get subtitleAccountPrivacy {
    return Intl.message(
      'Manage data usage and connected accounts',
      name: 'subtitleAccountPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Rules for using the trading platform`
  String get rulesUsingTradingPlatform {
    return Intl.message(
      'Rules for using the trading platform',
      name: 'rulesUsingTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Marketplace usage data and data usage management`
  String get subtitleRulesUsingTradingPlatform {
    return Intl.message(
      'Marketplace usage data and data usage management',
      name: 'subtitleRulesUsingTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// `About Application`
  String get aboutApplication {
    return Intl.message(
      'About Application',
      name: 'aboutApplication',
      desc: '',
      args: [],
    );
  }

  /// `Application version information and other information`
  String get subtitleAboutApplication {
    return Intl.message(
      'Application version information and other information',
      name: 'subtitleAboutApplication',
      desc: '',
      args: [],
    );
  }

  /// `Easy Shoppin`
  String get appName {
    return Intl.message(
      'Easy Shoppin',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Version application:`
  String get versionApplication {
    return Intl.message(
      'Version application:',
      name: 'versionApplication',
      desc: '',
      args: [],
    );
  }

  /// `Model device:`
  String get modelDevice {
    return Intl.message(
      'Model device:',
      name: 'modelDevice',
      desc: '',
      args: [],
    );
  }

  /// `OS version:`
  String get osVersion {
    return Intl.message(
      'OS version:',
      name: 'osVersion',
      desc: '',
      args: [],
    );
  }

  /// `Locale country:`
  String get localCountry {
    return Intl.message(
      'Locale country:',
      name: 'localCountry',
      desc: '',
      args: [],
    );
  }

  /// `No country selected`
  String get noCountrySelected {
    return Intl.message(
      'No country selected',
      name: 'noCountrySelected',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Share failed!`
  String get shareFailed {
    return Intl.message(
      'Share failed!',
      name: 'shareFailed',
      desc: '',
      args: [],
    );
  }

  /// `More about the application`
  String get moreAboutApplication {
    return Intl.message(
      'More about the application',
      name: 'moreAboutApplication',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about the application`
  String get subtitleMoreAboutApplication {
    return Intl.message(
      'Detailed information about the application',
      name: 'subtitleMoreAboutApplication',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app`
  String get rateThisApp {
    return Intl.message(
      'Rate this app',
      name: 'rateThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to do?`
  String get feedbackWhatWouldLike {
    return Intl.message(
      'What would you like to do?',
      name: 'feedbackWhatWouldLike',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get feedbackRepostProblem {
    return Intl.message(
      'Report a problem',
      name: 'feedbackRepostProblem',
      desc: '',
      args: [],
    );
  }

  /// `Suggest a new feature`
  String get feedbackSuggestFeature {
    return Intl.message(
      'Suggest a new feature',
      name: 'feedbackSuggestFeature',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem with your order`
  String get feedbackProblemOrder {
    return Intl.message(
      'Report a problem with your order',
      name: 'feedbackProblemOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your suggestion`
  String get yourSuggestion {
    return Intl.message(
      'Your suggestion',
      name: 'yourSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Describe your proposal. We will not be able to answer you personally, but we will certainly take into account your wishes.`
  String get describeProposal {
    return Intl.message(
      'Describe your proposal. We will not be able to answer you personally, but we will certainly take into account your wishes.',
      name: 'describeProposal',
      desc: '',
      args: [],
    );
  }

  /// `Your email address`
  String get enterEmailAddress {
    return Intl.message(
      'Your email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Not all fields are filled!`
  String get notAllFields {
    return Intl.message(
      'Not all fields are filled!',
      name: 'notAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendFeedbackMessage {
    return Intl.message(
      'Send',
      name: 'sendFeedbackMessage',
      desc: '',
      args: [],
    );
  }

  /// `This page is intended for feedback and suggestions on the application. If you want to open a dispute, please go to my orders.`
  String get feedbackApplication {
    return Intl.message(
      'This page is intended for feedback and suggestions on the application. If you want to open a dispute, please go to my orders.',
      name: 'feedbackApplication',
      desc: '',
      args: [],
    );
  }

  /// `Choose an action`
  String get chooseAction {
    return Intl.message(
      'Choose an action',
      name: 'chooseAction',
      desc: '',
      args: [],
    );
  }

  /// `To make a photo`
  String get makePhoto {
    return Intl.message(
      'To make a photo',
      name: 'makePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Select available`
  String get selectAvailable {
    return Intl.message(
      'Select available',
      name: 'selectAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get feedbackCancelButton {
    return Intl.message(
      'Cancel',
      name: 'feedbackCancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Select images`
  String get selectImages {
    return Intl.message(
      'Select images',
      name: 'selectImages',
      desc: '',
      args: [],
    );
  }

  /// `No images found.`
  String get noImagesFound {
    return Intl.message(
      'No images found.',
      name: 'noImagesFound',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Legal information`
  String get legalInformation {
    return Intl.message(
      'Legal information',
      name: 'legalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Recommendation technologies`
  String get recommendationTechnologies {
    return Intl.message(
      'Recommendation technologies',
      name: 'recommendationTechnologies',
      desc: '',
      args: [],
    );
  }

  /// `Rules for using recommendation technologies on Easy Shoppin`
  String get rulesRecommendationTechnologies {
    return Intl.message(
      'Rules for using recommendation technologies on Easy Shoppin',
      name: 'rulesRecommendationTechnologies',
      desc: '',
      args: [],
    );
  }

  /// `The information resource uses recommendation technologies`
  String get informationResourceUses {
    return Intl.message(
      'The information resource uses recommendation technologies',
      name: 'informationResourceUses',
      desc: '',
      args: [],
    );
  }

  /// `On the information resource, when using information technologies for providing information, the collection, systematization and analysis of information related to the preferences of Internet users located on the territory of the Russian Federation is carried out.`
  String get informationResourceUsesRT {
    return Intl.message(
      'On the information resource, when using information technologies for providing information, the collection, systematization and analysis of information related to the preferences of Internet users located on the territory of the Russian Federation is carried out.',
      name: 'informationResourceUsesRT',
      desc: '',
      args: [],
    );
  }

  /// `Recommendation technologies are information technologies for providing information based on the collection, systematization and analysis of information related to the preferences of Internet users (hereinafter referred to as “recommendations”).`
  String get providingInformationRT {
    return Intl.message(
      'Recommendation technologies are information technologies for providing information based on the collection, systematization and analysis of information related to the preferences of Internet users (hereinafter referred to as “recommendations”).',
      name: 'providingInformationRT',
      desc: '',
      args: [],
    );
  }

  /// `In these Rules, we will answer basic questions about what recommendations are, the recommendation system (hereinafter referred to as the “system”) and how they work on AliExpress.`
  String get questionsAboutRecommendations {
    return Intl.message(
      'In these Rules, we will answer basic questions about what recommendations are, the recommendation system (hereinafter referred to as the “system”) and how they work on AliExpress.',
      name: 'questionsAboutRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `What is a recommendation system?`
  String get whatRecommendationSystem {
    return Intl.message(
      'What is a recommendation system?',
      name: 'whatRecommendationSystem',
      desc: '',
      args: [],
    );
  }

  /// `The Easy Shoppin recommendation system is a modern tool that helps users easily find products that interest them. The system is responsible for finding candidate products that are relevant for each specific context on a site or application, as well as the logic for sorting and displaying these products.`
  String get modernToolRS {
    return Intl.message(
      'The Easy Shoppin recommendation system is a modern tool that helps users easily find products that interest them. The system is responsible for finding candidate products that are relevant for each specific context on a site or application, as well as the logic for sorting and displaying these products.',
      name: 'modernToolRS',
      desc: '',
      args: [],
    );
  }

  /// `The recommendations themselves on Easy Shoppin are a selection of products generated by the recommendation system; they can be located in various places on the website and in the AliExpress application.`
  String get productsGeneratedRS {
    return Intl.message(
      'The recommendations themselves on Easy Shoppin are a selection of products generated by the recommendation system; they can be located in various places on the website and in the AliExpress application.',
      name: 'productsGeneratedRS',
      desc: '',
      args: [],
    );
  }

  /// `What are the recommendations?`
  String get whatRecommendations {
    return Intl.message(
      'What are the recommendations?',
      name: 'whatRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `There are two types of recommendations on Easy Shoppin: personal and product. Personalized recommendations analyze the user's purchase history and recently viewed products. Such recommendations can be seen on the AliExpress home page, in the user profile or, for example, on the pages of active orders or order details.`
  String get personalProductRecommendations {
    return Intl.message(
      'There are two types of recommendations on Easy Shoppin: personal and product. Personalized recommendations analyze the user\'s purchase history and recently viewed products. Such recommendations can be seen on the AliExpress home page, in the user profile or, for example, on the pages of active orders or order details.',
      name: 'personalProductRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Product recommendations help the user find offers similar to the one selected. This is done so that the user can find alternatives and compare options. An example of such recommendations can be found on the product card or in a non-empty cart.`
  String get productRecommendationsHelp {
    return Intl.message(
      'Product recommendations help the user find offers similar to the one selected. This is done so that the user can find alternatives and compare options. An example of such recommendations can be found on the product card or in a non-empty cart.',
      name: 'productRecommendationsHelp',
      desc: '',
      args: [],
    );
  }

  /// `What stages does the system go through before making recommendations to the user?`
  String get whatStagesRecommendations {
    return Intl.message(
      'What stages does the system go through before making recommendations to the user?',
      name: 'whatStagesRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Before the user sees a selection of products, the system goes through the following stages: searching for candidate products → ranking products → building the logic for displaying products.`
  String get selectionProductsThrough {
    return Intl.message(
      'Before the user sees a selection of products, the system goes through the following stages: searching for candidate products → ranking products → building the logic for displaying products.',
      name: 'selectionProductsThrough',
      desc: '',
      args: [],
    );
  }

  /// `Stage 1. Search for candidate products`
  String get searchCandidateProducts {
    return Intl.message(
      'Stage 1. Search for candidate products',
      name: 'searchCandidateProducts',
      desc: '',
      args: [],
    );
  }

  /// `At this stage, the system selects M products relevant to the context from a large number of products N. If the context is a product card, then candidate products are selected based on the product on this card, in the cart - based on the list of products in the cart. Thus, for product recommendations, products from the same categories or similar ones as the main product are selected. At the same time, we believe that the more often products from any categories fall into one purchase, the more these categories suit each other.`
  String get systemSelectsProductsRelevant {
    return Intl.message(
      'At this stage, the system selects M products relevant to the context from a large number of products N. If the context is a product card, then candidate products are selected based on the product on this card, in the cart - based on the list of products in the cart. Thus, for product recommendations, products from the same categories or similar ones as the main product are selected. At the same time, we believe that the more often products from any categories fall into one purchase, the more these categories suit each other.',
      name: 'systemSelectsProductsRelevant',
      desc: '',
      args: [],
    );
  }

  /// `To make personalized recommendations, we take into account information about any user interaction with products (for example, clicks, purchases or views) and select products based on these interactions.`
  String get personalizedRecommendations {
    return Intl.message(
      'To make personalized recommendations, we take into account information about any user interaction with products (for example, clicks, purchases or views) and select products based on these interactions.',
      name: 'personalizedRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `The likelihood of becoming a product candidate is higher if more similar users clicked on a product.`
  String get likelihoodBecomingProduct {
    return Intl.message(
      'The likelihood of becoming a product candidate is higher if more similar users clicked on a product.',
      name: 'likelihoodBecomingProduct',
      desc: '',
      args: [],
    );
  }

  /// `Stage 2. Product ranking`
  String get productRanking {
    return Intl.message(
      'Stage 2. Product ranking',
      name: 'productRanking',
      desc: '',
      args: [],
    );
  }

  /// `At this stage, the system selects the most relevant products and ranks them according to the likelihood of purchase by the user. Machine learning models are used for this. As a result, each product is given a score from 0 to 1. The higher the score, the higher the position the product occupies in the recommendations.`
  String get relevantProductsRanks {
    return Intl.message(
      'At this stage, the system selects the most relevant products and ranks them according to the likelihood of purchase by the user. Machine learning models are used for this. As a result, each product is given a score from 0 to 1. The higher the score, the higher the position the product occupies in the recommendations.',
      name: 'relevantProductsRanks',
      desc: '',
      args: [],
    );
  }

  /// `The model is based on various product properties, such as views, clicks, orders, ratings, price and much more. Using the gradient boosting method of decision trees, the model predicts the probability of purchase for each product. Different properties may have different weights for the model, for example, price may be more important than the number of views.`
  String get variousProductProperties {
    return Intl.message(
      'The model is based on various product properties, such as views, clicks, orders, ratings, price and much more. Using the gradient boosting method of decision trees, the model predicts the probability of purchase for each product. Different properties may have different weights for the model, for example, price may be more important than the number of views.',
      name: 'variousProductProperties',
      desc: '',
      args: [],
    );
  }

  /// `The likelihood of purchasing a product will differ for different contexts; the same product may have a high rating on the main page of the site and a lower rating on the order history page.`
  String get likelihoodPurchasingProduct {
    return Intl.message(
      'The likelihood of purchasing a product will differ for different contexts; the same product may have a high rating on the main page of the site and a lower rating on the order history page.',
      name: 'likelihoodPurchasingProduct',
      desc: '',
      args: [],
    );
  }

  /// `The model analyzes user behavior in the past, understands what products were of interest to him or users with similar preferences, and predicts what a person will be willing to buy. Recommendations are most strongly influenced by products that the user has purchased on AliExpress before.`
  String get modelAnalyzesUser {
    return Intl.message(
      'The model analyzes user behavior in the past, understands what products were of interest to him or users with similar preferences, and predicts what a person will be willing to buy. Recommendations are most strongly influenced by products that the user has purchased on AliExpress before.',
      name: 'modelAnalyzesUser',
      desc: '',
      args: [],
    );
  }

  /// `Stage 3. Logic for displaying a selection of recommendations`
  String get logicDisplayingSelection {
    return Intl.message(
      'Stage 3. Logic for displaying a selection of recommendations',
      name: 'logicDisplayingSelection',
      desc: '',
      args: [],
    );
  }

  /// `At this stage, the business logic for displaying a selection and filtering products is applied.`
  String get businessLogicDisplaying {
    return Intl.message(
      'At this stage, the business logic for displaying a selection and filtering products is applied.',
      name: 'businessLogicDisplaying',
      desc: '',
      args: [],
    );
  }

  /// `When the system has received all the final ratings, a selection is formed in which products with a higher rating are shown higher in the search results, and products with a lower rating are shown closer to the end. When a selection of products is formed, the main characteristics of each product are loaded (price, discounts, cashback, delivery, etc.) and images.`
  String get receivedFinalRatings {
    return Intl.message(
      'When the system has received all the final ratings, a selection is formed in which products with a higher rating are shown higher in the search results, and products with a lower rating are shown closer to the end. When a selection of products is formed, the main characteristics of each product are loaded (price, discounts, cashback, delivery, etc.) and images.',
      name: 'receivedFinalRatings',
      desc: '',
      args: [],
    );
  }

  /// `A selection of recommendations may show a different number of products depending on their location on the AliExpress website or app. Depending on the type and location of the recommendations, they can be positioned horizontally, with side swipes, or vertically, loading additional products as the user scrolls to the end of the recommendations. We hope our recommendation system will help you find the best products and make your AliExpress journey more fun and convenient!`
  String get selectionRecommendations {
    return Intl.message(
      'A selection of recommendations may show a different number of products depending on their location on the AliExpress website or app. Depending on the type and location of the recommendations, they can be positioned horizontally, with side swipes, or vertically, loading additional products as the user scrolls to the end of the recommendations. We hope our recommendation system will help you find the best products and make your AliExpress journey more fun and convenient!',
      name: 'selectionRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `© 2024. Easy Shoppin`
  String get copyRight {
    return Intl.message(
      '© 2024. Easy Shoppin',
      name: 'copyRight',
      desc: '',
      args: [],
    );
  }

  /// `Log out of your account`
  String get logout {
    return Intl.message(
      'Log out of your account',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logging out of your account`
  String get loggingAccount {
    return Intl.message(
      'Logging out of your account',
      name: 'loggingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out of your account?`
  String get areYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure you want to log out of your account?',
      name: 'areYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get changeProfilePicture {
    return Intl.message(
      'Change Profile Picture',
      name: 'changeProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Change Name`
  String get titleChangeName {
    return Intl.message(
      'Change Name',
      name: 'titleChangeName',
      desc: '',
      args: [],
    );
  }

  /// `User real name for easy verification. This name will appear on several pages.`
  String get subtitleChangeName {
    return Intl.message(
      'User real name for easy verification. This name will appear on several pages.',
      name: 'subtitleChangeName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Change Username`
  String get titleChangeUsername {
    return Intl.message(
      'Change Username',
      name: 'titleChangeUsername',
      desc: '',
      args: [],
    );
  }

  /// `Username for easy verification. This username will appear on several pages.`
  String get subtitleChangeUsername {
    return Intl.message(
      'Username for easy verification. This username will appear on several pages.',
      name: 'subtitleChangeUsername',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get titleChangePassword {
    return Intl.message(
      'Change Password',
      name: 'titleChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get passwordConfirm {
    return Intl.message(
      'Password Confirmation',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Change password to identify. Only displayed on the profile page.`
  String get subTitleChangePassword {
    return Intl.message(
      'Change password to identify. Only displayed on the profile page.',
      name: 'subTitleChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message(
      'User ID',
      name: 'userId',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `User ID copied to clipboard`
  String get userIdCopied {
    return Intl.message(
      'User ID copied to clipboard',
      name: 'userIdCopied',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change Phone Number`
  String get titleChangePhoneNumber {
    return Intl.message(
      'Change Phone Number',
      name: 'titleChangePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change phone number to identify. Only displayed on the profile page.`
  String get subTitleChangePhoneNumber {
    return Intl.message(
      'Change phone number to identify. Only displayed on the profile page.',
      name: 'subTitleChangePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Change Gender`
  String get titleChangeGender {
    return Intl.message(
      'Change Gender',
      name: 'titleChangeGender',
      desc: '',
      args: [],
    );
  }

  /// `Select gender to identify. Only displayed on the profile page.`
  String get subTitleChangeGender {
    return Intl.message(
      'Select gender to identify. Only displayed on the profile page.',
      name: 'subTitleChangeGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get maleGender {
    return Intl.message(
      'Male',
      name: 'maleGender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get femaleGender {
    return Intl.message(
      'Female',
      name: 'femaleGender',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateBirth',
      desc: '',
      args: [],
    );
  }

  /// `Change Date of Birth`
  String get titleChangeDateBirth {
    return Intl.message(
      'Change Date of Birth',
      name: 'titleChangeDateBirth',
      desc: '',
      args: [],
    );
  }

  /// `Change your date of birth.`
  String get subTitleChangeDateBirth {
    return Intl.message(
      'Change your date of birth.',
      name: 'subTitleChangeDateBirth',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to delete your account permanently? This action is not reversible and all or your data will be removed permanently.`
  String get deleteAccountMessage {
    return Intl.message(
      'Are you sure want to delete your account permanently? This action is not reversible and all or your data will be removed permanently.',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Cart is Empty.`
  String get cartEmpty {
    return Intl.message(
      'Whoops! Cart is Empty.',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Wishlist is Empty...`
  String get wishlistEmpty {
    return Intl.message(
      'Whoops! Wishlist is Empty...',
      name: 'wishlistEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Let's add some`
  String get letsAddSome {
    return Intl.message(
      'Let\'s add some',
      name: 'letsAddSome',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get order {
    return Intl.message(
      'My Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Order List is Empty...`
  String get orderListEmpty {
    return Intl.message(
      'Whoops! Order List is Empty...',
      name: 'orderListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Let's fill it`
  String get letsFillIt {
    return Intl.message(
      'Let\'s fill it',
      name: 'letsFillIt',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Link a card`
  String get linkCard {
    return Intl.message(
      'Link a card',
      name: 'linkCard',
      desc: '',
      args: [],
    );
  }

  /// `Link the bank to SBP`
  String get linkBankSBP {
    return Intl.message(
      'Link the bank to SBP',
      name: 'linkBankSBP',
      desc: '',
      args: [],
    );
  }

  /// `Upload Data`
  String get uploadData {
    return Intl.message(
      'Upload Data',
      name: 'uploadData',
      desc: '',
      args: [],
    );
  }

  /// `Main Record`
  String get mainRecord {
    return Intl.message(
      'Main Record',
      name: 'mainRecord',
      desc: '',
      args: [],
    );
  }

  /// `Upload Categories`
  String get uploadCategories {
    return Intl.message(
      'Upload Categories',
      name: 'uploadCategories',
      desc: '',
      args: [],
    );
  }

  /// `Upload Brands`
  String get uploadBrands {
    return Intl.message(
      'Upload Brands',
      name: 'uploadBrands',
      desc: '',
      args: [],
    );
  }

  /// `Upload Products`
  String get uploadProducts {
    return Intl.message(
      'Upload Products',
      name: 'uploadProducts',
      desc: '',
      args: [],
    );
  }

  /// `Upload Banners`
  String get uploadBanners {
    return Intl.message(
      'Upload Banners',
      name: 'uploadBanners',
      desc: '',
      args: [],
    );
  }

  /// `Load category data`
  String get loadCategoryData {
    return Intl.message(
      'Load category data',
      name: 'loadCategoryData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to load category data into the database? Do not close the window until the data is loading!`
  String get uploadCategoryDatabase {
    return Intl.message(
      'Are you sure you want to load category data into the database? Do not close the window until the data is loading!',
      name: 'uploadCategoryDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Load brands data`
  String get loadBrandData {
    return Intl.message(
      'Load brands data',
      name: 'loadBrandData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to load brand data into the database? Do not close the window until the data is loading!`
  String get uploadBrandDatabase {
    return Intl.message(
      'Are you sure you want to load brand data into the database? Do not close the window until the data is loading!',
      name: 'uploadBrandDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Load products data`
  String get loadProductData {
    return Intl.message(
      'Load products data',
      name: 'loadProductData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to load product data into the database? Do not close the window until the data is loading!`
  String get uploadProductDatabase {
    return Intl.message(
      'Are you sure you want to load product data into the database? Do not close the window until the data is loading!',
      name: 'uploadProductDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Load banners data`
  String get loadBannerData {
    return Intl.message(
      'Load banners data',
      name: 'loadBannerData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to load banner data into the database? Do not close the window until the data is loading!`
  String get uploadBannerDatabase {
    return Intl.message(
      'Are you sure you want to load banner data into the database? Do not close the window until the data is loading!',
      name: 'uploadBannerDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Relationships`
  String get relationships {
    return Intl.message(
      'Relationships',
      name: 'relationships',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you have already uploaded all the content above.`
  String get subtitleRelationships {
    return Intl.message(
      'Make sure you have already uploaded all the content above.',
      name: 'subtitleRelationships',
      desc: '',
      args: [],
    );
  }

  /// `Upload Brands & Categories Relation Data`
  String get uploadBrandsCategories {
    return Intl.message(
      'Upload Brands & Categories Relation Data',
      name: 'uploadBrandsCategories',
      desc: '',
      args: [],
    );
  }

  /// `Upload Product Categories Relation Data`
  String get uploadProductsCategories {
    return Intl.message(
      'Upload Product Categories Relation Data',
      name: 'uploadProductsCategories',
      desc: '',
      args: [],
    );
  }

  /// `Upload Brand Categories`
  String get uploadBrandCategories {
    return Intl.message(
      'Upload Brand Categories',
      name: 'uploadBrandCategories',
      desc: '',
      args: [],
    );
  }

  /// `Upload Product Categories`
  String get uploadProductCategories {
    return Intl.message(
      'Upload Product Categories',
      name: 'uploadProductCategories',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found!`
  String get noDataFound {
    return Intl.message(
      'No Data Found!',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get wentWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'wentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Logging you in...`
  String get loggingYouIn {
    return Intl.message(
      'Logging you in...',
      name: 'loggingYouIn',
      desc: '',
      args: [],
    );
  }

  /// `Oh Snap`
  String get ohSnap {
    return Intl.message(
      'Oh Snap',
      name: 'ohSnap',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Link a new card`
  String get linkNewCard {
    return Intl.message(
      'Link a new card',
      name: 'linkNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get cardNumber {
    return Intl.message(
      'Card number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Validity`
  String get validity {
    return Intl.message(
      'Validity',
      name: 'validity',
      desc: '',
      args: [],
    );
  }

  /// `3 digits on the back`
  String get digitsCardBack {
    return Intl.message(
      '3 digits on the back',
      name: 'digitsCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Setting notifications`
  String get settingNotificationTitle {
    return Intl.message(
      'Setting notifications',
      name: 'settingNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can subscribe to the following types of newsletters from our store to receive news about promotions and promotional codes`
  String get notificationSubscribe {
    return Intl.message(
      'You can subscribe to the following types of newsletters from our store to receive news about promotions and promotional codes',
      name: 'notificationSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get notificationSms {
    return Intl.message(
      'SMS',
      name: 'notificationSms',
      desc: '',
      args: [],
    );
  }

  /// `SMS-messages`
  String get smsMessages {
    return Intl.message(
      'SMS-messages',
      name: 'smsMessages',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Information about promotions and offers`
  String get informationPromotions {
    return Intl.message(
      'Information about promotions and offers',
      name: 'informationPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Personal account notifications`
  String get personalNotifications {
    return Intl.message(
      'Personal account notifications',
      name: 'personalNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Select theme`
  String get selectTheme {
    return Intl.message(
      'Select theme',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get lightTheme {
    return Intl.message(
      'Light',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get darkTheme {
    return Intl.message(
      'Dark',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get systemTheme {
    return Intl.message(
      'System',
      name: 'systemTheme',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get selectLanguage {
    return Intl.message(
      'Select country',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russianLanguage {
    return Intl.message(
      'Russian',
      name: 'russianLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanishLanguage {
    return Intl.message(
      'Spanish',
      name: 'spanishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Russia`
  String get russia {
    return Intl.message(
      'Russia',
      name: 'russia',
      desc: '',
      args: [],
    );
  }

  /// `Belarus`
  String get belarus {
    return Intl.message(
      'Belarus',
      name: 'belarus',
      desc: '',
      args: [],
    );
  }

  /// `Kazakhstan`
  String get kazakhstan {
    return Intl.message(
      'Kazakhstan',
      name: 'kazakhstan',
      desc: '',
      args: [],
    );
  }

  /// `kyrgyzstan`
  String get kyrgyzstan {
    return Intl.message(
      'kyrgyzstan',
      name: 'kyrgyzstan',
      desc: '',
      args: [],
    );
  }

  /// `Armenia`
  String get armenia {
    return Intl.message(
      'Armenia',
      name: 'armenia',
      desc: '',
      args: [],
    );
  }

  /// `Uzbekistan`
  String get uzbekistan {
    return Intl.message(
      'Uzbekistan',
      name: 'uzbekistan',
      desc: '',
      args: [],
    );
  }

  /// `Feature Brands`
  String get featureBrands {
    return Intl.message(
      'Feature Brands',
      name: 'featureBrands',
      desc: '',
      args: [],
    );
  }

  /// `No products with stock status available`
  String get noProductsStock {
    return Intl.message(
      'No products with stock status available',
      name: 'noProductsStock',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet settings and try again.`
  String get checkInternetSettings {
    return Intl.message(
      'Please check your internet settings and try again.',
      name: 'checkInternetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get loadMore {
    return Intl.message(
      'Load more',
      name: 'loadMore',
      desc: '',
      args: [],
    );
  }

  /// `1. General provisions`
  String get generalProvisionsPrivacy {
    return Intl.message(
      '1. General provisions',
      name: 'generalProvisionsPrivacy',
      desc: '',
      args: [],
    );
  }

  /// ` This Policy regarding the processing of personal data (hereinafter referred to as the Policy) defines the goals, establishes the procedure and conditions for the processing of personal data, measures aimed at protecting personal data, and also contains information about the rights of persons to whom the relevant personal data relates to Easy Shoppin LLC ( hereinafter referred to as the Society).`
  String get termsPrivacy {
    return Intl.message(
      ' This Policy regarding the processing of personal data (hereinafter referred to as the Policy) defines the goals, establishes the procedure and conditions for the processing of personal data, measures aimed at protecting personal data, and also contains information about the rights of persons to whom the relevant personal data relates to Easy Shoppin LLC ( hereinafter referred to as the Society).',
      name: 'termsPrivacy',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes personal data in accordance with the requirements of the Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data” and other regulatory legal acts of the Russian Federation governing legal relations in the field of personal data processing.`
  String get processesPersonalAccordance {
    return Intl.message(
      ' The Company processes personal data in accordance with the requirements of the Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data” and other regulatory legal acts of the Russian Federation governing legal relations in the field of personal data processing.',
      name: 'processesPersonalAccordance',
      desc: '',
      args: [],
    );
  }

  /// ` The Policy applies to all personal data of personal data subjects specified in clauses 4.1.1., 4.1.2. Policies processed in the Company with and without the use of automation tools.`
  String get policyAppliesSubjects {
    return Intl.message(
      ' The Policy applies to all personal data of personal data subjects specified in clauses 4.1.1., 4.1.2. Policies processed in the Company with and without the use of automation tools.',
      name: 'policyAppliesSubjects',
      desc: '',
      args: [],
    );
  }

  /// ` The Policy applies to all actions related to the processing of personal data by the Company on the information resource, which is accessed via the domain name “*.wb.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application (hereinafter referred to as the “Site”).`
  String get policyAppliesRelated {
    return Intl.message(
      ' The Policy applies to all actions related to the processing of personal data by the Company on the information resource, which is accessed via the domain name “*.wb.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application (hereinafter referred to as the “Site”).',
      name: 'policyAppliesRelated',
      desc: '',
      args: [],
    );
  }

  /// ` If the subject of personal data objects to the processing of personal data by the Company in accordance with the Policy, the subject of personal data has the right to refuse to use the Site and/or send an appropriate request to the Company. In this case, the functionality of the Site, including registration of a personal account, will not be provided.`
  String get subjectPersonalPolicy {
    return Intl.message(
      ' If the subject of personal data objects to the processing of personal data by the Company in accordance with the Policy, the subject of personal data has the right to refuse to use the Site and/or send an appropriate request to the Company. In this case, the functionality of the Site, including registration of a personal account, will not be provided.',
      name: 'subjectPersonalPolicy',
      desc: '',
      args: [],
    );
  }

  /// ` The processing of personal data of the subject of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, as well as without obtaining consent in cases provided for by the legislation of the Russian Federation.`
  String get processingPersonalCarried {
    return Intl.message(
      ' The processing of personal data of the subject of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, as well as without obtaining consent in cases provided for by the legislation of the Russian Federation.',
      name: 'processingPersonalCarried',
      desc: '',
      args: [],
    );
  }

  /// ` This Policy comes into force from the moment of its approval by the General Director of the Organization and is valid indefinitely until it is replaced by a new Policy.`
  String get policyComesGeneralDirector {
    return Intl.message(
      ' This Policy comes into force from the moment of its approval by the General Director of the Organization and is valid indefinitely until it is replaced by a new Policy.',
      name: 'policyComesGeneralDirector',
      desc: '',
      args: [],
    );
  }

  /// ` The Company has the right to unilaterally change the terms of the Policy.`
  String get companyUnilaterallyChange {
    return Intl.message(
      ' The Company has the right to unilaterally change the terms of the Policy.',
      name: 'companyUnilaterallyChange',
      desc: '',
      args: [],
    );
  }

  /// ` Due to the fact that the text of the Policy is freely available on the Internet, the subject of personal data must independently monitor changes made to the Policy.`
  String get policyFreelyInternet {
    return Intl.message(
      ' Due to the fact that the text of the Policy is freely available on the Internet, the subject of personal data must independently monitor changes made to the Policy.',
      name: 'policyFreelyInternet',
      desc: '',
      args: [],
    );
  }

  /// ` This Policy applies to personal data received both before and after the entry into force of this Policy.`
  String get policyAppliesReceived {
    return Intl.message(
      ' This Policy applies to personal data received both before and after the entry into force of this Policy.',
      name: 'policyAppliesReceived',
      desc: '',
      args: [],
    );
  }

  /// ` Internal control over compliance with the requirements of the Policy is carried out by the person responsible for organizing the processing of personal data in the Company.`
  String get internalControlCompany {
    return Intl.message(
      ' Internal control over compliance with the requirements of the Policy is carried out by the person responsible for organizing the processing of personal data in the Company.',
      name: 'internalControlCompany',
      desc: '',
      args: [],
    );
  }

  /// ` The following terms are used in the Policy:`
  String get followingTermsPolicy {
    return Intl.message(
      ' The following terms are used in the Policy:',
      name: 'followingTermsPolicy',
      desc: '',
      args: [],
    );
  }

  /// ` Automated processing of personal data - processing of personal data using computer technology.`
  String get automatedProcessingPersonal {
    return Intl.message(
      ' Automated processing of personal data - processing of personal data using computer technology.',
      name: 'automatedProcessingPersonal',
      desc: '',
      args: [],
    );
  }

  /// ` Blocking is a temporary cessation of processing of personal data (except for cases where processing is necessary to clarify personal data).`
  String get blockingTemporaryCessation {
    return Intl.message(
      ' Blocking is a temporary cessation of processing of personal data (except for cases where processing is necessary to clarify personal data).',
      name: 'blockingTemporaryCessation',
      desc: '',
      args: [],
    );
  }

  /// ` Security of personal data is the state of security of personal data, characterized by the ability of users of personal data information systems, personal data operators, technical means and information technologies to ensure the confidentiality, integrity and availability of personal data when processed in personal data information systems.`
  String get securityPersonalData {
    return Intl.message(
      ' Security of personal data is the state of security of personal data, characterized by the ability of users of personal data information systems, personal data operators, technical means and information technologies to ensure the confidentiality, integrity and availability of personal data when processed in personal data information systems.',
      name: 'securityPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Biometric personal data is data that characterizes the physiological and biological characteristics of a person, on the basis of which his identity can be established.`
  String get biometricPersonalData {
    return Intl.message(
      ' Biometric personal data is data that characterizes the physiological and biological characteristics of a person, on the basis of which his identity can be established.',
      name: 'biometricPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Law - Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data”.`
  String get federalLaw {
    return Intl.message(
      ' Law - Federal Law of the Russian Federation dated July 27, 2006 No. 152-FZ “On Personal Data”.',
      name: 'federalLaw',
      desc: '',
      args: [],
    );
  }

  /// ` Registered user (Buyer) - an individual who has a Site user ID (registered on the Site) and uses the Site in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila- polzovaniya-torgovoy-ploshchadkoy.`
  String get registeredBuyer {
    return Intl.message(
      ' Registered user (Buyer) - an individual who has a Site user ID (registered on the Site) and uses the Site in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila- polzovaniya-torgovoy-ploshchadkoy.',
      name: 'registeredBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` Depersonalization - actions as a result of which it becomes impossible to determine the ownership of personal data by a specific subject of personal data without the use of additional information.`
  String get depersonalization {
    return Intl.message(
      ' Depersonalization - actions as a result of which it becomes impossible to determine the ownership of personal data by a specific subject of personal data without the use of additional information.',
      name: 'depersonalization',
      desc: '',
      args: [],
    );
  }

  /// ` Processing of personal data - any action (operation) or set of actions (operations) performed with or without the use of automation tools with personal data, as well as through mixed processing, including collection, recording, systematization, accumulation, storage, clarification (updating , change), extraction, use, transfer (distribution, provision, access), depersonalization, blocking, deletion, destruction of personal data.`
  String get processingPersonalData {
    return Intl.message(
      ' Processing of personal data - any action (operation) or set of actions (operations) performed with or without the use of automation tools with personal data, as well as through mixed processing, including collection, recording, systematization, accumulation, storage, clarification (updating , change), extraction, use, transfer (distribution, provision, access), depersonalization, blocking, deletion, destruction of personal data.',
      name: 'processingPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Society - Easy Shoppin LLC.`
  String get society {
    return Intl.message(
      ' Society - Easy Shoppin LLC.',
      name: 'society',
      desc: '',
      args: [],
    );
  }

  /// ` Operator - a person who, independently or jointly with other persons, organizes and (or) carries out the processing of personal data, as well as determining the purposes of processing personal data, the composition of personal data to be processed, actions (operations) performed with personal data. For the purposes of this Policy, the Company, when processing personal data, is an operator, unless otherwise expressly stated in the Policy.`
  String get operatorIndependently {
    return Intl.message(
      ' Operator - a person who, independently or jointly with other persons, organizes and (or) carries out the processing of personal data, as well as determining the purposes of processing personal data, the composition of personal data to be processed, actions (operations) performed with personal data. For the purposes of this Policy, the Company, when processing personal data, is an operator, unless otherwise expressly stated in the Policy.',
      name: 'operatorIndependently',
      desc: '',
      args: [],
    );
  }

  /// ` Confidentiality of personal data is a mandatory requirement for the Company or any other person who has access to personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data or the presence of another legal basis provided for by federal law.`
  String get confidentialityPersonalData {
    return Intl.message(
      ' Confidentiality of personal data is a mandatory requirement for the Company or any other person who has access to personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data or the presence of another legal basis provided for by federal law.',
      name: 'confidentialityPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Personal data - any information relating to a directly or indirectly identified or identifiable individual (subject of personal data).`
  String get personalDataIdentified {
    return Intl.message(
      ' Personal data - any information relating to a directly or indirectly identified or identifiable individual (subject of personal data).',
      name: 'personalDataIdentified',
      desc: '',
      args: [],
    );
  }

  /// ` User - an individual using the services of the Site (Internet user).`
  String get individualUsingServices {
    return Intl.message(
      ' User - an individual using the services of the Site (Internet user).',
      name: 'individualUsingServices',
      desc: '',
      args: [],
    );
  }

  /// ` The website is the Company’s information resource on the Internet, accessed via the domain name “*.wb.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application.`
  String get websiteCompanyInformation {
    return Intl.message(
      ' The website is the Company’s information resource on the Internet, accessed via the domain name “*.wb.ru”, “*.easyshoppin.ru”, or using the Company’s mobile application.',
      name: 'websiteCompanyInformation',
      desc: '',
      args: [],
    );
  }

  /// ` A special category of personal data is information relating to race, nationality, political views, religious or philosophical beliefs, health status, intimate life.`
  String get specialCategoryPersonalData {
    return Intl.message(
      ' A special category of personal data is information relating to race, nationality, political views, religious or philosophical beliefs, health status, intimate life.',
      name: 'specialCategoryPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Provision - actions aimed at disclosing personal data to a certain person or a certain group of persons.`
  String get provisionActionsAimed {
    return Intl.message(
      ' Provision - actions aimed at disclosing personal data to a certain person or a certain group of persons.',
      name: 'provisionActionsAimed',
      desc: '',
      args: [],
    );
  }

  /// ` Distribution - actions aimed at disclosing personal data to an indefinite number of persons.`
  String get distributionActionsAimed {
    return Intl.message(
      ' Distribution - actions aimed at disclosing personal data to an indefinite number of persons.',
      name: 'distributionActionsAimed',
      desc: '',
      args: [],
    );
  }

  /// ` Personal data subject is an individual directly or indirectly identified or determined on the basis of personal data relating to him.`
  String get individualDirectly {
    return Intl.message(
      ' Personal data subject is an individual directly or indirectly identified or determined on the basis of personal data relating to him.',
      name: 'individualDirectly',
      desc: '',
      args: [],
    );
  }

  /// ` Destruction of personal data - actions as a result of which it becomes impossible to restore the content of personal data in the personal data information system and (or) as a result of which material media of personal data are destroyed.`
  String get destructionPersonalData {
    return Intl.message(
      ' Destruction of personal data - actions as a result of which it becomes impossible to restore the content of personal data in the personal data information system and (or) as a result of which material media of personal data are destroyed.',
      name: 'destructionPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Cookies are text files available to the Company containing information about the device (IP address of the device), browser, application version, and stored in the browser of the computer (mobile device) of the User or Registered User when they visit the Site. The collection of cookies can be configured or disabled independently in the settings of the browser used.`
  String get cookiesCompanyContaining {
    return Intl.message(
      ' Cookies are text files available to the Company containing information about the device (IP address of the device), browser, application version, and stored in the browser of the computer (mobile device) of the User or Registered User when they visit the Site. The collection of cookies can be configured or disabled independently in the settings of the browser used.',
      name: 'cookiesCompanyContaining',
      desc: '',
      args: [],
    );
  }

  /// ` Pseudonym (nickname) is the name of the user (PDN subject) in a service, on a website, etc., which the user comes up with independently during registration.`
  String get nicknameWebsite {
    return Intl.message(
      ' Pseudonym (nickname) is the name of the user (PDN subject) in a service, on a website, etc., which the user comes up with independently during registration.',
      name: 'nicknameWebsite',
      desc: '',
      args: [],
    );
  }

  /// ` Other terms not mentioned above are used in the meaning established by regulatory legal acts of the Russian Federation, documents and local acts of the Company.`
  String get otherTermsNotMentioned {
    return Intl.message(
      ' Other terms not mentioned above are used in the meaning established by regulatory legal acts of the Russian Federation, documents and local acts of the Company.',
      name: 'otherTermsNotMentioned',
      desc: '',
      args: [],
    );
  }

  /// `2. Purposes of processing personal data`
  String get purposesPersonalData {
    return Intl.message(
      '2. Purposes of processing personal data',
      name: 'purposesPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes personal data for the following purposes:`
  String get companyProcessesData {
    return Intl.message(
      ' The Company processes personal data for the following purposes:',
      name: 'companyProcessesData',
      desc: '',
      args: [],
    );
  }

  /// ` Registration and use of your personal account to place orders on the Site, as well as to receive informational and advertising mailings.`
  String get registrationPersonalAccount {
    return Intl.message(
      ' Registration and use of your personal account to place orders on the Site, as well as to receive informational and advertising mailings.',
      name: 'registrationPersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Use of a personal account by a Registered User on the Site by filling out information about yourself; placing orders (including payment and delivery of orders), tracking the status of an order, writing reviews about products, drawing up requests regarding work on the Site through a special form in the Registered User’s personal account, exercising the possibility of returning goods or funds (within the warranty period).`
  String get personalAccountRegisteredUser {
    return Intl.message(
      ' Use of a personal account by a Registered User on the Site by filling out information about yourself; placing orders (including payment and delivery of orders), tracking the status of an order, writing reviews about products, drawing up requests regarding work on the Site through a special form in the Registered User’s personal account, exercising the possibility of returning goods or funds (within the warranty period).',
      name: 'personalAccountRegisteredUser',
      desc: '',
      args: [],
    );
  }

  /// ` Providing the possibility of booking (purchasing) air and ground transport tickets on the Site.`
  String get providingPossibilityBooking {
    return Intl.message(
      ' Providing the possibility of booking (purchasing) air and ground transport tickets on the Site.',
      name: 'providingPossibilityBooking',
      desc: '',
      args: [],
    );
  }

  /// ` Providing data for customs clearance and delivery of goods, in case of ordering goods from abroad.`
  String get providingCustomsClearance {
    return Intl.message(
      ' Providing data for customs clearance and delivery of goods, in case of ordering goods from abroad.',
      name: 'providingCustomsClearance',
      desc: '',
      args: [],
    );
  }

  /// ` Providing data for completing training courses published by third parties on the Company’s Website.`
  String get providingDataCompletingTraining {
    return Intl.message(
      ' Providing data for completing training courses published by third parties on the Company’s Website.',
      name: 'providingDataCompletingTraining',
      desc: '',
      args: [],
    );
  }

  /// ` Using the Site's capabilities to make audio and video calls`
  String get usingSiteCapabilities {
    return Intl.message(
      ' Using the Site\'s capabilities to make audio and video calls',
      name: 'usingSiteCapabilities',
      desc: '',
      args: [],
    );
  }

  /// `3. Legal grounds for processing personal data`
  String get legalGrounds {
    return Intl.message(
      '3. Legal grounds for processing personal data',
      name: 'legalGrounds',
      desc: '',
      args: [],
    );
  }

  /// ` The processing of personal data is carried out by the Company on the following legal grounds:`
  String get carriedCompany {
    return Intl.message(
      ' The processing of personal data is carried out by the Company on the following legal grounds:',
      name: 'carriedCompany',
      desc: '',
      args: [],
    );
  }

  /// `- the processing of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, which the subject provides by active action, including putting a mark in the interface opposite the phrase: “I agree to the processing of personal data, with the rules for using the trading platform and returning”;`
  String get consentSubjectPersonal {
    return Intl.message(
      '- the processing of personal data is carried out with the consent of the subject of personal data to the processing of his personal data, which the subject provides by active action, including putting a mark in the interface opposite the phrase: “I agree to the processing of personal data, with the rules for using the trading platform and returning”;',
      name: 'consentSubjectPersonal',
      desc: '',
      args: [],
    );
  }

  /// `- processing of personal data is necessary to achieve the goals provided for by an international treaty of the Russian Federation or law, to implement and fulfill the functions, powers and responsibilities assigned by the legislation of the Russian Federation to the operator`
  String get internationalTreaty {
    return Intl.message(
      '- processing of personal data is necessary to achieve the goals provided for by an international treaty of the Russian Federation or law, to implement and fulfill the functions, powers and responsibilities assigned by the legislation of the Russian Federation to the operator',
      name: 'internationalTreaty',
      desc: '',
      args: [],
    );
  }

  /// `- the processing of personal data is necessary for the execution of an agreement to which the subject of personal data is a party or beneficiary or guarantor, as well as for concluding an agreement on the initiative of the subject of personal data or an agreement under which the subject of personal data will be a beneficiary or guarantor. An agreement concluded with a personal data subject cannot contain provisions limiting the rights and freedoms of the personal data subject;`
  String get executionAgreement {
    return Intl.message(
      '- the processing of personal data is necessary for the execution of an agreement to which the subject of personal data is a party or beneficiary or guarantor, as well as for concluding an agreement on the initiative of the subject of personal data or an agreement under which the subject of personal data will be a beneficiary or guarantor. An agreement concluded with a personal data subject cannot contain provisions limiting the rights and freedoms of the personal data subject;',
      name: 'executionAgreement',
      desc: '',
      args: [],
    );
  }

  /// `- the processing of personal data is necessary to exercise the rights and legitimate interests of the operator or third parties, provided that the rights and freedoms of the subject of personal data are not violated.`
  String get legitimateInterests {
    return Intl.message(
      '- the processing of personal data is necessary to exercise the rights and legitimate interests of the operator or third parties, provided that the rights and freedoms of the subject of personal data are not violated.',
      name: 'legitimateInterests',
      desc: '',
      args: [],
    );
  }

  /// `4. Categories of personal data processed, categories of personal data subjects`
  String get categoriesProcessed {
    return Intl.message(
      '4. Categories of personal data processed, categories of personal data subjects',
      name: 'categoriesProcessed',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes personal data of the following personal data subjects:`
  String get followingPersonalDataSubjects {
    return Intl.message(
      ' The Company processes personal data of the following personal data subjects:',
      name: 'followingPersonalDataSubjects',
      desc: '',
      args: [],
    );
  }

  /// ` Individuals - Users, in accordance with the purpose of processing specified in paragraphs. 2.1.1., 2.1.6.`
  String get individualsUsers {
    return Intl.message(
      ' Individuals - Users, in accordance with the purpose of processing specified in paragraphs. 2.1.1., 2.1.6.',
      name: 'individualsUsers',
      desc: '',
      args: [],
    );
  }

  /// ` Individuals - Registered users, in accordance with the purposes of processing specified in paragraphs. 2.1.2., 2.1.3., 2.1.4., 2.1.5., 2.1.6.`
  String get individualsRegisteredUsers {
    return Intl.message(
      ' Individuals - Registered users, in accordance with the purposes of processing specified in paragraphs. 2.1.2., 2.1.3., 2.1.4., 2.1.5., 2.1.6.',
      name: 'individualsRegisteredUsers',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes the following categories of personal data of personal data subjects:`
  String get followingCategories {
    return Intl.message(
      ' The Company processes the following categories of personal data of personal data subjects:',
      name: 'followingCategories',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goals specified in clause 2.1.1 of the Policy - telephone number.`
  String get policyTelephoneNumber {
    return Intl.message(
      ' As part of achieving the goals specified in clause 2.1.1 of the Policy - telephone number.',
      name: 'policyTelephoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goals specified in clause 2.1.2 of the Policy - Site user ID; phone number; nickname (nickname); E-mail address; floor; order delivery address; Payment Methods; fiscal receipt; information about purchased goods.`
  String get policyUserData1 {
    return Intl.message(
      ' As part of achieving the goals specified in clause 2.1.2 of the Policy - Site user ID; phone number; nickname (nickname); E-mail address; floor; order delivery address; Payment Methods; fiscal receipt; information about purchased goods.',
      name: 'policyUserData1',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goal specified in clause 2.1.3 of the Policy - full name; Date of Birth; citizenship; floor; details of identity documents; phone number; E-mail address; Site user ID.`
  String get policyUserData2 {
    return Intl.message(
      ' As part of achieving the goal specified in clause 2.1.3 of the Policy - full name; Date of Birth; citizenship; floor; details of identity documents; phone number; E-mail address; Site user ID.',
      name: 'policyUserData2',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goal specified in clause 2.1.4 of the Policy - full name; Date of Birth; details of identity documents; phone number; TIN; order delivery address; order list; Site user ID.`
  String get policyUserData3 {
    return Intl.message(
      ' As part of achieving the goal specified in clause 2.1.4 of the Policy - full name; Date of Birth; details of identity documents; phone number; TIN; order delivery address; order list; Site user ID.',
      name: 'policyUserData3',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goal specified in clause 2.1.5 of the Policy - full name; phone number; E-mail address; information about taking courses in educational institutions (regional department and/or association/union), Site user ID.`
  String get policyUserData4 {
    return Intl.message(
      ' As part of achieving the goal specified in clause 2.1.5 of the Policy - full name; phone number; E-mail address; information about taking courses in educational institutions (regional department and/or association/union), Site user ID.',
      name: 'policyUserData4',
      desc: '',
      args: [],
    );
  }

  /// ` As part of achieving the goal specified in clause 2.1.6 of the Policy - pseudonym (nickname); video recordings (without the purpose of identification).`
  String get policyUserData5 {
    return Intl.message(
      ' As part of achieving the goal specified in clause 2.1.6 of the Policy - pseudonym (nickname); video recordings (without the purpose of identification).',
      name: 'policyUserData5',
      desc: '',
      args: [],
    );
  }

  /// `5. Procedure and conditions for processing personal data`
  String get procedureConditions {
    return Intl.message(
      '5. Procedure and conditions for processing personal data',
      name: 'procedureConditions',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes and ensures the security of personal data for the implementation of the functions, powers and responsibilities assigned to the Company by the legislation of the Russian Federation, including, but not limited to, in accordance with the Constitution of the Russian Federation, federal laws, in particular Federal Law No. 152-FZ of July 27 2006 “On Personal Data”, by-laws, other defining cases and features of the processing of said personal data by the federal laws of the Russian Federation, as well as the Civil Code of the Russian Federation, Law of the Russian Federation No. 2300-1 of February 7, 1992 “On the Protection of Consumer Rights” , as well as the charter and local acts of the Company.`
  String get companyProcessesEnsures {
    return Intl.message(
      ' The Company processes and ensures the security of personal data for the implementation of the functions, powers and responsibilities assigned to the Company by the legislation of the Russian Federation, including, but not limited to, in accordance with the Constitution of the Russian Federation, federal laws, in particular Federal Law No. 152-FZ of July 27 2006 “On Personal Data”, by-laws, other defining cases and features of the processing of said personal data by the federal laws of the Russian Federation, as well as the Civil Code of the Russian Federation, Law of the Russian Federation No. 2300-1 of February 7, 1992 “On the Protection of Consumer Rights” , as well as the charter and local acts of the Company.',
      name: 'companyProcessesEnsures',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes personal data using automation tools, including collection, recording, systematization, accumulation, storage, clarification (updating, changing), extraction, use, transfer (provision, access, distribution), depersonalization, blocking, deletion, destruction of personal data within the time period necessary to achieve the purposes of processing personal data.`
  String get processesAutomationTools {
    return Intl.message(
      ' The Company processes personal data using automation tools, including collection, recording, systematization, accumulation, storage, clarification (updating, changing), extraction, use, transfer (provision, access, distribution), depersonalization, blocking, deletion, destruction of personal data within the time period necessary to achieve the purposes of processing personal data.',
      name: 'processesAutomationTools',
      desc: '',
      args: [],
    );
  }

  /// ` The registered user consents to the processing of personal data, valid from the date he begins using his personal account on the Site, and for a period of 30 days after the date of withdrawal of consent and deletion of the user’s personal account on the Site, since 30 days are necessary for the Company to complete the processing of all goods , returned by the user. Exceptions to this period are provided by the provisions of the Law.`
  String get registeredUserConsents {
    return Intl.message(
      ' The registered user consents to the processing of personal data, valid from the date he begins using his personal account on the Site, and for a period of 30 days after the date of withdrawal of consent and deletion of the user’s personal account on the Site, since 30 days are necessary for the Company to complete the processing of all goods , returned by the user. Exceptions to this period are provided by the provisions of the Law.',
      name: 'registeredUserConsents',
      desc: '',
      args: [],
    );
  }

  /// ` The Company does not process special categories of personal data and biometric personal data, except in cases where the processing of personal data is due to current business objectives, with the obligatory consent of the subject of personal data to the processing of personal data, or is necessary in accordance with the requirements of the legislation of the Russian Federation.`
  String get notProcessSpecialCategories {
    return Intl.message(
      ' The Company does not process special categories of personal data and biometric personal data, except in cases where the processing of personal data is due to current business objectives, with the obligatory consent of the subject of personal data to the processing of personal data, or is necessary in accordance with the requirements of the legislation of the Russian Federation.',
      name: 'notProcessSpecialCategories',
      desc: '',
      args: [],
    );
  }

  /// ` The Company has the right to entrust the processing of personal data to third parties - processors - on the basis of contracts concluded with these persons and with the consent of the subject of personal data. If the Company entrusts the processing of personal data to another person, the Company is responsible to the subject of personal data for the actions of the said person. The person processing personal data on behalf of the Company is responsible for the security of personal data and compliance with the requirements of the Law to the Company. A person processing personal data on behalf of the Operator is not required to obtain the consent of the subject of personal data to process his personal data.`
  String get rightEntrustProcessing {
    return Intl.message(
      ' The Company has the right to entrust the processing of personal data to third parties - processors - on the basis of contracts concluded with these persons and with the consent of the subject of personal data. If the Company entrusts the processing of personal data to another person, the Company is responsible to the subject of personal data for the actions of the said person. The person processing personal data on behalf of the Company is responsible for the security of personal data and compliance with the requirements of the Law to the Company. A person processing personal data on behalf of the Operator is not required to obtain the consent of the subject of personal data to process his personal data.',
      name: 'rightEntrustProcessing',
      desc: '',
      args: [],
    );
  }

  /// ` Persons processing personal data on the basis of an agreement concluded with the Company (operator’s instructions), under the terms of the agreements concluded with them, undertake to comply with the principles, rules for the processing and protection of personal data provided for by current legislation.`
  String get personsProcessingPersonal {
    return Intl.message(
      ' Persons processing personal data on the basis of an agreement concluded with the Company (operator’s instructions), under the terms of the agreements concluded with them, undertake to comply with the principles, rules for the processing and protection of personal data provided for by current legislation.',
      name: 'personsProcessingPersonal',
      desc: '',
      args: [],
    );
  }

  /// ` The Company has the right to entrust the processing of personal data, or to transfer the personal data specified in paragraphs. 4.2.1. — 4.2.7. Policy, to third parties only if there are proper grounds for processing, and also on the condition that the data will be transferred to the minimum extent necessary to achieve the specified purposes, and third parties will take measures aimed at complying with the requirements for ensuring the security of personal data to achieve the following purposes:`
  String get entrustProcessingPersonal {
    return Intl.message(
      ' The Company has the right to entrust the processing of personal data, or to transfer the personal data specified in paragraphs. 4.2.1. — 4.2.7. Policy, to third parties only if there are proper grounds for processing, and also on the condition that the data will be transferred to the minimum extent necessary to achieve the specified purposes, and third parties will take measures aimed at complying with the requirements for ensuring the security of personal data to achieve the following purposes:',
      name: 'entrustProcessingPersonal',
      desc: '',
      args: [],
    );
  }

  /// ` Delivery of orders and return of goods.`
  String get deliveryOrdersReturnGoods {
    return Intl.message(
      ' Delivery of orders and return of goods.',
      name: 'deliveryOrdersReturnGoods',
      desc: '',
      args: [],
    );
  }

  /// ` Receipt, processing and transfer of funds.`
  String get receiptProcessingTransfer {
    return Intl.message(
      ' Receipt, processing and transfer of funds.',
      name: 'receiptProcessingTransfer',
      desc: '',
      args: [],
    );
  }

  /// ` Carrying out customs clearance and delivery of goods in case of ordering goods from abroad.`
  String get carryingCustomsClearance {
    return Intl.message(
      ' Carrying out customs clearance and delivery of goods in case of ordering goods from abroad.',
      name: 'carryingCustomsClearance',
      desc: '',
      args: [],
    );
  }

  /// ` Issuing air and ground transport tickets, hotel reservations.`
  String get groundTransportTickets {
    return Intl.message(
      ' Issuing air and ground transport tickets, hotel reservations.',
      name: 'groundTransportTickets',
      desc: '',
      args: [],
    );
  }

  /// ` Completing training courses published by third parties on the Company’s Website.`
  String get completingTrainingCourses {
    return Intl.message(
      ' Completing training courses published by third parties on the Company’s Website.',
      name: 'completingTrainingCourses',
      desc: '',
      args: [],
    );
  }

  /// ` In accordance with clause 5.7. Policies, instructions for processing and transfer of personal data are carried out on the basis of agreements concluded by the Company with the following third parties: legal entities providing services to the Company, including ensuring security, delivery and customs clearance of goods; legal entities providing educational and other services to Registered users of the Site. The assignment of processing and transfer of personal data is carried out in cases provided for by agreements in which the subject of personal data is a party, beneficiary or guarantor, in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila -polzovaniya-torgovoy-ploshchadkoy.`
  String get policiesInstructionsTransfer {
    return Intl.message(
      ' In accordance with clause 5.7. Policies, instructions for processing and transfer of personal data are carried out on the basis of agreements concluded by the Company with the following third parties: legal entities providing services to the Company, including ensuring security, delivery and customs clearance of goods; legal entities providing educational and other services to Registered users of the Site. The assignment of processing and transfer of personal data is carried out in cases provided for by agreements in which the subject of personal data is a party, beneficiary or guarantor, in accordance with the Rules for using the Easy Shoppin trading platform, located at https://www.easyshoppin.ru/services/pravila -polzovaniya-torgovoy-ploshchadkoy.',
      name: 'policiesInstructionsTransfer',
      desc: '',
      args: [],
    );
  }

  /// ` The Company undertakes and obliges persons authorized to process personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data, unless otherwise provided by federal law.`
  String get obligesPersonsAuthorized {
    return Intl.message(
      ' The Company undertakes and obliges persons authorized to process personal data not to disclose to third parties or distribute personal data without the consent of the subject of personal data, unless otherwise provided by federal law.',
      name: 'obligesPersonsAuthorized',
      desc: '',
      args: [],
    );
  }

  /// ` The procedure for destroying personal data on media containing personal data, including external/removable electronic media, paper media and in personal data information systems, is determined by the Company in its internal documents and local regulations.`
  String get destroyingPersonalData {
    return Intl.message(
      ' The procedure for destroying personal data on media containing personal data, including external/removable electronic media, paper media and in personal data information systems, is determined by the Company in its internal documents and local regulations.',
      name: 'destroyingPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` The Company does not verify (does not have the ability to verify) the relevance and accuracy of the information provided by personal data subjects obtained through the Site. The Company proceeds from the fact that subjects of personal data provide reliable and sufficient personal data and keep them up to date.`
  String get companyNotVerify {
    return Intl.message(
      ' The Company does not verify (does not have the ability to verify) the relevance and accuracy of the information provided by personal data subjects obtained through the Site. The Company proceeds from the fact that subjects of personal data provide reliable and sufficient personal data and keep them up to date.',
      name: 'companyNotVerify',
      desc: '',
      args: [],
    );
  }

  /// ` The Company does not control compliance with the terms of confidentiality and processing of personal data of personal data subjects by owners or users of other sites to which the subject of personal data can click on links available on the Site, and is not responsible for the actions or inactions of owners or users of such sites in the field of processing personal data. data and privacy.`
  String get controlComplianceTerms {
    return Intl.message(
      ' The Company does not control compliance with the terms of confidentiality and processing of personal data of personal data subjects by owners or users of other sites to which the subject of personal data can click on links available on the Site, and is not responsible for the actions or inactions of owners or users of such sites in the field of processing personal data. data and privacy.',
      name: 'controlComplianceTerms',
      desc: '',
      args: [],
    );
  }

  /// ` Representatives of authorized government bodies (including regulatory, supervisory, law enforcement, inquiry and investigation) receive access to personal data processed in the Company to the extent and in the manner established by the legislation of the Russian Federation.`
  String get representativesAuthorized {
    return Intl.message(
      ' Representatives of authorized government bodies (including regulatory, supervisory, law enforcement, inquiry and investigation) receive access to personal data processed in the Company to the extent and in the manner established by the legislation of the Russian Federation.',
      name: 'representativesAuthorized',
      desc: '',
      args: [],
    );
  }

  /// ` The Company takes the necessary legal, organizational and technical measures to protect personal data from unauthorized or accidental access, destruction, modification, blocking, copying, provision, distribution of personal data, as well as from other unlawful actions in relation to personal data in accordance with legal requirements Russian Federation and internal documents. Ensuring the security of personal data and fulfillment of the Company’s obligations in accordance with the Law is achieved, including:`
  String get companyNecessaryLegal {
    return Intl.message(
      ' The Company takes the necessary legal, organizational and technical measures to protect personal data from unauthorized or accidental access, destruction, modification, blocking, copying, provision, distribution of personal data, as well as from other unlawful actions in relation to personal data in accordance with legal requirements Russian Federation and internal documents. Ensuring the security of personal data and fulfillment of the Company’s obligations in accordance with the Law is achieved, including:',
      name: 'companyNecessaryLegal',
      desc: '',
      args: [],
    );
  }

  /// ` Determining threats to the security of personal data during their processing in personal data information systems.`
  String get determiningThreatsSecurity {
    return Intl.message(
      ' Determining threats to the security of personal data during their processing in personal data information systems.',
      name: 'determiningThreatsSecurity',
      desc: '',
      args: [],
    );
  }

  /// ` Application of organizational and technical measures to ensure the security of personal data during their processing in personal data information systems necessary to fulfill the requirements for the protection of personal data, the implementation of which ensures the levels of personal data security established by the Government of the Russian Federation.`
  String get applicationOrganizational {
    return Intl.message(
      ' Application of organizational and technical measures to ensure the security of personal data during their processing in personal data information systems necessary to fulfill the requirements for the protection of personal data, the implementation of which ensures the levels of personal data security established by the Government of the Russian Federation.',
      name: 'applicationOrganizational',
      desc: '',
      args: [],
    );
  }

  /// ` Assessing the effectiveness of measures taken to ensure the security of personal data before putting into operation the personal data information system.`
  String get assessingEffectiveness {
    return Intl.message(
      ' Assessing the effectiveness of measures taken to ensure the security of personal data before putting into operation the personal data information system.',
      name: 'assessingEffectiveness',
      desc: '',
      args: [],
    );
  }

  /// ` Appointment of a person responsible for organizing the processing of personal data.`
  String get appointmentPersonResponsible {
    return Intl.message(
      ' Appointment of a person responsible for organizing the processing of personal data.',
      name: 'appointmentPersonResponsible',
      desc: '',
      args: [],
    );
  }

  /// ` Publication by the Company of documents defining the Company's policy regarding the processing of personal data, local acts on the processing of personal data, defining for each purpose of processing personal data the categories and list of processed personal data, categories of subjects whose personal data is processed, methods, terms of their processing and storage , the procedure for the destruction of personal data upon achieving the purposes of their processing or upon the occurrence of other legal grounds, as well as local acts establishing procedures aimed at preventing and identifying violations of the legislation of the Russian Federation, eliminating the consequences of such violations. Such documents and local acts cannot contain provisions limiting the rights of personal data subjects, as well as imposing on the Company powers and obligations not provided for by the legislation of the Russian Federation.`
  String get publicationCompanyDocuments {
    return Intl.message(
      ' Publication by the Company of documents defining the Company\'s policy regarding the processing of personal data, local acts on the processing of personal data, defining for each purpose of processing personal data the categories and list of processed personal data, categories of subjects whose personal data is processed, methods, terms of their processing and storage , the procedure for the destruction of personal data upon achieving the purposes of their processing or upon the occurrence of other legal grounds, as well as local acts establishing procedures aimed at preventing and identifying violations of the legislation of the Russian Federation, eliminating the consequences of such violations. Such documents and local acts cannot contain provisions limiting the rights of personal data subjects, as well as imposing on the Company powers and obligations not provided for by the legislation of the Russian Federation.',
      name: 'publicationCompanyDocuments',
      desc: '',
      args: [],
    );
  }

  /// ` Carrying out internal control and (or) audit of compliance of personal data processing with the Law and regulatory legal acts adopted in accordance with it, requirements for the protection of personal data, the Company’s policy regarding the processing of personal data, internal documents of the Company.`
  String get carryingInternalControl {
    return Intl.message(
      ' Carrying out internal control and (or) audit of compliance of personal data processing with the Law and regulatory legal acts adopted in accordance with it, requirements for the protection of personal data, the Company’s policy regarding the processing of personal data, internal documents of the Company.',
      name: 'carryingInternalControl',
      desc: '',
      args: [],
    );
  }

  /// ` Familiarization of the Company's employees directly involved in the processing of personal data with the provisions of the legislation of the Russian Federation on personal data, including requirements for the protection of personal data, documents defining the Company's policy regarding the processing of personal data, local regulations on the processing of personal data, and (or ) training of these employees.`
  String get familiarizationCompanys {
    return Intl.message(
      ' Familiarization of the Company\'s employees directly involved in the processing of personal data with the provisions of the legislation of the Russian Federation on personal data, including requirements for the protection of personal data, documents defining the Company\'s policy regarding the processing of personal data, local regulations on the processing of personal data, and (or ) training of these employees.',
      name: 'familiarizationCompanys',
      desc: '',
      args: [],
    );
  }

  /// ` Assessment of harm in accordance with the requirements established by the authorized body for the protection of the rights of personal data subjects that may be caused to personal data subjects in the event of a violation of this Federal Law, the relationship between this harm and the measures taken by the operator aimed at ensuring the fulfillment of the obligations provided for by this Federal Law.`
  String get assessmentAccordance {
    return Intl.message(
      ' Assessment of harm in accordance with the requirements established by the authorized body for the protection of the rights of personal data subjects that may be caused to personal data subjects in the event of a violation of this Federal Law, the relationship between this harm and the measures taken by the operator aimed at ensuring the fulfillment of the obligations provided for by this Federal Law.',
      name: 'assessmentAccordance',
      desc: '',
      args: [],
    );
  }

  /// ` Detection of facts of unauthorized access to personal data and taking measures, including measures to detect, prevent and eliminate the consequences of computer attacks on personal data information systems and to respond to computer incidents in them.`
  String get detectionFactsUnauthorized {
    return Intl.message(
      ' Detection of facts of unauthorized access to personal data and taking measures, including measures to detect, prevent and eliminate the consequences of computer attacks on personal data information systems and to respond to computer incidents in them.',
      name: 'detectionFactsUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// ` Control over the measures taken to ensure the security of personal data and the level of security of personal data information systems.`
  String get controlSecurityPersonalData {
    return Intl.message(
      ' Control over the measures taken to ensure the security of personal data and the level of security of personal data information systems.',
      name: 'controlSecurityPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` The Company stops processing personal data and destroys it in the following cases:`
  String get companyStops {
    return Intl.message(
      ' The Company stops processing personal data and destroys it in the following cases:',
      name: 'companyStops',
      desc: '',
      args: [],
    );
  }

  /// ` liquidation of the Company;`
  String get liquidationCompany {
    return Intl.message(
      ' liquidation of the Company;',
      name: 'liquidationCompany',
      desc: '',
      args: [],
    );
  }

  /// ` reorganization of the Company, entailing the termination of its activities;`
  String get reorganizationCompany {
    return Intl.message(
      ' reorganization of the Company, entailing the termination of its activities;',
      name: 'reorganizationCompany',
      desc: '',
      args: [],
    );
  }

  /// ` termination of the legal grounds for processing personal data and/or achieving the purposes of processing personal data;`
  String get terminationLegalGrounds {
    return Intl.message(
      ' termination of the legal grounds for processing personal data and/or achieving the purposes of processing personal data;',
      name: 'terminationLegalGrounds',
      desc: '',
      args: [],
    );
  }

  /// ` revocation of the consent of the subject of personal data to the processing of personal data.`
  String get revocationConsentSubject {
    return Intl.message(
      ' revocation of the consent of the subject of personal data to the processing of personal data.',
      name: 'revocationConsentSubject',
      desc: '',
      args: [],
    );
  }

  /// ` The storage of personal data is carried out by the Company in a form that allows identifying the subject of personal data no longer than required by the purposes of processing personal data and in accordance with the provisions of the Law.`
  String get storagePersonalData {
    return Intl.message(
      ' The storage of personal data is carried out by the Company in a form that allows identifying the subject of personal data no longer than required by the purposes of processing personal data and in accordance with the provisions of the Law.',
      name: 'storagePersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.`
  String get collectingPersonalData {
    return Intl.message(
      ' When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.',
      name: 'collectingPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` The procedure for the destruction of personal data on media containing personal data, including external/removable electronic media, paper media and personal data information systems, is being developed in accordance with the Order of the Federal Service for Supervision of Communications, Information Technology and Mass Communications dated October 28 2022 No. 179 “On approval of the Requirements for confirming the destruction of personal data” and is enshrined in the Rules for the destruction and depersonalization of personal data of the Company.`
  String get procedureDestruction {
    return Intl.message(
      ' The procedure for the destruction of personal data on media containing personal data, including external/removable electronic media, paper media and personal data information systems, is being developed in accordance with the Order of the Federal Service for Supervision of Communications, Information Technology and Mass Communications dated October 28 2022 No. 179 “On approval of the Requirements for confirming the destruction of personal data” and is enshrined in the Rules for the destruction and depersonalization of personal data of the Company.',
      name: 'procedureDestruction',
      desc: '',
      args: [],
    );
  }

  /// ` Consent to the processing of personal data can be withdrawn by the subject of personal data, including by clicking on the special “Delete personal account” button on the Site.`
  String get deletePersonalAccount {
    return Intl.message(
      ' Consent to the processing of personal data can be withdrawn by the subject of personal data, including by clicking on the special “Delete personal account” button on the Site.',
      name: 'deletePersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// `6. Responses to requests from subjects for access to personal data`
  String get responsesRequests {
    return Intl.message(
      '6. Responses to requests from subjects for access to personal data',
      name: 'responsesRequests',
      desc: '',
      args: [],
    );
  }

  /// ` When collecting personal data, the Company is obliged to provide the subject of personal data, at his request, with the information provided for in Part 7 of Article 14 of the Law.`
  String get collectingPersonalDataCompany {
    return Intl.message(
      ' When collecting personal data, the Company is obliged to provide the subject of personal data, at his request, with the information provided for in Part 7 of Article 14 of the Law.',
      name: 'collectingPersonalDataCompany',
      desc: '',
      args: [],
    );
  }

  /// ` The subject of personal data has the right to demand from the Company clarification of his personal data, blocking or destruction of it if the personal data is incomplete, outdated, inaccurate, illegally obtained or is not necessary for the stated purpose of processing, as well as take measures provided by law to protect his rights.`
  String get demandCompanyClarification {
    return Intl.message(
      ' The subject of personal data has the right to demand from the Company clarification of his personal data, blocking or destruction of it if the personal data is incomplete, outdated, inaccurate, illegally obtained or is not necessary for the stated purpose of processing, as well as take measures provided by law to protect his rights.',
      name: 'demandCompanyClarification',
      desc: '',
      args: [],
    );
  }

  /// ` The subject of personal data has the right to apply to the Company with a request to stop the transfer (distribution, provision, access) of his personal data, previously authorized by the Subject of personal data, in terms of the specified actions for distribution, in case of non-compliance with the provisions of Article 10.1 of the Law, or to apply with such a demand to the court . The Company is obliged to stop the transfer (distribution, provision, access) of personal data within three working days from the receipt of the request of the subject of personal data or within the period specified in the court decision that has entered into legal force, and if such a period is not specified in the court decision, then within three working days from the moment the court decision enters into legal force.`
  String get stopTransfer {
    return Intl.message(
      ' The subject of personal data has the right to apply to the Company with a request to stop the transfer (distribution, provision, access) of his personal data, previously authorized by the Subject of personal data, in terms of the specified actions for distribution, in case of non-compliance with the provisions of Article 10.1 of the Law, or to apply with such a demand to the court . The Company is obliged to stop the transfer (distribution, provision, access) of personal data within three working days from the receipt of the request of the subject of personal data or within the period specified in the court decision that has entered into legal force, and if such a period is not specified in the court decision, then within three working days from the moment the court decision enters into legal force.',
      name: 'stopTransfer',
      desc: '',
      args: [],
    );
  }

  /// ` The subject of personal data has the right to appeal the actions or inaction of the Company to the Federal Service for Supervision in the Sphere of Communications, Information Technologies and Mass Communications (Roskomnadzor) or in court if the subject of personal data believes that the Company is processing his personal data in violation of the requirements of the Law or otherwise violates his rights and freedoms.`
  String get appealInactionCompany {
    return Intl.message(
      ' The subject of personal data has the right to appeal the actions or inaction of the Company to the Federal Service for Supervision in the Sphere of Communications, Information Technologies and Mass Communications (Roskomnadzor) or in court if the subject of personal data believes that the Company is processing his personal data in violation of the requirements of the Law or otherwise violates his rights and freedoms.',
      name: 'appealInactionCompany',
      desc: '',
      args: [],
    );
  }

  /// ` To exercise his rights and protect legitimate interests, the subject of personal data has the right to contact the Company. To send official requests to the Company, you must use the contact information specified in paragraphs. 6.17., 6.18. Politicians.`
  String get protectLegitimateInterests {
    return Intl.message(
      ' To exercise his rights and protect legitimate interests, the subject of personal data has the right to contact the Company. To send official requests to the Company, you must use the contact information specified in paragraphs. 6.17., 6.18. Politicians.',
      name: 'protectLegitimateInterests',
      desc: '',
      args: [],
    );
  }

  /// ` If unlawful processing of personal data is detected upon application by the subject of personal data or his representative or at the request of the subject of personal data or his representative or the authorized body for the protection of the rights of personal data subjects, the operator is obliged to block unlawfully processed personal data relating to this subject of personal data, or ensure their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) from the moment of such an appeal or receipt of the specified request for the period of verification.`
  String get unlawfulProcessing {
    return Intl.message(
      ' If unlawful processing of personal data is detected upon application by the subject of personal data or his representative or at the request of the subject of personal data or his representative or the authorized body for the protection of the rights of personal data subjects, the operator is obliged to block unlawfully processed personal data relating to this subject of personal data, or ensure their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) from the moment of such an appeal or receipt of the specified request for the period of verification.',
      name: 'unlawfulProcessing',
      desc: '',
      args: [],
    );
  }

  /// ` If inaccurate personal data is identified when contacting the subject of personal data or his representative or at their request or at the request of the authorized body for the protection of the rights of subjects of personal data, the operator is obliged to block personal data relating to this subject of personal data or ensure their blocking (if processing personal data is carried out by another person acting on behalf of the operator) from the moment of such application or receipt of the specified request for the period of verification, if blocking of personal data does not violate the rights and legitimate interests of the subject of personal data or third parties.`
  String get inaccuratePersonalData {
    return Intl.message(
      ' If inaccurate personal data is identified when contacting the subject of personal data or his representative or at their request or at the request of the authorized body for the protection of the rights of subjects of personal data, the operator is obliged to block personal data relating to this subject of personal data or ensure their blocking (if processing personal data is carried out by another person acting on behalf of the operator) from the moment of such application or receipt of the specified request for the period of verification, if blocking of personal data does not violate the rights and legitimate interests of the subject of personal data or third parties.',
      name: 'inaccuratePersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` If the fact of inaccuracy of personal data is confirmed, the Company, on the basis of information provided by the subject of personal data or his representative or an authorized body for the protection of the rights of subjects of personal data, or other necessary documents, is obliged to clarify the personal data or ensure their clarification (if the processing of personal data is carried out by another person, acting on behalf of the operator) within seven working days from the date of submission of such information and remove the blocking of personal data.`
  String get factInaccuracyPersonalData {
    return Intl.message(
      ' If the fact of inaccuracy of personal data is confirmed, the Company, on the basis of information provided by the subject of personal data or his representative or an authorized body for the protection of the rights of subjects of personal data, or other necessary documents, is obliged to clarify the personal data or ensure their clarification (if the processing of personal data is carried out by another person, acting on behalf of the operator) within seven working days from the date of submission of such information and remove the blocking of personal data.',
      name: 'factInaccuracyPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` If the purpose of processing personal data is achieved, the Company is obliged to stop processing personal data or ensure its termination (if the processing of personal data is carried out by another person acting on behalf of the operator) and destroy personal data or ensure its destruction (if the processing of personal data is carried out by another person acting on behalf of the operator). on behalf of the Company) within a period not exceeding thirty days from the date of achieving the purpose of processing personal data, unless otherwise provided by an agreement to which the subject of personal data is a party, beneficiary or guarantor, another agreement between the Company and the subject of personal data, or if the Company has no right carry out the processing of personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.`
  String get purposeProcessingPersonalData {
    return Intl.message(
      ' If the purpose of processing personal data is achieved, the Company is obliged to stop processing personal data or ensure its termination (if the processing of personal data is carried out by another person acting on behalf of the operator) and destroy personal data or ensure its destruction (if the processing of personal data is carried out by another person acting on behalf of the operator). on behalf of the Company) within a period not exceeding thirty days from the date of achieving the purpose of processing personal data, unless otherwise provided by an agreement to which the subject of personal data is a party, beneficiary or guarantor, another agreement between the Company and the subject of personal data, or if the Company has no right carry out the processing of personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.',
      name: 'purposeProcessingPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` If the subject of personal data withdraws consent to the processing of his personal data, the Company is obliged to stop processing them or ensure the termination of such processing (if the processing of personal data is carried out by another person acting on behalf of the Company) and in the event that the preservation of personal data is no longer required for the purposes of processing personal data, destroy personal data or ensure their destruction (if the processing of personal data is carried out by another person acting on behalf of the Company) within a period not exceeding thirty days from the date of receipt of the said response, unless otherwise provided by the agreement to which the beneficiary or guarantor is a party which is the subject of personal data, another agreement between the Company and the subject of personal data, or if the Company does not have the right to process personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.`
  String get withdrawsConsent {
    return Intl.message(
      ' If the subject of personal data withdraws consent to the processing of his personal data, the Company is obliged to stop processing them or ensure the termination of such processing (if the processing of personal data is carried out by another person acting on behalf of the Company) and in the event that the preservation of personal data is no longer required for the purposes of processing personal data, destroy personal data or ensure their destruction (if the processing of personal data is carried out by another person acting on behalf of the Company) within a period not exceeding thirty days from the date of receipt of the said response, unless otherwise provided by the agreement to which the beneficiary or guarantor is a party which is the subject of personal data, another agreement between the Company and the subject of personal data, or if the Company does not have the right to process personal data without the consent of the subject of personal data on the grounds provided for by the Law or other federal laws.',
      name: 'withdrawsConsent',
      desc: '',
      args: [],
    );
  }

  /// ` If a subject of personal data applies to the Company with a request to stop processing personal data, the Company is obliged, within a period not exceeding ten working days from the date the Company receives the corresponding request, to stop processing them or ensure the termination of such processing (if such processing is carried out by the person processing personal data). data), except for the cases provided for in paragraphs 2 - 11 of part 1 of Article 6, part 2 of Article 10 and part 2 of Article 11 of the Law. This period may be extended, but not more than by five working days, if the operator sends a motivated notification to the personal data subject indicating the reasons for extending the period for providing the requested information.`
  String get subjectPersonalDataApplies {
    return Intl.message(
      ' If a subject of personal data applies to the Company with a request to stop processing personal data, the Company is obliged, within a period not exceeding ten working days from the date the Company receives the corresponding request, to stop processing them or ensure the termination of such processing (if such processing is carried out by the person processing personal data). data), except for the cases provided for in paragraphs 2 - 11 of part 1 of Article 6, part 2 of Article 10 and part 2 of Article 11 of the Law. This period may be extended, but not more than by five working days, if the operator sends a motivated notification to the personal data subject indicating the reasons for extending the period for providing the requested information.',
      name: 'subjectPersonalDataApplies',
      desc: '',
      args: [],
    );
  }

  /// ` If it is not possible to destroy personal data within the period established by the Law, the Company blocks such personal data or ensures their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) and ensures the destruction of personal data within a period of no more than six months , unless another period is established by federal laws.`
  String get possibleDestroyPersonalData {
    return Intl.message(
      ' If it is not possible to destroy personal data within the period established by the Law, the Company blocks such personal data or ensures their blocking (if the processing of personal data is carried out by another person acting on behalf of the operator) and ensures the destruction of personal data within a period of no more than six months , unless another period is established by federal laws.',
      name: 'possibleDestroyPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` If the personal data processed by the Company for the purposes of purchasing air and (or) ground transport tickets is not received from the subject of personal data, then such personal data is considered by the Company to have been legally received by the Registered User of the Site, transferring to the Company the personal data of the subject of personal data. Before processing such personal data, the Company is obliged to notify the subject of personal data and provide him with the following information:`
  String get personalDataProcessed {
    return Intl.message(
      ' If the personal data processed by the Company for the purposes of purchasing air and (or) ground transport tickets is not received from the subject of personal data, then such personal data is considered by the Company to have been legally received by the Registered User of the Site, transferring to the Company the personal data of the subject of personal data. Before processing such personal data, the Company is obliged to notify the subject of personal data and provide him with the following information:',
      name: 'personalDataProcessed',
      desc: '',
      args: [],
    );
  }

  /// ` Name and address of the Company or its representative.`
  String get nameAddressCompany {
    return Intl.message(
      ' Name and address of the Company or its representative.',
      name: 'nameAddressCompany',
      desc: '',
      args: [],
    );
  }

  /// ` Purpose of processing personal data and its legal basis.`
  String get purposeProcessingPersonal {
    return Intl.message(
      ' Purpose of processing personal data and its legal basis.',
      name: 'purposeProcessingPersonal',
      desc: '',
      args: [],
    );
  }

  /// ` List of personal data.`
  String get listPersonalData {
    return Intl.message(
      ' List of personal data.',
      name: 'listPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Intended users of personal data.`
  String get intendedUsersPersonalData {
    return Intl.message(
      ' Intended users of personal data.',
      name: 'intendedUsersPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Rights of the subject of personal data established by law.`
  String get rightsSubjectPersonalData {
    return Intl.message(
      ' Rights of the subject of personal data established by law.',
      name: 'rightsSubjectPersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Source of personal data.`
  String get sourcePersonalData {
    return Intl.message(
      ' Source of personal data.',
      name: 'sourcePersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` The Company is released from the obligation to provide the subject of personal data with the information provided for in the relevant paragraphs of this Policy in cases where:`
  String get companyReleased {
    return Intl.message(
      ' The Company is released from the obligation to provide the subject of personal data with the information provided for in the relevant paragraphs of this Policy in cases where:',
      name: 'companyReleased',
      desc: '',
      args: [],
    );
  }

  /// ` The subject of personal data is notified of the processing of his personal data by the Company.`
  String get personalDataNotified {
    return Intl.message(
      ' The subject of personal data is notified of the processing of his personal data by the Company.',
      name: 'personalDataNotified',
      desc: '',
      args: [],
    );
  }

  /// ` The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.`
  String get personalDataAuthorized {
    return Intl.message(
      ' The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.',
      name: 'personalDataAuthorized',
      desc: '',
      args: [],
    );
  }

  /// ` The Company processes personal data for statistical or other research purposes, unless the rights and legitimate interests of the subject of personal data are violated.`
  String get personalDataStatistical {
    return Intl.message(
      ' The Company processes personal data for statistical or other research purposes, unless the rights and legitimate interests of the subject of personal data are violated.',
      name: 'personalDataStatistical',
      desc: '',
      args: [],
    );
  }

  /// ` Providing the subject of personal data with the information provided for in the relevant paragraphs of this Policy violates the rights and legitimate interests of third parties.`
  String get relevantParagraphs {
    return Intl.message(
      ' Providing the subject of personal data with the information provided for in the relevant paragraphs of this Policy violates the rights and legitimate interests of third parties.',
      name: 'relevantParagraphs',
      desc: '',
      args: [],
    );
  }

  /// ` When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.`
  String get companyEnsuresRecording {
    return Intl.message(
      ' When collecting personal data, the Company ensures recording, systematization, accumulation, storage, clarification (updating, changing), retrieval of personal data of citizens of the Russian Federation using databases located on the territory of the Russian Federation, except for cases provided for by the Law.',
      name: 'companyEnsuresRecording',
      desc: '',
      args: [],
    );
  }

  /// ` The Company considers any requests and complaints from subjects of personal data, investigates violations and takes all necessary measures to immediately eliminate them and resolve disputes out of court. The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.`
  String get investigatesViolations {
    return Intl.message(
      ' The Company considers any requests and complaints from subjects of personal data, investigates violations and takes all necessary measures to immediately eliminate them and resolve disputes out of court. The processing of personal data authorized by the subject of personal data for distribution is carried out in compliance with the prohibitions and conditions provided for in Article 10.1 of the Law.',
      name: 'investigatesViolations',
      desc: '',
      args: [],
    );
  }

  /// ` A written request from a personal data subject to provide information regarding the processing of his personal data must contain the mandatory information established by Part 3 of Article 14 of the Law, including the telephone number used to enter the Site. A written appeal (request) is sent to the legal address of the Company: 142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1.`
  String get informationRegardingProcessing {
    return Intl.message(
      ' A written request from a personal data subject to provide information regarding the processing of his personal data must contain the mandatory information established by Part 3 of Article 14 of the Law, including the telephone number used to enter the Site. A written appeal (request) is sent to the legal address of the Company: 142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1.',
      name: 'informationRegardingProcessing',
      desc: '',
      args: [],
    );
  }

  /// ` The request can also be sent by the subject of personal data in the form of an electronic document and signed with an electronic signature in accordance with the legislation of the Russian Federation. To obtain information about your personal data, familiarize yourself with it, clarify it, block or destroy it, or withdraw consent to its processing, requests can be sent to the email address: sales@easyshoppin.ru.`
  String get electronicDocument {
    return Intl.message(
      ' The request can also be sent by the subject of personal data in the form of an electronic document and signed with an electronic signature in accordance with the legislation of the Russian Federation. To obtain information about your personal data, familiarize yourself with it, clarify it, block or destroy it, or withdraw consent to its processing, requests can be sent to the email address: sales@easyshoppin.ru.',
      name: 'electronicDocument',
      desc: '',
      args: [],
    );
  }

  /// ` Interaction on other issues related to the processing of personal data by the Company is also carried out using the following contact information: postal address (142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1) and / or email address (sales@easyshoppin.ru).`
  String get interactionOtherIssues {
    return Intl.message(
      ' Interaction on other issues related to the processing of personal data by the Company is also carried out using the following contact information: postal address (142181, Moscow region, Podolsk, Koledino village, Territory Industrial Park Koledino, 6, building 1) and / or email address (sales@easyshoppin.ru).',
      name: 'interactionOtherIssues',
      desc: '',
      args: [],
    );
  }

  /// `1. Terms`
  String get terms {
    return Intl.message(
      '1. Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// ` In these rules, unless the context otherwise requires, the following terms have the following meanings:\n`
  String get termsRules {
    return Intl.message(
      ' In these rules, unless the context otherwise requires, the following terms have the following meanings:\n',
      name: 'termsRules',
      desc: '',
      args: [],
    );
  }

  /// ` - the website https://www.easyshoppin.ru and the Easy Shoppin mobile application, which are a service that provides access to information about products intended for potential Buyers (consumers).`
  String get tradingPlatform {
    return Intl.message(
      ' - the website https://www.easyshoppin.ru and the Easy Shoppin mobile application, which are a service that provides access to information about products intended for potential Buyers (consumers).',
      name: 'tradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - of the Trading Platform is Easy Shoppin LLC (according to the text of these Rules - Easy Shoppin (Legal address: 142181 Ulyanovsk region, building 1, OGRN 1067746062449, Email: sale@easyshoppin.ru).`
  String get ownerPlatform {
    return Intl.message(
      ' - of the Trading Platform is Easy Shoppin LLC (according to the text of these Rules - Easy Shoppin (Legal address: 142181 Ulyanovsk region, building 1, OGRN 1067746062449, Email: sale@easyshoppin.ru).',
      name: 'ownerPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - any individual using the Trading Platform under the terms of these Rules.`
  String get userTradingPlatform {
    return Intl.message(
      ' - any individual using the Trading Platform under the terms of these Rules.',
      name: 'userTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` is an individual entrepreneur, legal entity or self-employed citizen, duly registered in Russian or foreign jurisdiction, engaged in the sale of goods and offering the Buyer to enter into a purchase and sale agreement for the Goods by placing the Goods on the Marketplace.`
  String get sellerTradingPlatform {
    return Intl.message(
      ' is an individual entrepreneur, legal entity or self-employed citizen, duly registered in Russian or foreign jurisdiction, engaged in the sale of goods and offering the Buyer to enter into a purchase and sale agreement for the Goods by placing the Goods on the Marketplace.',
      name: 'sellerTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - an individual who purchases Goods on the Marketplace for personal and/or household needs not related to business activities, by placing and paying for an Order through the payment services of the Marketplace.`
  String get bayerTradingPlatform {
    return Intl.message(
      ' - an individual who purchases Goods on the Marketplace for personal and/or household needs not related to business activities, by placing and paying for an Order through the payment services of the Marketplace.',
      name: 'bayerTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - are the subject of a purchase and sale agreement concluded between the Buyer and the Seller. The Seller is the owner of the Goods being sold. All relationships related to the purchase and sale of Goods arise between the Seller, who places the Goods on the Marketplace, and the Buyer.`
  String get goodsTradingPlatform {
    return Intl.message(
      ' - are the subject of a purchase and sale agreement concluded between the Buyer and the Seller. The Seller is the owner of the Goods being sold. All relationships related to the purchase and sale of Goods arise between the Seller, who places the Goods on the Marketplace, and the Buyer.',
      name: 'goodsTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - is a personal section of the Trading Platform that is not accessible to third parties, created by the Buyer and used for the purpose of placing Orders and processing Services, as well as receiving special offers in accordance with these Rules, which is accessed after registration by entering the Buyer’s authentication data.`
  String get personalAccountPlatform {
    return Intl.message(
      ' - is a personal section of the Trading Platform that is not accessible to third parties, created by the Buyer and used for the purpose of placing Orders and processing Services, as well as receiving special offers in accordance with these Rules, which is accessed after registration by entering the Buyer’s authentication data.',
      name: 'personalAccountPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - point is a unit of the logistics infrastructure that issues Orders to Buyers who have indicated the address of the corresponding Order pick-up point as the delivery location.`
  String get orderPickUpPlatform {
    return Intl.message(
      ' - point is a unit of the logistics infrastructure that issues Orders to Buyers who have indicated the address of the corresponding Order pick-up point as the delivery location.',
      name: 'orderPickUpPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` - is an automated terminal for issuing goods.`
  String get postamat {
    return Intl.message(
      ' - is an automated terminal for issuing goods.',
      name: 'postamat',
      desc: '',
      args: [],
    );
  }

  /// ` - the implementation by the Buyer of actions aimed at concluding an agreement for the provision of delivery services for the Goods, as well as an agreement/sales agreements for the corresponding Goods/Goods with Easy Shoppin  and/or other Seller/Sellers, by registering the specified services and Goods on the Marketplace.`
  String get orderBayer {
    return Intl.message(
      ' - the implementation by the Buyer of actions aimed at concluding an agreement for the provision of delivery services for the Goods, as well as an agreement/sales agreements for the corresponding Goods/Goods with Easy Shoppin  and/or other Seller/Sellers, by registering the specified services and Goods on the Marketplace.',
      name: 'orderBayer',
      desc: '',
      args: [],
    );
  }

  /// ` - delivery services provided by Easy Shoppin to the Buyer in relation to Goods purchased by the Buyer from Easy Shoppin or other Sellers on the Marketplace or returned by the Buyer to Easy Shoppin  or the Seller.`
  String get servicesDelivery {
    return Intl.message(
      ' - delivery services provided by Easy Shoppin to the Buyer in relation to Goods purchased by the Buyer from Easy Shoppin or other Sellers on the Marketplace or returned by the Buyer to Easy Shoppin  or the Seller.',
      name: 'servicesDelivery',
      desc: '',
      args: [],
    );
  }

  /// ` - delivery of goods to the address specified by the Buyer, different from the addresses of Order Pickup Points and Post Office addresses.`
  String get deliveryGoods {
    return Intl.message(
      ' - delivery of goods to the address specified by the Buyer, different from the addresses of Order Pickup Points and Post Office addresses.',
      name: 'deliveryGoods',
      desc: '',
      args: [],
    );
  }

  /// `- is a loyalty program conducted by Easy Shoppin, which includes special conditions for ordering certain Products.`
  String get promotionLoyalty {
    return Intl.message(
      '- is a loyalty program conducted by Easy Shoppin, which includes special conditions for ordering certain Products.',
      name: 'promotionLoyalty',
      desc: '',
      args: [],
    );
  }

  /// `- is a discount that is provided on a specific Product. The discount amount is indicated on the Product page. The price of the Product is indicated taking into account the promotional discount. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.`
  String get promotionalDiscount {
    return Intl.message(
      '- is a discount that is provided on a specific Product. The discount amount is indicated on the Product page. The price of the Product is indicated taking into account the promotional discount. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.',
      name: 'promotionalDiscount',
      desc: '',
      args: [],
    );
  }

  /// `- discount using a is a discount that is provided for a specific group of Products when the Buyer places an Order. The price difference between a product without a discount and a product with a discount is the advantage of the final Buyer within the framework of the action to purchase a specific specified product`
  String get discountPromotionalCode {
    return Intl.message(
      '- discount using a is a discount that is provided for a specific group of Products when the Buyer places an Order. The price difference between a product without a discount and a product with a discount is the advantage of the final Buyer within the framework of the action to purchase a specific specified product',
      name: 'discountPromotionalCode',
      desc: '',
      args: [],
    );
  }

  /// `- code is a special code that provides a discount on a specific group of Products and has an expiration date. Promo codes are applied automatically. Only one promotional code can be applied to one item of goods. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.`
  String get promotional {
    return Intl.message(
      '- code is a special code that provides a discount on a specific group of Products and has an expiration date. Promo codes are applied automatically. Only one promotional code can be applied to one item of goods. The price difference between a product without a discount and a product with a discount is the benefit of the final Buyer within the framework of the action to purchase a specific specified product.',
      name: 'promotional',
      desc: '',
      args: [],
    );
  }

  /// `- is a discount provided to the Buyer under certain conditions established by the Marketplace.`
  String get esDiscount {
    return Intl.message(
      '- is a discount provided to the Buyer under certain conditions established by the Marketplace.',
      name: 'esDiscount',
      desc: '',
      args: [],
    );
  }

  /// `- the amount of available funds at the buyer’s disposal, which he can dispose of at his own discretion by transferring them to the bank details specified by the Buyer or by paying for subsequent orders on the Trading Platform website in the amount of up to 100% of the cost of the goods. When canceling/returning an order paid using “Balance”, the funds are returned back to “Balance”.`
  String get balance {
    return Intl.message(
      '- the amount of available funds at the buyer’s disposal, which he can dispose of at his own discretion by transferring them to the bank details specified by the Buyer or by paying for subsequent orders on the Trading Platform website in the amount of up to 100% of the cost of the goods. When canceling/returning an order paid using “Balance”, the funds are returned back to “Balance”.',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `- refusal by the Buyer of the Goods of proper quality in order to return them to Easy Shoppin or the Seller of the goods.`
  String get returnGoods {
    return Intl.message(
      '- refusal by the Buyer of the Goods of proper quality in order to return them to Easy Shoppin or the Seller of the goods.',
      name: 'returnGoods',
      desc: '',
      args: [],
    );
  }

  /// `- is a service of the Marketplace for interaction between the Buyer and Easy Shoppin and/or the Seller.`
  String get chat {
    return Intl.message(
      '- is a service of the Marketplace for interaction between the Buyer and Easy Shoppin and/or the Seller.',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `- information about the product, containing a visual and text description of the product, its main characteristics, information about the seller of the product, its price, as well as other information, the indication of which is necessary to make a decision about ordering the product. The product card contains the essential terms of the purchase and sale agreement and is filled out by the Seller of the goods independently.`
  String get productCard {
    return Intl.message(
      '- information about the product, containing a visual and text description of the product, its main characteristics, information about the seller of the product, its price, as well as other information, the indication of which is necessary to make a decision about ordering the product. The product card contains the essential terms of the purchase and sale agreement and is filled out by the Seller of the goods independently.',
      name: 'productCard',
      desc: '',
      args: [],
    );
  }

  /// `Registration data - data that is indicated (contained) in the Personal Account after registration and data specified by the User when placing an order.`
  String get registrationData {
    return Intl.message(
      'Registration data - data that is indicated (contained) in the Personal Account after registration and data specified by the User when placing an order.',
      name: 'registrationData',
      desc: '',
      args: [],
    );
  }

  /// `- is an electronic means of payment provided to the Buyer by Easy Shoppin Bank LLC on the basis of an agreement concluded between Easy Shoppin Bank LLC and the Buyer.`
  String get esElectronicWallet {
    return Intl.message(
      '- is an electronic means of payment provided to the Buyer by Easy Shoppin Bank LLC on the basis of an agreement concluded between Easy Shoppin Bank LLC and the Buyer.',
      name: 'esElectronicWallet',
      desc: '',
      args: [],
    );
  }

  /// `2. General provisions`
  String get generationProvisions {
    return Intl.message(
      '2. General provisions',
      name: 'generationProvisions',
      desc: '',
      args: [],
    );
  }

  /// ` The trading platform provides the Buyer with a free opportunity to search for information about the Products, familiarize yourself with the product offerings of Easy Shoppin  and other Sellers, receive (including based on search results) product offers and information, order Products, select a delivery method, pay for Products, as well as other functional possibilities.`
  String get tradingPlatformSearch {
    return Intl.message(
      ' The trading platform provides the Buyer with a free opportunity to search for information about the Products, familiarize yourself with the product offerings of Easy Shoppin  and other Sellers, receive (including based on search results) product offers and information, order Products, select a delivery method, pay for Products, as well as other functional possibilities.',
      name: 'tradingPlatformSearch',
      desc: '',
      args: [],
    );
  }

  /// ` By using the Trading Platform, placing Orders, paying for Orders, refusing Goods, the Buyer unconditionally agrees to the terms of these Rules, which are a Public Offer within the meaning of Art. 437 of the Civil Code of the Russian Federation, as well as with the terms of the Rules for the Application of Recommendation Technologies, and undertakes to comply with them.`
  String get usingTradingPlatform {
    return Intl.message(
      ' By using the Trading Platform, placing Orders, paying for Orders, refusing Goods, the Buyer unconditionally agrees to the terms of these Rules, which are a Public Offer within the meaning of Art. 437 of the Civil Code of the Russian Federation, as well as with the terms of the Rules for the Application of Recommendation Technologies, and undertakes to comply with them.',
      name: 'usingTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` Sellers on the Marketplace include both Easy Shoppin and other legal entities of various organizational and legal forms, individual entrepreneurs, citizens using the special tax regime “Professional Income Tax”, including also foreign citizens and legal entities.`
  String get sellersMarketplace {
    return Intl.message(
      ' Sellers on the Marketplace include both Easy Shoppin and other legal entities of various organizational and legal forms, individual entrepreneurs, citizens using the special tax regime “Professional Income Tax”, including also foreign citizens and legal entities.',
      name: 'sellersMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` Information about the Seller of the Product is placed in the Product Card on the Marketplace under the “i” icon (or by hovering over the icon). This information is provided directly by the Seller of the goods and is published by Easy Shoppin  without changing its content or meaning. Responsibility for the completeness of the information and its accuracy lies with the Seller providing the information.`
  String get infoSellerProduct {
    return Intl.message(
      ' Information about the Seller of the Product is placed in the Product Card on the Marketplace under the “i” icon (or by hovering over the icon). This information is provided directly by the Seller of the goods and is published by Easy Shoppin  without changing its content or meaning. Responsibility for the completeness of the information and its accuracy lies with the Seller providing the information.',
      name: 'infoSellerProduct',
      desc: '',
      args: [],
    );
  }

  /// ` A card of goods offered for sale by a foreign seller may not contain information about the identification number due to the difference in formats and the absence of such numbers in foreign jurisdictions. If necessary, information allowing the identification of such a Seller will be provided at the consumer's request by the Seller itself or Easy Shoppin  (if Easy Shoppin  has such information).`
  String get cardGoodsOffered {
    return Intl.message(
      ' A card of goods offered for sale by a foreign seller may not contain information about the identification number due to the difference in formats and the absence of such numbers in foreign jurisdictions. If necessary, information allowing the identification of such a Seller will be provided at the consumer\'s request by the Seller itself or Easy Shoppin  (if Easy Shoppin  has such information).',
      name: 'cardGoodsOffered',
      desc: '',
      args: [],
    );
  }

  /// ` The Marketplace has implemented a service for reviews and ratings of Buyers for purchased Products, which operates according to the following rules, with which the Buyer who leaves a review of the Product and evaluates the Product agrees:`
  String get reviewRatingsMarketplace {
    return Intl.message(
      ' The Marketplace has implemented a service for reviews and ratings of Buyers for purchased Products, which operates according to the following rules, with which the Buyer who leaves a review of the Product and evaluates the Product agrees:',
      name: 'reviewRatingsMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` Any authorized Buyer can leave reviews about Products posted on the Marketplace and rate Products when using the Marketplace;`
  String get authorizedBuyer {
    return Intl.message(
      ' Any authorized Buyer can leave reviews about Products posted on the Marketplace and rate Products when using the Marketplace;',
      name: 'authorizedBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` With the Buyer’s review, his name indicated in the Personal Account of the Trading Platform will be published in the appropriate section of the Trading Platform;`
  String get buyersReview {
    return Intl.message(
      ' With the Buyer’s review, his name indicated in the Personal Account of the Trading Platform will be published in the appropriate section of the Trading Platform;',
      name: 'buyersReview',
      desc: '',
      args: [],
    );
  }

  /// ` Reviews, the content of which is not related to the work of the Marketplace or making purchases on it, are not published;`
  String get noReviewMarketplace {
    return Intl.message(
      ' Reviews, the content of which is not related to the work of the Marketplace or making purchases on it, are not published;',
      name: 'noReviewMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` Reviews, the content of which does not relate to the actual experience of using the relevant Product, are not published;`
  String get noReviewActualExperience {
    return Intl.message(
      ' Reviews, the content of which does not relate to the actual experience of using the relevant Product, are not published;',
      name: 'noReviewActualExperience',
      desc: '',
      args: [],
    );
  }

  /// ` Reviews that contain profanity, offensive statements, including photographs and images that are unacceptable for publication from an ethical point of view, are not published;`
  String get noReviewProfanity {
    return Intl.message(
      ' Reviews that contain profanity, offensive statements, including photographs and images that are unacceptable for publication from an ethical point of view, are not published;',
      name: 'noReviewProfanity',
      desc: '',
      args: [],
    );
  }

  /// ` Reviews and comments containing links to other websites, personal data of third parties, as well as other information prohibited or restricted for distribution, are not published;`
  String get noReviewOtherWebsites {
    return Intl.message(
      ' Reviews and comments containing links to other websites, personal data of third parties, as well as other information prohibited or restricted for distribution, are not published;',
      name: 'noReviewOtherWebsites',
      desc: '',
      args: [],
    );
  }

  /// ` A published review may be deleted at any time without explanation;`
  String get publishedReviewDeleted {
    return Intl.message(
      ' A published review may be deleted at any time without explanation;',
      name: 'publishedReviewDeleted',
      desc: '',
      args: [],
    );
  }

  /// ` Easy Shoppin independently determines the period during which reviews are considered relevant and for which they are published.`
  String get reviewConsideredRelevant {
    return Intl.message(
      ' Easy Shoppin independently determines the period during which reviews are considered relevant and for which they are published.',
      name: 'reviewConsideredRelevant',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer agrees that messages and materials posted by him on the Marketplace may be used by Easy Shoppin, including in other Easy Shoppin services and applications, in advertising or marketing materials posted on Easy Shoppin resources on the Internet, as well as on other resources and sites on the Internet, to attract the attention of other consumers to the Marketplace as a whole or to the goods and services of third parties, as with the indication of the author of the message or material (the name of the author will be indicated as the name of the Buyer, which he indicated during registration or in the settings of his data in the Personal Account), and without it, without the obligation to provide reports on the use of such messages and materials, without the need to obtain special permission from the Buyer and without paying royalties, throughout the world without a time limit, with the right of Easy Shoppin to provide the specified rights to use such messages and materials to third parties.`
  String get buyerAgreesMessages {
    return Intl.message(
      ' The Buyer agrees that messages and materials posted by him on the Marketplace may be used by Easy Shoppin, including in other Easy Shoppin services and applications, in advertising or marketing materials posted on Easy Shoppin resources on the Internet, as well as on other resources and sites on the Internet, to attract the attention of other consumers to the Marketplace as a whole or to the goods and services of third parties, as with the indication of the author of the message or material (the name of the author will be indicated as the name of the Buyer, which he indicated during registration or in the settings of his data in the Personal Account), and without it, without the obligation to provide reports on the use of such messages and materials, without the need to obtain special permission from the Buyer and without paying royalties, throughout the world without a time limit, with the right of Easy Shoppin to provide the specified rights to use such messages and materials to third parties.',
      name: 'buyerAgreesMessages',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer agrees that the reviews and ratings he left may be published and used by Easy Shoppin on the Marketplace or on third party websites without additional consent from the Buyer. In this case, reviews and images attached to them are published and used “as is”, preserving the author’s grammar and punctuation, under the Buyer’s name indicated in the Personal Account. The buyer is responsible for the accuracy of the information contained in the reviews he left.`
  String get buyerAgreesReview {
    return Intl.message(
      ' The Buyer agrees that the reviews and ratings he left may be published and used by Easy Shoppin on the Marketplace or on third party websites without additional consent from the Buyer. In this case, reviews and images attached to them are published and used “as is”, preserving the author’s grammar and punctuation, under the Buyer’s name indicated in the Personal Account. The buyer is responsible for the accuracy of the information contained in the reviews he left.',
      name: 'buyerAgreesReview',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer is informed that the Trading Platform, which collectively represents computer programs, as well as the generated graphic and audiovisual displays, the user interface as a whole, design elements, text, graphic images and other information posted by Easy Shoppin, are protected results of intellectual activity, the exclusive right to which belongs to Easy Shoppin.`
  String get buyerInformedTrading {
    return Intl.message(
      ' The Buyer is informed that the Trading Platform, which collectively represents computer programs, as well as the generated graphic and audiovisual displays, the user interface as a whole, design elements, text, graphic images and other information posted by Easy Shoppin, are protected results of intellectual activity, the exclusive right to which belongs to Easy Shoppin.',
      name: 'buyerInformedTrading',
      desc: '',
      args: [],
    );
  }

  /// ` Easy Shoppin provides Users with a non-exclusive license to use databases and computer programs necessary for using the Trading Platform for the purposes provided for in this Offer free of charge.`
  String get providesUsers {
    return Intl.message(
      ' Easy Shoppin provides Users with a non-exclusive license to use databases and computer programs necessary for using the Trading Platform for the purposes provided for in this Offer free of charge.',
      name: 'providesUsers',
      desc: '',
      args: [],
    );
  }

  /// ` A non-exclusive license is granted from the moment of access to the Marketplace and continues to be valid as long as the User uses the Marketplace for personal, non-commercial purposes. Searching and viewing offers on the Marketplace is available to all users, regardless of registration and authorization. In order to gain access to other functionality of the Marketplace, namely: make a purchase, place an order, you need to register a Personal Account.`
  String get licenseGranted {
    return Intl.message(
      ' A non-exclusive license is granted from the moment of access to the Marketplace and continues to be valid as long as the User uses the Marketplace for personal, non-commercial purposes. Searching and viewing offers on the Marketplace is available to all users, regardless of registration and authorization. In order to gain access to other functionality of the Marketplace, namely: make a purchase, place an order, you need to register a Personal Account.',
      name: 'licenseGranted',
      desc: '',
      args: [],
    );
  }

  /// ` From the moment of registration on the Trading Platform, Easy Shoppin provides the User (the owner of the personal account) for the entire term of the Agreement with a non-exclusive, non-transferable license to use the Trading Platform in the part directly related to the User, namely, the right to use the functionality of the Trading Platform solely for the purpose of exercising the rights and obligations in within the framework of this Offer, including: for registration and identification on the Marketplace, for interaction with support specialists for users/customers on the Portal, with sellers, including, but not limited to, for the purpose of receiving services provided for in the Agreement, transfer and return of Goods, to request and receive information in the manner and under the conditions provided for in the Agreement.`
  String get registrationTradingPlatform {
    return Intl.message(
      ' From the moment of registration on the Trading Platform, Easy Shoppin provides the User (the owner of the personal account) for the entire term of the Agreement with a non-exclusive, non-transferable license to use the Trading Platform in the part directly related to the User, namely, the right to use the functionality of the Trading Platform solely for the purpose of exercising the rights and obligations in within the framework of this Offer, including: for registration and identification on the Marketplace, for interaction with support specialists for users/customers on the Portal, with sellers, including, but not limited to, for the purpose of receiving services provided for in the Agreement, transfer and return of Goods, to request and receive information in the manner and under the conditions provided for in the Agreement.',
      name: 'registrationTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` The user/buyer is not entitled to:`
  String get userBuyer {
    return Intl.message(
      ' The user/buyer is not entitled to:',
      name: 'userBuyer',
      desc: '',
      args: [],
    );
  }

  /// `1. use the Trading Platform, its individual elements in ways and/or for purposes not provided for in this Offer;`
  String get useTradingPlatform {
    return Intl.message(
      '1. use the Trading Platform, its individual elements in ways and/or for purposes not provided for in this Offer;',
      name: 'useTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// `2. carry out any actions related to modification of the source code of the Trading Platform;`
  String get sourceCodeTradingPlatform {
    return Intl.message(
      '2. carry out any actions related to modification of the source code of the Trading Platform;',
      name: 'sourceCodeTradingPlatform',
      desc: '',
      args: [],
    );
  }

  /// ` By registering in your personal account/using the Trading Platform, the User fully and unconditionally agrees to the terms of use of the Trading Platform, as well as other intellectual property of Easy Shoppin. In case of violation by the User of the terms of use of the Trading Platform and/or other intellectual property of Easy Shoppin, including, but not limited to, means of individualization of Easy Shoppin, Easy Shoppin has the right to demand payment by the User of a penalty (fine) in accordance with the Agreement, and also reserves the right to block the User’s personal account at the market.`
  String get registeringPersonalAccount {
    return Intl.message(
      ' By registering in your personal account/using the Trading Platform, the User fully and unconditionally agrees to the terms of use of the Trading Platform, as well as other intellectual property of Easy Shoppin. In case of violation by the User of the terms of use of the Trading Platform and/or other intellectual property of Easy Shoppin, including, but not limited to, means of individualization of Easy Shoppin, Easy Shoppin has the right to demand payment by the User of a penalty (fine) in accordance with the Agreement, and also reserves the right to block the User’s personal account at the market.',
      name: 'registeringPersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Easy Shoppin has the right, as part of the ongoing promotion, to determine individual Products, upon leaving reviews for which the Buyer can be awarded Bonus Points. Bonus points are accrued under the following conditions:`
  String get ongoingPromotion {
    return Intl.message(
      ' Easy Shoppin has the right, as part of the ongoing promotion, to determine individual Products, upon leaving reviews for which the Buyer can be awarded Bonus Points. Bonus points are accrued under the following conditions:',
      name: 'ongoingPromotion',
      desc: '',
      args: [],
    );
  }

  /// ` Bonus points are awarded only for reviews of Products that participate in the promotion, which is reflected in the Product Card.`
  String get productsParticipatePromotion {
    return Intl.message(
      ' Bonus points are awarded only for reviews of Products that participate in the promotion, which is reflected in the Product Card.',
      name: 'productsParticipatePromotion',
      desc: '',
      args: [],
    );
  }

  /// ` A review of a Product participating in the promotion can be left by the Buyer who purchased this Product no later than 5 (five) days after the Buyer receives this Product.`
  String get productParticipatingBuyer {
    return Intl.message(
      ' A review of a Product participating in the promotion can be left by the Buyer who purchased this Product no later than 5 (five) days after the Buyer receives this Product.',
      name: 'productParticipatingBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` The number of Bonus Points awarded for a review depends on the availability of a text description, video and photographs of the Product and is reflected in the review registration interface on the Marketplace.`
  String get numberBonusPoints {
    return Intl.message(
      ' The number of Bonus Points awarded for a review depends on the availability of a text description, video and photographs of the Product and is reflected in the review registration interface on the Marketplace.',
      name: 'numberBonusPoints',
      desc: '',
      args: [],
    );
  }

  /// ` Each review is checked for compliance with the conditions of clause 2.4 of these Rules and is published on the Marketplace, subject to approval based on the results of the check. Bonus points are awarded to the Buyer for a published review 14 days after its publication.`
  String get reviewChecked {
    return Intl.message(
      ' Each review is checked for compliance with the conditions of clause 2.4 of these Rules and is published on the Marketplace, subject to approval based on the results of the check. Bonus points are awarded to the Buyer for a published review 14 days after its publication.',
      name: 'reviewChecked',
      desc: '',
      args: [],
    );
  }

  /// ` Bonus points will not be awarded if the review has not passed the compliance check and is therefore not published.`
  String get bonusPointsAwarded {
    return Intl.message(
      ' Bonus points will not be awarded if the review has not passed the compliance check and is therefore not published.',
      name: 'bonusPointsAwarded',
      desc: '',
      args: [],
    );
  }

  /// ` Bonus points are not awarded if the Buyer, after writing a review, returns the product in the manner prescribed by these Rules. A review left for such a Product, if it complies with the conditions of clause 2.4 of these Rules, may be published on the Marketplace.`
  String get bonusPointsBuyer {
    return Intl.message(
      ' Bonus points are not awarded if the Buyer, after writing a review, returns the product in the manner prescribed by these Rules. A review left for such a Product, if it complies with the conditions of clause 2.4 of these Rules, may be published on the Marketplace.',
      name: 'bonusPointsBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` Bonus points can be used to pay for orders of Goods on the Marketplace and cannot be transferred to an account with a credit institution in the manner provided for in clause 5.17 of these Rules. When paying for an order, 1 bonus point is equal to 1 Russian ruble.`
  String get bonusPointsGoods {
    return Intl.message(
      ' Bonus points can be used to pay for orders of Goods on the Marketplace and cannot be transferred to an account with a credit institution in the manner provided for in clause 5.17 of these Rules. When paying for an order, 1 bonus point is equal to 1 Russian ruble.',
      name: 'bonusPointsGoods',
      desc: '',
      args: [],
    );
  }

  /// ` If, after publishing a review, it is determined that the review does not comply with the conditions specified in clause 2.4 of these Rules, Easy Shoppin reserves the right to delete it with a subsequent reduction in the Personal Account Balance of the Buyer who left the review by the amount of previously accrued Bonus Points.`
  String get publishingReview {
    return Intl.message(
      ' If, after publishing a review, it is determined that the review does not comply with the conditions specified in clause 2.4 of these Rules, Easy Shoppin reserves the right to delete it with a subsequent reduction in the Personal Account Balance of the Buyer who left the review by the amount of previously accrued Bonus Points.',
      name: 'publishingReview',
      desc: '',
      args: [],
    );
  }

  /// `3. Registration on the site`
  String get registrationSite {
    return Intl.message(
      '3. Registration on the site',
      name: 'registrationSite',
      desc: '',
      args: [],
    );
  }

  /// ` Only registered Buyers can place an Order on the Marketplace, and the Buyer has the right to register on the site only 1 (one) time, i.e. can have only one Personal Account. Having two personal accounts with the same registration data is not allowed.`
  String get onlyRegisteredBuyers {
    return Intl.message(
      ' Only registered Buyers can place an Order on the Marketplace, and the Buyer has the right to register on the site only 1 (one) time, i.e. can have only one Personal Account. Having two personal accounts with the same registration data is not allowed.',
      name: 'onlyRegisteredBuyers',
      desc: '',
      args: [],
    );
  }

  /// ` When registering on the Marketplace, as well as during its further use, the Buyer provides Easy Shoppin with his registration data (including personal data): telephone number, delivery address, details of electronic means of payment (number, expiration date, CVV/CVC code). The Buyer has the right, at his discretion, to provide Easy Shoppin with additional registration data (including personal data), namely: full name, gender, date of birth, information about body measurements (clothing size), as well as other information that the Buyer deems it possible to provide.`
  String get registeringMarketplace {
    return Intl.message(
      ' When registering on the Marketplace, as well as during its further use, the Buyer provides Easy Shoppin with his registration data (including personal data): telephone number, delivery address, details of electronic means of payment (number, expiration date, CVV/CVC code). The Buyer has the right, at his discretion, to provide Easy Shoppin with additional registration data (including personal data), namely: full name, gender, date of birth, information about body measurements (clothing size), as well as other information that the Buyer deems it possible to provide.',
      name: 'registeringMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` To gain access to the Personal Account, a buyer who has registered on the Marketplace undergoes individual identification by entering an access code sent by Easy Shoppin to the contact phone number specified in the Personal Account via SMS message or push notification. Individual identification of the Buyer allows you to avoid unauthorized actions by third parties on behalf of the Buyer and provides access to additional services.`
  String get accessPersonalAccount {
    return Intl.message(
      ' To gain access to the Personal Account, a buyer who has registered on the Marketplace undergoes individual identification by entering an access code sent by Easy Shoppin to the contact phone number specified in the Personal Account via SMS message or push notification. Individual identification of the Buyer allows you to avoid unauthorized actions by third parties on behalf of the Buyer and provides access to additional services.',
      name: 'accessPersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Transfer of the access code by the Buyer to third parties is not permitted. The Buyer is responsible for all possible negative consequences, including material losses, in the event of transferring the access code, Personal Account credentials, as well as providing access to the Personal Account to third parties.`
  String get accessCodeBuyer {
    return Intl.message(
      ' Transfer of the access code by the Buyer to third parties is not permitted. The Buyer is responsible for all possible negative consequences, including material losses, in the event of transferring the access code, Personal Account credentials, as well as providing access to the Personal Account to third parties.',
      name: 'accessCodeBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` Changing the phone number in your Personal Account cannot be done for technical reasons.`
  String get changingPhoneNumber {
    return Intl.message(
      ' Changing the phone number in your Personal Account cannot be done for technical reasons.',
      name: 'changingPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` The loss of the telephone number for which the Personal Account is registered, as well as its transfer to another person, is the responsibility of the Buyer. The buyer is responsible for all possible negative consequences, including material losses.`
  String get lossTelephoneNumber {
    return Intl.message(
      ' The loss of the telephone number for which the Personal Account is registered, as well as its transfer to another person, is the responsibility of the Buyer. The buyer is responsible for all possible negative consequences, including material losses.',
      name: 'lossTelephoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` By registering a Personal Account on the Marketplace, as well as entering an access identification code, the Buyer confirms his agreement that:`
  String get registeringAccountMarketplace {
    return Intl.message(
      ' By registering a Personal Account on the Marketplace, as well as entering an access identification code, the Buyer confirms his agreement that:',
      name: 'registeringAccountMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` Registration data (including personal data) is provided by him voluntarily. In the case of using data from third parties, the specified data is indicated with the informed and prior and confirmed consent of these persons;`
  String get registrationDataVoluntarily {
    return Intl.message(
      ' Registration data (including personal data) is provided by him voluntarily. In the case of using data from third parties, the specified data is indicated with the informed and prior and confirmed consent of these persons;',
      name: 'registrationDataVoluntarily',
      desc: '',
      args: [],
    );
  }

  /// ` Registration data (including personal data) is transmitted electronically via open communication channels of the Internet, used (processed, collected, systematized, stored and processed in other ways) by Easy Shoppin to implement the purposes specified in these Rules and for the same purposes may be transferred to third parties;`
  String get registrationDataElectronically {
    return Intl.message(
      ' Registration data (including personal data) is transmitted electronically via open communication channels of the Internet, used (processed, collected, systematized, stored and processed in other ways) by Easy Shoppin to implement the purposes specified in these Rules and for the same purposes may be transferred to third parties;',
      name: 'registrationDataElectronically',
      desc: '',
      args: [],
    );
  }

  /// ` Registration data (including personal data) may be processed by Easy Shoppin for the purpose of promoting goods and services by making direct contacts with the Buyer using communication channels in accordance with the Policy regarding the processing of personal data;`
  String get registrationDataPolicy {
    return Intl.message(
      ' Registration data (including personal data) may be processed by Easy Shoppin for the purpose of promoting goods and services by making direct contacts with the Buyer using communication channels in accordance with the Policy regarding the processing of personal data;',
      name: 'registrationDataPolicy',
      desc: '',
      args: [],
    );
  }

  /// ` Registration data (including personal data) is processed by Easy Shoppin for the purpose of sending advertising and information to the Buyer via telecommunication networks, including via the Internet, in accordance with Article 18 of the Federal Law of June 13, 2006 No. 38-FZ “On Advertising”;`
  String get registrationDatInternet {
    return Intl.message(
      ' Registration data (including personal data) is processed by Easy Shoppin for the purpose of sending advertising and information to the Buyer via telecommunication networks, including via the Internet, in accordance with Article 18 of the Federal Law of June 13, 2006 No. 38-FZ “On Advertising”;',
      name: 'registrationDatInternet',
      desc: '',
      args: [],
    );
  }

  /// ` Registration data (including personal data) specified by the Buyer, for the purpose of additional protection against fraudulent activities, may be transferred to the credit institution that carries out transactions for payment of Orders placed on the Marketplace, as well as to other third parties ensuring the security of Easy Shoppin;`
  String get registrationDataProtection {
    return Intl.message(
      ' Registration data (including personal data) specified by the Buyer, for the purpose of additional protection against fraudulent activities, may be transferred to the credit institution that carries out transactions for payment of Orders placed on the Marketplace, as well as to other third parties ensuring the security of Easy Shoppin;',
      name: 'registrationDataProtection',
      desc: '',
      args: [],
    );
  }

  /// ` The consent given by the Buyer to the processing of his registration data (including personal data) is unlimited and can be revoked by the Buyer or his legal representative by submitting a written application sent to the email address: sales@easyshoppin.ru.`
  String get registrationDataEmail {
    return Intl.message(
      ' The consent given by the Buyer to the processing of his registration data (including personal data) is unlimited and can be revoked by the Buyer or his legal representative by submitting a written application sent to the email address: sales@easyshoppin.ru.',
      name: 'registrationDataEmail',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer is informed and agrees that Easy Shoppin collects, records, systematizes, accumulates, stores, refines (updates, changes), extracts, analyzes and uses, transfers (distributes, provides, access), entrusts processing to third parties, receives from third parties persons, depersonalization, blocking, deletion, destruction of the Buyer’s registration data (including personal data).`
  String get buyerInformed {
    return Intl.message(
      ' The Buyer is informed and agrees that Easy Shoppin collects, records, systematizes, accumulates, stores, refines (updates, changes), extracts, analyzes and uses, transfers (distributes, provides, access), entrusts processing to third parties, receives from third parties persons, depersonalization, blocking, deletion, destruction of the Buyer’s registration data (including personal data).',
      name: 'buyerInformed',
      desc: '',
      args: [],
    );
  }

  /// ` The buyer is informed and agrees that hiding a bank card in the Personal Account does not mean withdrawing consent to the processing of this part of personal data. Consent to the processing of personal bank card data may be withdrawn by the Buyer by notification sent to the email address: sales@easyshoppin.ru.`
  String get bankCard {
    return Intl.message(
      ' The buyer is informed and agrees that hiding a bank card in the Personal Account does not mean withdrawing consent to the processing of this part of personal data. Consent to the processing of personal bank card data may be withdrawn by the Buyer by notification sent to the email address: sales@easyshoppin.ru.',
      name: 'bankCard',
      desc: '',
      args: [],
    );
  }

  /// ` By copying the Easy Shoppin Mobile Application and installing it on his mobile device, the User expresses his full and unconditional agreement with all the terms of this Offer.`
  String get copyingApp {
    return Intl.message(
      ' By copying the Easy Shoppin Mobile Application and installing it on his mobile device, the User expresses his full and unconditional agreement with all the terms of this Offer.',
      name: 'copyingApp',
      desc: '',
      args: [],
    );
  }

  /// ` Easy Shoppin is not responsible for the accuracy and correctness of the information provided by the Buyer during registration, as well as for possible negative consequences caused by the Buyer providing inaccurate or incorrect information about himself.`
  String get correctnessInformation {
    return Intl.message(
      ' Easy Shoppin is not responsible for the accuracy and correctness of the information provided by the Buyer during registration, as well as for possible negative consequences caused by the Buyer providing inaccurate or incorrect information about himself.',
      name: 'correctnessInformation',
      desc: '',
      args: [],
    );
  }

  /// `4. Placing an order`
  String get placingOrder {
    return Intl.message(
      '4. Placing an order',
      name: 'placingOrder',
      desc: '',
      args: [],
    );
  }

  /// ` The purchase and sale agreement is considered concluded under the terms of these Rules and entails legal consequences for the Seller, Easy Shoppin and the Buyer only when ordering the Product and paying for it through the use of the services of the Marketplace, as a result of which information about the order is reflected in the Buyer’s Personal Account.`
  String get purchaseTermsRules {
    return Intl.message(
      ' The purchase and sale agreement is considered concluded under the terms of these Rules and entails legal consequences for the Seller, Easy Shoppin and the Buyer only when ordering the Product and paying for it through the use of the services of the Marketplace, as a result of which information about the order is reflected in the Buyer’s Personal Account.',
      name: 'purchaseTermsRules',
      desc: '',
      args: [],
    );
  }

  /// ` Concluding agreements with any third parties outside of software methods on the website or mobile application of the Trading Platform, as well as paying for an order in a way other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third person, transfer of funds to bank details, payment of bills, invoices, invoice agreements and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin, as for the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.`
  String get concludingAgreements {
    return Intl.message(
      ' Concluding agreements with any third parties outside of software methods on the website or mobile application of the Trading Platform, as well as paying for an order in a way other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third person, transfer of funds to bank details, payment of bills, invoices, invoice agreements and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin, as for the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.',
      name: 'concludingAgreements',
      desc: '',
      args: [],
    );
  }

  /// ` When placing an order using the Personal Account, responsibility for the Order, including possible financial losses, lies with the Buyer - the owner of the Personal Account.`
  String get placingOrderPersonalAccount {
    return Intl.message(
      ' When placing an order using the Personal Account, responsibility for the Order, including possible financial losses, lies with the Buyer - the owner of the Personal Account.',
      name: 'placingOrderPersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// ` By ordering Goods on the Marketplace, the Buyer enters into a purchase and sale agreement with the Seller of the Goods, as well as an agreement for the provision of delivery services for Goods with Easy Shoppin. Within the framework of one Order, the Buyer may enter into an agreement for the provision of delivery services for the Goods of several Sellers, with the simultaneous conclusion of several purchase and sale agreements in relation to the Goods selected by the Buyer.`
  String get orderingGoods {
    return Intl.message(
      ' By ordering Goods on the Marketplace, the Buyer enters into a purchase and sale agreement with the Seller of the Goods, as well as an agreement for the provision of delivery services for Goods with Easy Shoppin. Within the framework of one Order, the Buyer may enter into an agreement for the provision of delivery services for the Goods of several Sellers, with the simultaneous conclusion of several purchase and sale agreements in relation to the Goods selected by the Buyer.',
      name: 'orderingGoods',
      desc: '',
      args: [],
    );
  }

  /// ` When ordering a Product, the Seller of which is any seller, with the exception of Easy Shoppin, the Buyer, within the framework of the purchase and sale agreement, enters into a contractual relationship directly with the Seller selling this Product.`
  String get orderingProduct {
    return Intl.message(
      ' When ordering a Product, the Seller of which is any seller, with the exception of Easy Shoppin, the Buyer, within the framework of the purchase and sale agreement, enters into a contractual relationship directly with the Seller selling this Product.',
      name: 'orderingProduct',
      desc: '',
      args: [],
    );
  }

  /// ` By clicking the “place”/“pay” button (or another button that confirms the Buyer’s will to complete the Order and transfer payment for it), the Buyer confirms familiarization with these Rules and full agreement with all the terms of these Rules: including the conditions for the processing of personal data , payment for goods, conditions and procedure for delivery of the Goods both to the Buyer and from the Buyer, conditions for returning goods and filing claims.`
  String get clickingButtonPlacePay {
    return Intl.message(
      ' By clicking the “place”/“pay” button (or another button that confirms the Buyer’s will to complete the Order and transfer payment for it), the Buyer confirms familiarization with these Rules and full agreement with all the terms of these Rules: including the conditions for the processing of personal data , payment for goods, conditions and procedure for delivery of the Goods both to the Buyer and from the Buyer, conditions for returning goods and filing claims.',
      name: 'clickingButtonPlacePay',
      desc: '',
      args: [],
    );
  }

  /// ` The information presented in the Product Card cannot fully convey all the characteristics of the product (including color, shape, availability and description of some functions). To obtain complete information, the Buyer must contact the Seller. The Buyer’s placing an Order without such a request is a confirmation that the information about the Product was complete, understandable and sufficient for placing the Order.`
  String get informationProductCard {
    return Intl.message(
      ' The information presented in the Product Card cannot fully convey all the characteristics of the product (including color, shape, availability and description of some functions). To obtain complete information, the Buyer must contact the Seller. The Buyer’s placing an Order without such a request is a confirmation that the information about the Product was complete, understandable and sufficient for placing the Order.',
      name: 'informationProductCard',
      desc: '',
      args: [],
    );
  }

  /// ` By placing an Order, the Buyer agrees that Easy Shoppin may entrust the execution of the contract to a third party, remaining responsible for its execution to the Buyer.`
  String get placingOrderBuyer {
    return Intl.message(
      ' By placing an Order, the Buyer agrees that Easy Shoppin may entrust the execution of the contract to a third party, remaining responsible for its execution to the Buyer.',
      name: 'placingOrderBuyer',
      desc: '',
      args: [],
    );
  }

  /// ` By placing an order on the Marketplace, the Buyer agrees to receive:`
  String get placingOrderMarketplace {
    return Intl.message(
      ' By placing an order on the Marketplace, the Buyer agrees to receive:',
      name: 'placingOrderMarketplace',
      desc: '',
      args: [],
    );
  }

  /// ` Emails/push notifications that Easy Shoppin may send to the Buyer;`
  String get emailsPushNotifications {
    return Intl.message(
      ' Emails/push notifications that Easy Shoppin may send to the Buyer;',
      name: 'emailsPushNotifications',
      desc: '',
      args: [],
    );
  }

  /// ` Messages (SMS) to the phone number specified by the Buyer;`
  String get messagesSMS {
    return Intl.message(
      ' Messages (SMS) to the phone number specified by the Buyer;',
      name: 'messagesSMS',
      desc: '',
      args: [],
    );
  }

  /// ` A call with an offer to evaluate the quality of the Trading Platform to the telephone number specified by the Buyer.`
  String get callTelephoneNumber {
    return Intl.message(
      ' A call with an offer to evaluate the quality of the Trading Platform to the telephone number specified by the Buyer.',
      name: 'callTelephoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `The Buyer has the right to refuse these methods of interaction by disabling them in the Personal Account.`
  String get buyerPersonalAccount {
    return Intl.message(
      'The Buyer has the right to refuse these methods of interaction by disabling them in the Personal Account.',
      name: 'buyerPersonalAccount',
      desc: '',
      args: [],
    );
  }

  /// ` By placing an Order in a country that is a member of the Eurasian Economic Union (hereinafter referred to as the “EAEU”), in relation to Goods that are delivered from a country that is not a member of the EAEU and is subject to customs clearance when imported into the EAEU, the Buyer confirms that he is duly informed and agrees with the following:`
  String get orderCountryEAEU {
    return Intl.message(
      ' By placing an Order in a country that is a member of the Eurasian Economic Union (hereinafter referred to as the “EAEU”), in relation to Goods that are delivered from a country that is not a member of the EAEU and is subject to customs clearance when imported into the EAEU, the Buyer confirms that he is duly informed and agrees with the following:',
      name: 'orderCountryEAEU',
      desc: '',
      args: [],
    );
  }

  /// ` The norm for duty-free import of Goods into the territory of the EAEU is determined by the regulations of the EAEU (as of February 1, 2024, it was 1000 Euros).`
  String get importEAEU {
    return Intl.message(
      ' The norm for duty-free import of Goods into the territory of the EAEU is determined by the regulations of the EAEU (as of February 1, 2024, it was 1000 Euros).',
      name: 'importEAEU',
      desc: '',
      args: [],
    );
  }

  /// ` If the cost of the Goods exceeds the duty-free import rate, the obligation to pay customs duties lies with the Buyer; Easy Shoppin is not responsible for customs duties.`
  String get obligationDuties {
    return Intl.message(
      ' If the cost of the Goods exceeds the duty-free import rate, the obligation to pay customs duties lies with the Buyer; Easy Shoppin is not responsible for customs duties.',
      name: 'obligationDuties',
      desc: '',
      args: [],
    );
  }

  /// ` For customs clearance of the Goods, the Buyer may be required to provide additional data, including personal data, to the customs representative.`
  String get customsClearanceGoods {
    return Intl.message(
      ' For customs clearance of the Goods, the Buyer may be required to provide additional data, including personal data, to the customs representative.',
      name: 'customsClearanceGoods',
      desc: '',
      args: [],
    );
  }

  /// ` The list of available customs representatives is determined by Easy Shoppin at its discretion. The buyer enters into an agreement with such a customs representative in the manner specified in these Rules.`
  String get availableCustomsRepresentatives {
    return Intl.message(
      ' The list of available customs representatives is determined by Easy Shoppin at its discretion. The buyer enters into an agreement with such a customs representative in the manner specified in these Rules.',
      name: 'availableCustomsRepresentatives',
      desc: '',
      args: [],
    );
  }

  /// ` Return of goods is carried out in accordance with Section 7 of the Rules.`
  String get returnGoodsCarried {
    return Intl.message(
      ' Return of goods is carried out in accordance with Section 7 of the Rules.',
      name: 'returnGoodsCarried',
      desc: '',
      args: [],
    );
  }

  /// ` In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of services to him by a customs representative of Unitrade JSC, published at http://sms.unitrade.su/, and also gives your consent to the transfer and processing of your personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of your orders.`
  String get orderGoodsUnitrade {
    return Intl.message(
      ' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of services to him by a customs representative of Unitrade JSC, published at http://sms.unitrade.su/, and also gives your consent to the transfer and processing of your personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of your orders.',
      name: 'orderGoodsUnitrade',
      desc: '',
      args: [],
    );
  }

  /// ` In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of TANAIS JSC (121596, Moscow, internal ter.g. municipal district Mozhaisky, st. . Gorbunova, 2, building 3, floor/room 6/II, room 36, INN: 7730642532, OGRN: 1117746295314), published at https://tanais.express/pages/offerta/ also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of his orders.`
  String get orderGoodsTANAIS {
    return Intl.message(
      ' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of TANAIS JSC (121596, Moscow, internal ter.g. municipal district Mozhaisky, st. . Gorbunova, 2, building 3, floor/room 6/II, room 36, INN: 7730642532, OGRN: 1117746295314), published at https://tanais.express/pages/offerta/ also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of his orders.',
      name: 'orderGoodsTANAIS',
      desc: '',
      args: [],
    );
  }

  /// ` By paying for the Goods sent by international mail, the Buyer enters into an Offer Agreement with Russian Post JSC (you can also read the text of the Offer Agreement at https://customs.pochta.ru/oferta), which is an authorized operator for the purposes of declaring goods sent in international mail and paying customs duties in relation to such goods. Easy Shoppin does not bear any responsibility for the Buyer’s fulfillment of obligations to pay customs duties and declare goods, as well as for the fulfillment by the authorized operator (as indicated above) of its obligations to the Buyer in accordance with the Offer Agreement. In accordance with these provisions, the Buyer grants Easy Shoppin the right to transfer to the authorized operator information about the number and date of the Order, as well as the amount of payments payable in accordance with the requirements of the legislation of Russia and the Eurasian Economic Union in connection with the declaration of goods and payment of customs duties. Easy Shoppin is not responsible for the processing of the Buyer's payment, as well as the processing of data provided by the Buyer to the authorized operator and does not participate in these operations in any way.`
  String get orderGoodsJSC {
    return Intl.message(
      ' By paying for the Goods sent by international mail, the Buyer enters into an Offer Agreement with Russian Post JSC (you can also read the text of the Offer Agreement at https://customs.pochta.ru/oferta), which is an authorized operator for the purposes of declaring goods sent in international mail and paying customs duties in relation to such goods. Easy Shoppin does not bear any responsibility for the Buyer’s fulfillment of obligations to pay customs duties and declare goods, as well as for the fulfillment by the authorized operator (as indicated above) of its obligations to the Buyer in accordance with the Offer Agreement. In accordance with these provisions, the Buyer grants Easy Shoppin the right to transfer to the authorized operator information about the number and date of the Order, as well as the amount of payments payable in accordance with the requirements of the legislation of Russia and the Eurasian Economic Union in connection with the declaration of goods and payment of customs duties. Easy Shoppin is not responsible for the processing of the Buyer\'s payment, as well as the processing of data provided by the Buyer to the authorized operator and does not participate in these operations in any way.',
      name: 'orderGoodsJSC',
      desc: '',
      args: [],
    );
  }

  /// ` In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of GBS-broker LLC (105066, Moscow, Olkhovskaya St., 16, building 5- 5A, basement room 1 room 15, TIN: 9701083788, OGRN: 1177746840787), published at https://www.gbs-broker.ru/docs/customs_repr_03032023.docx, and also gives his consent to the transfer and processing of his personal data partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.`
  String get orderGoodsGBSBroker {
    return Intl.message(
      ' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of GBS-broker LLC (105066, Moscow, Olkhovskaya St., 16, building 5- 5A, basement room 1 room 15, TIN: 9701083788, OGRN: 1177746840787), published at https://www.gbs-broker.ru/docs/customs_repr_03032023.docx, and also gives his consent to the transfer and processing of his personal data partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.',
      name: 'orderGoodsGBSBroker',
      desc: '',
      args: [],
    );
  }

  /// ` In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of SEL LOGISTIC LLC (690025, Vladivostok, Fanzavod St., 1, building 2, premises 1, INN: 2725106960, OGRN: 1112722010026), published at https://cellog.ru/oferta, and also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.`
  String get orderGoodsLOGISTIC {
    return Intl.message(
      ' In the case of placing an order for Goods that are subject to customs clearance when imported into Russia, the Buyer confirms his acceptance of the offer agreement for the provision of the services of a customs representative of SEL LOGISTIC LLC (690025, Vladivostok, Fanzavod St., 1, building 2, premises 1, INN: 2725106960, OGRN: 1112722010026), published at https://cellog.ru/oferta, and also gives his consent to the transfer and processing of his personal data to the partners of Easy Shoppin LLC for the purpose of organizing customs clearance of their orders.',
      name: 'orderGoodsLOGISTIC',
      desc: '',
      args: [],
    );
  }

  /// `5 Payment for the order`
  String get paymentOrder {
    return Intl.message(
      '5 Payment for the order',
      name: 'paymentOrder',
      desc: '',
      args: [],
    );
  }

  /// ` The price of the goods is indicated in the Product Card in rubles of the Russian Federation and includes value added tax.`
  String get returnGoodsCarriedAccordance {
    return Intl.message(
      ' The price of the goods is indicated in the Product Card in rubles of the Russian Federation and includes value added tax.',
      name: 'returnGoodsCarriedAccordance',
      desc: '',
      args: [],
    );
  }

  /// ` Prices for the Products are determined by the Sellers and are indicated in the Product Card. The cost of delivery services is determined by Easy Shoppin unilaterally and indisputably and is indicated on the Marketplace. Payment for the Order means the Buyer’s agreement with the price of the Product and the cost of delivery.`
  String get priceGoodsIndicated {
    return Intl.message(
      ' Prices for the Products are determined by the Sellers and are indicated in the Product Card. The cost of delivery services is determined by Easy Shoppin unilaterally and indisputably and is indicated on the Marketplace. Payment for the Order means the Buyer’s agreement with the price of the Product and the cost of delivery.',
      name: 'priceGoodsIndicated',
      desc: '',
      args: [],
    );
  }

  /// ` The final Price of the Product is determined by the sequential effect of discounts on the Price of the Product in the following order:`
  String get pricesProductsDetermined {
    return Intl.message(
      ' The final Price of the Product is determined by the sequential effect of discounts on the Price of the Product in the following order:',
      name: 'pricesProductsDetermined',
      desc: '',
      args: [],
    );
  }

  /// ` Promotional discount;`
  String get finalPriceProduct {
    return Intl.message(
      ' Promotional discount;',
      name: 'finalPriceProduct',
      desc: '',
      args: [],
    );
  }

  /// ` Discount using Promo Code;`
  String get promotionalDiscountPayment {
    return Intl.message(
      ' Discount using Promo Code;',
      name: 'promotionalDiscountPayment',
      desc: '',
      args: [],
    );
  }

  /// ` WB Discount.`
  String get discountPromoCode {
    return Intl.message(
      ' WB Discount.',
      name: 'discountPromoCode',
      desc: '',
      args: [],
    );
  }

  /// ` You can take advantage of the WB Discount only by placing orders in your Personal Account and logging into the Marketplace using your credentials. WB The discount is tied to your Personal Account and is calculated based on purchases made through it. In case of re-registration on the site, purchase history and WB Discount are not transferred from the old Personal Account to the new Personal Account. Order statistics in the new Personal Account are kept from scratch.`
  String get esDiscountPayment {
    return Intl.message(
      ' You can take advantage of the WB Discount only by placing orders in your Personal Account and logging into the Marketplace using your credentials. WB The discount is tied to your Personal Account and is calculated based on purchases made through it. In case of re-registration on the site, purchase history and WB Discount are not transferred from the old Personal Account to the new Personal Account. Order statistics in the new Personal Account are kept from scratch.',
      name: 'esDiscountPayment',
      desc: '',
      args: [],
    );
  }

  /// ` Payment for an order in a manner other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third party, transfer of funds to bank details, payment of bills, invoices, contracts - invoices and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin as the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.`
  String get onlyPlacingOrders {
    return Intl.message(
      ' Payment for an order in a manner other than payment using special software on the website or mobile application of the Trading Platform (including, but not limited to, payment in cash to a third party, transfer of funds to bank details, payment of bills, invoices, contracts - invoices and other primary documents received from third parties) does not give rise to legal consequences for Easy Shoppin as the owner of the Trading Platform, incl. upon receiving an offer to conclude such an agreement from information about goods posted on the website or mobile application of the Trading Platform.',
      name: 'onlyPlacingOrders',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer may have access to advance payment for the Order, as well as payment for the Order upon receipt. The choice of payment method belongs to the Buyer. Easy Shoppin may unilaterally limit the choice of payment method by establishing prepayment for the Order.`
  String get paymentOrderManner {
    return Intl.message(
      ' The Buyer may have access to advance payment for the Order, as well as payment for the Order upon receipt. The choice of payment method belongs to the Buyer. Easy Shoppin may unilaterally limit the choice of payment method by establishing prepayment for the Order.',
      name: 'paymentOrderManner',
      desc: '',
      args: [],
    );
  }

  /// ` The trading platform does not use cash payments in its activities.`
  String get accessAdvancePayment {
    return Intl.message(
      ' The trading platform does not use cash payments in its activities.',
      name: 'accessAdvancePayment',
      desc: '',
      args: [],
    );
  }

  /// ` Buyers who previously purchased goods in cash and who have returned or intend to return the goods on legal grounds have the right to demand a refund to the account specified by the Buyer with a credit institution.`
  String get buyersPreviouslyPurchased {
    return Intl.message(
      ' Buyers who previously purchased goods in cash and who have returned or intend to return the goods on legal grounds have the right to demand a refund to the account specified by the Buyer with a credit institution.',
      name: 'buyersPreviouslyPurchased',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer placing an Order on the Marketplace is given the opportunity to choose a payment option in accordance with the methods provided by the Marketplace:`
  String get tradingPlatformPayments {
    return Intl.message(
      ' The Buyer placing an Order on the Marketplace is given the opportunity to choose a payment option in accordance with the methods provided by the Marketplace:',
      name: 'tradingPlatformPayments',
      desc: '',
      args: [],
    );
  }

  /// ` Payment using a bank card;`
  String get paymentUsingBankCard {
    return Intl.message(
      ' Payment using a bank card;',
      name: 'paymentUsingBankCard',
      desc: '',
      args: [],
    );
  }

  /// ` Payment from the Personal Account Balance;`
  String get personalAccountBalance {
    return Intl.message(
      ' Payment from the Personal Account Balance;',
      name: 'personalAccountBalance',
      desc: '',
      args: [],
    );
  }

  /// ` Payment by installments;`
  String get paymentInstallments {
    return Intl.message(
      ' Payment by installments;',
      name: 'paymentInstallments',
      desc: '',
      args: [],
    );
  }

  /// ` Payment through the Fast Payment System (FPS);`
  String get fastPaymentSystem {
    return Intl.message(
      ' Payment through the Fast Payment System (FPS);',
      name: 'fastPaymentSystem',
      desc: '',
      args: [],
    );
  }

  /// ` Payment using credit funds. Payment in installments;`
  String get creditPaymentInstallments {
    return Intl.message(
      ' Payment using credit funds. Payment in installments;',
      name: 'creditPaymentInstallments',
      desc: '',
      args: [],
    );
  }

  /// ` Payment using ES Electronic Wallet;`
  String get paymentElectronicWallet {
    return Intl.message(
      ' Payment using ES Electronic Wallet;',
      name: 'paymentElectronicWallet',
      desc: '',
      args: [],
    );
  }

  /// ` Other payment methods introduced into the Marketplace.`
  String get otherPaymentMethods {
    return Intl.message(
      ' Other payment methods introduced into the Marketplace.',
      name: 'otherPaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// ` Payment upon receipt using a bank card`
  String get paymentUponReceipt {
    return Intl.message(
      ' Payment upon receipt using a bank card',
      name: 'paymentUponReceipt',
      desc: '',
      args: [],
    );
  }

  /// ` When choosing a payment method upon receipt using a bank card or other available services that allow payment for orders placed on the Marketplace using the specified method, the Buyer sends Easy Shoppin an order to make a payment from the account, providing consent to the processing of payment personal data.`
  String get paymentMethodUpon {
    return Intl.message(
      ' When choosing a payment method upon receipt using a bank card or other available services that allow payment for orders placed on the Marketplace using the specified method, the Buyer sends Easy Shoppin an order to make a payment from the account, providing consent to the processing of payment personal data.',
      name: 'paymentMethodUpon',
      desc: '',
      args: [],
    );
  }

  /// ` In the absence of debiting funds from the Buyer's account in favor of the Trading Platform in the amount of the cost of the order or part thereof, or cancellation of payment due to a technical failure and (or) other unforeseen error, the Buyer agrees that Easy Shoppin, on the basis of the previously given order of the Buyer in order to ensure the execution of the purchase and sale agreement and to prevent the formation of debt, it has the right, based on available payment personal data, consent to the processing of which has not been revoked, to initiate actions aimed at the Buyer fulfilling payment for the order without additional notice.`
  String get absenceDebitingFunds {
    return Intl.message(
      ' In the absence of debiting funds from the Buyer\'s account in favor of the Trading Platform in the amount of the cost of the order or part thereof, or cancellation of payment due to a technical failure and (or) other unforeseen error, the Buyer agrees that Easy Shoppin, on the basis of the previously given order of the Buyer in order to ensure the execution of the purchase and sale agreement and to prevent the formation of debt, it has the right, based on available payment personal data, consent to the processing of which has not been revoked, to initiate actions aimed at the Buyer fulfilling payment for the order without additional notice.',
      name: 'absenceDebitingFunds',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.`
  String get buyerUnderstandsAbove {
    return Intl.message(
      ' The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.',
      name: 'buyerUnderstandsAbove',
      desc: '',
      args: [],
    );
  }

  /// ` The buyer, sending an order and agreeing to write off funds, incl. debt incurred by the Owner of the Trading Platform, understands and agrees that the processing of personal data hidden by him (data on means of payment) by the Owner of the Trading Platform continues for the purposes reflected in these Rules and provided for by the current legislation on the protection of personal data. Hiding a bank card from your Personal Account in accordance with clause 3.9 of the Rules does not constitute a withdrawal of consent to the processing of such personal data.`
  String get endingOrderAgreeing {
    return Intl.message(
      ' The buyer, sending an order and agreeing to write off funds, incl. debt incurred by the Owner of the Trading Platform, understands and agrees that the processing of personal data hidden by him (data on means of payment) by the Owner of the Trading Platform continues for the purposes reflected in these Rules and provided for by the current legislation on the protection of personal data. Hiding a bank card from your Personal Account in accordance with clause 3.9 of the Rules does not constitute a withdrawal of consent to the processing of such personal data.',
      name: 'endingOrderAgreeing',
      desc: '',
      args: [],
    );
  }

  /// ` Payment from Personal Account Balance`
  String get paymentPersonalAccountBalance {
    return Intl.message(
      ' Payment from Personal Account Balance',
      name: 'paymentPersonalAccountBalance',
      desc: '',
      args: [],
    );
  }

  /// ` When choosing to pay for the Order from the Personal Account Balance, the price of the Product and the cost of the delivery service are debited from the Personal Account Balance. If Advances and Return Payments are simultaneously taken into account in the Personal Account Balance, when paying for goods, the amounts of Return Payments are taken into account first.`
  String get orderPersonalAccountBalance {
    return Intl.message(
      ' When choosing to pay for the Order from the Personal Account Balance, the price of the Product and the cost of the delivery service are debited from the Personal Account Balance. If Advances and Return Payments are simultaneously taken into account in the Personal Account Balance, when paying for goods, the amounts of Return Payments are taken into account first.',
      name: 'orderPersonalAccountBalance',
      desc: '',
      args: [],
    );
  }

  /// ` If there are insufficient funds reflected in the Personal Account Balance, the unpaid balance of the price of the Product and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.`
  String get insufficientFundsReflected {
    return Intl.message(
      ' If there are insufficient funds reflected in the Personal Account Balance, the unpaid balance of the price of the Product and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.',
      name: 'insufficientFundsReflected',
      desc: '',
      args: [],
    );
  }

  /// ` Payment by installments`
  String get paymentByInstallments {
    return Intl.message(
      ' Payment by installments',
      name: 'paymentByInstallments',
      desc: '',
      args: [],
    );
  }

  /// ` When choosing the payment method in installments, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for goods and (or) services occurs on the terms of this organization.`
  String get paymentMethodInstallments {
    return Intl.message(
      ' When choosing the payment method in installments, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for goods and (or) services occurs on the terms of this organization.',
      name: 'paymentMethodInstallments',
      desc: '',
      args: [],
    );
  }

  /// ` When choosing an installment payment method on the Marketplace website, the Buyer is given a discount on the product, which is equal to the cost of services of a banking or financial organization in connection with the purchase of the product in installments, and covers the cost of these services. Thus, the amount payable to such organization does not exceed the original cost of the goods, provided that additional services of such organization are not purchased.`
  String get choosingInstallmentPayment {
    return Intl.message(
      ' When choosing an installment payment method on the Marketplace website, the Buyer is given a discount on the product, which is equal to the cost of services of a banking or financial organization in connection with the purchase of the product in installments, and covers the cost of these services. Thus, the amount payable to such organization does not exceed the original cost of the goods, provided that additional services of such organization are not purchased.',
      name: 'choosingInstallmentPayment',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer assumes all obligations and risks associated with concluding an agreement to provide installment plans and/or credit funds to pay for goods and (or) services on the Marketplace. Neither the Owner of the Marketplace nor any other Seller takes part in the consideration by a banking or financial institution of the possibility of providing installment plans and/or credit funds to the Buyer and are not responsible in case of refusal to the Buyer in such payment, and are not responsible for the actions of the Buyer regarding transactions and acquisitions other services provided by a banking or financial organization to which they are not a party.`
  String get buyerAssumesObligations {
    return Intl.message(
      ' The Buyer assumes all obligations and risks associated with concluding an agreement to provide installment plans and/or credit funds to pay for goods and (or) services on the Marketplace. Neither the Owner of the Marketplace nor any other Seller takes part in the consideration by a banking or financial institution of the possibility of providing installment plans and/or credit funds to the Buyer and are not responsible in case of refusal to the Buyer in such payment, and are not responsible for the actions of the Buyer regarding transactions and acquisitions other services provided by a banking or financial organization to which they are not a party.',
      name: 'buyerAssumesObligations',
      desc: '',
      args: [],
    );
  }

  /// ` Payment using credit funds. Payment in installments`
  String get paymentUsingCreditFunds {
    return Intl.message(
      ' Payment using credit funds. Payment in installments',
      name: 'paymentUsingCreditFunds',
      desc: '',
      args: [],
    );
  }

  /// ` Payment in installments from Easy Shoppin.`
  String get paymentInInstallments {
    return Intl.message(
      ' Payment in installments from Easy Shoppin.',
      name: 'paymentInInstallments',
      desc: '',
      args: [],
    );
  }

  /// `When choosing the “Payment in installments” payment method for Goods on the Trading Platform website, the Buyer agrees to the terms of the contract set forth in the Agreement on concluding contracts with the payment term “Payment in installments,” which are an integral part of these Rules. When choosing the “Payment in installments” payment method for the Goods, the terms of the Agreement on concluding contracts with the payment term “Payment in installments” regarding payment for the Order and refund of funds for the Goods have priority.`
  String get paymentMethodGoods {
    return Intl.message(
      'When choosing the “Payment in installments” payment method for Goods on the Trading Platform website, the Buyer agrees to the terms of the contract set forth in the Agreement on concluding contracts with the payment term “Payment in installments,” which are an integral part of these Rules. When choosing the “Payment in installments” payment method for the Goods, the terms of the Agreement on concluding contracts with the payment term “Payment in installments” regarding payment for the Order and refund of funds for the Goods have priority.',
      name: 'paymentMethodGoods',
      desc: '',
      args: [],
    );
  }

  /// ` Payment in installments from Easy Shoppin partners`
  String get paymentInstallmentsPartners {
    return Intl.message(
      ' Payment in installments from Easy Shoppin partners',
      name: 'paymentInstallmentsPartners',
      desc: '',
      args: [],
    );
  }

  /// `When the Buyer chooses a payment method in installments from Easy Shoppin partners, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for Goods and (or) services occurs on the terms of this organization.`
  String get buyerChoosesPayment {
    return Intl.message(
      'When the Buyer chooses a payment method in installments from Easy Shoppin partners, the conclusion of an agreement between a banking or financial organization and the Buyer for payment for Goods and (or) services occurs on the terms of this organization.',
      name: 'buyerChoosesPayment',
      desc: '',
      args: [],
    );
  }

  /// `The Buyer assumes all obligations and risks associated with concluding an agreement with a banking or financial organization for payment for Goods and/or services on the Marketplace. Neither Easy Shoppin nor any other Seller takes part in the consideration by a banking or financial organization of the possibility of providing funds to the Buyer and are not responsible in the event of the Buyer’s refusal to make such payment, and are also not responsible for the Buyer’s actions in transactions and the purchase of other services of the banking or financial organization, which they are not a party to.`
  String get buyerAssumesObligationsRisks {
    return Intl.message(
      'The Buyer assumes all obligations and risks associated with concluding an agreement with a banking or financial organization for payment for Goods and/or services on the Marketplace. Neither Easy Shoppin nor any other Seller takes part in the consideration by a banking or financial organization of the possibility of providing funds to the Buyer and are not responsible in the event of the Buyer’s refusal to make such payment, and are also not responsible for the Buyer’s actions in transactions and the purchase of other services of the banking or financial organization, which they are not a party to.',
      name: 'buyerAssumesObligationsRisks',
      desc: '',
      args: [],
    );
  }

  /// ` Payment using WB Electronic Wallet`
  String get paymentUsingElectronicWallet {
    return Intl.message(
      ' Payment using WB Electronic Wallet',
      name: 'paymentUsingElectronicWallet',
      desc: '',
      args: [],
    );
  }

  /// `When choosing to pay for the Order using the WB Electronic Wallet, the cost of the Product and the cost of the delivery service are debited from the WB Electronic Wallet. If there are insufficient funds on the balance of the WB Electronic Wallet, the unpaid balance of the cost of the Order and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.`
  String get orderUsingElectronicWallet {
    return Intl.message(
      'When choosing to pay for the Order using the WB Electronic Wallet, the cost of the Product and the cost of the delivery service are debited from the WB Electronic Wallet. If there are insufficient funds on the balance of the WB Electronic Wallet, the unpaid balance of the cost of the Order and the cost of the delivery service is debited from the bank card, the details of which are indicated in the Personal Account.',
      name: 'orderUsingElectronicWallet',
      desc: '',
      args: [],
    );
  }

  /// ` By purchasing a product or ordering services on the Marketplace, the Buyer provides Easy Shoppin with consent to write off funds using the bank card details provided by the Buyer when placing an order for the product or the details of which are specified by the Buyer in the Personal Account (hereinafter referred to as Payment Data), consent to the processing of which has not been revoked in accordance with the established procedure, in the manner and cases provided for in this paragraph.`
  String get orderingServices {
    return Intl.message(
      ' By purchasing a product or ordering services on the Marketplace, the Buyer provides Easy Shoppin with consent to write off funds using the bank card details provided by the Buyer when placing an order for the product or the details of which are specified by the Buyer in the Personal Account (hereinafter referred to as Payment Data), consent to the processing of which has not been revoked in accordance with the established procedure, in the manner and cases provided for in this paragraph.',
      name: 'orderingServices',
      desc: '',
      args: [],
    );
  }

  /// ` If for some reason the funds for goods or services were not written off immediately after placing the Order (receipt of the Order), Easy Shoppin has the right, on its own initiative, to write off funds for all submitted Payment Data in accordance with the rules of payment systems, including VISA, MasterCard, MIR, Fast Payment System, and on the following conditions:`
  String get reasonFundsGoods {
    return Intl.message(
      ' If for some reason the funds for goods or services were not written off immediately after placing the Order (receipt of the Order), Easy Shoppin has the right, on its own initiative, to write off funds for all submitted Payment Data in accordance with the rules of payment systems, including VISA, MasterCard, MIR, Fast Payment System, and on the following conditions:',
      name: 'reasonFundsGoods',
      desc: '',
      args: [],
    );
  }

  /// ` the write-off amount is the unpaid cost of goods or services, which the Buyer was familiar with at the time of placing the order or before that moment;`
  String get reasonFundsGoods1 {
    return Intl.message(
      ' the write-off amount is the unpaid cost of goods or services, which the Buyer was familiar with at the time of placing the order or before that moment;',
      name: 'reasonFundsGoods1',
      desc: '',
      args: [],
    );
  }

  /// ` write-off is made in Russian Rubles, unless another currency was agreed upon by the parties when placing the order;`
  String get reasonFundsGoods2 {
    return Intl.message(
      ' write-off is made in Russian Rubles, unless another currency was agreed upon by the parties when placing the order;',
      name: 'reasonFundsGoods2',
      desc: '',
      args: [],
    );
  }

  /// ` Easy Shoppin does not charge the Buyer a commission or other fee for such write-offs;`
  String get reasonFundsGoods3 {
    return Intl.message(
      ' Easy Shoppin does not charge the Buyer a commission or other fee for such write-offs;',
      name: 'reasonFundsGoods3',
      desc: '',
      args: [],
    );
  }

  /// ` Cancellation of transactions and refund of funds are carried out according to the rules of the payment system, in accordance with which the debit is carried out.`
  String get reasonFundsGoods4 {
    return Intl.message(
      ' Cancellation of transactions and refund of funds are carried out according to the rules of the payment system, in accordance with which the debit is carried out.',
      name: 'reasonFundsGoods4',
      desc: '',
      args: [],
    );
  }

  /// ` The consent given in accordance with this paragraph may be revoked by the Buyer by deleting the Payment Data from the Personal Account.`
  String get paragraphRevoked {
    return Intl.message(
      ' The consent given in accordance with this paragraph may be revoked by the Buyer by deleting the Payment Data from the Personal Account.',
      name: 'paragraphRevoked',
      desc: '',
      args: [],
    );
  }

  /// ` Upon receipt of an Order with the selected payment method upon receipt, payment for the cost of the Order can be received by Easy Shoppin in any method available for selection when placing an order, regardless of the payment method for the Order selected by the Buyer. The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.`
  String get uponReceiptOrder {
    return Intl.message(
      ' Upon receipt of an Order with the selected payment method upon receipt, payment for the cost of the Order can be received by Easy Shoppin in any method available for selection when placing an order, regardless of the payment method for the Order selected by the Buyer. The Buyer understands that the above actions on the part of the Owner of the Trading Platform are carried out in the interests of the Buyer and are aimed at implementing the will of the Buyer as a party to this agreement.',
      name: 'uponReceiptOrder',
      desc: '',
      args: [],
    );
  }

  /// ` If the purchase and sale agreement for a Product presented on the Marketplace is concluded not with Easy Shoppin, but with another Seller who has placed an offer for the Product on the Marketplace, payment is made to the account of Easy Shoppin, acting on behalf of the relevant Seller in terms of accepting funds in payment account for Goods with the involvement of an authorized payment acceptance operator or electronic money operator and is the recipient of the payment as a representative of the Seller.`
  String get purchaseSaleAgreement {
    return Intl.message(
      ' If the purchase and sale agreement for a Product presented on the Marketplace is concluded not with Easy Shoppin, but with another Seller who has placed an offer for the Product on the Marketplace, payment is made to the account of Easy Shoppin, acting on behalf of the relevant Seller in terms of accepting funds in payment account for Goods with the involvement of an authorized payment acceptance operator or electronic money operator and is the recipient of the payment as a representative of the Seller.',
      name: 'purchaseSaleAgreement',
      desc: '',
      args: [],
    );
  }

  /// ` In accordance with the terms of these Rules, a cash receipt in electronic form is provided by telephone number by displaying information in the form of a message in the Personal Account. The cash receipt in electronic form is sent to the “Electronic Receipts” section of your Personal Account. The buyer can provide an email address in the “Profile” section and independently send a cash receipt to the email address in the “Electronic Receipts” section.`
  String get accordanceTermsRules {
    return Intl.message(
      ' In accordance with the terms of these Rules, a cash receipt in electronic form is provided by telephone number by displaying information in the form of a message in the Personal Account. The cash receipt in electronic form is sent to the “Electronic Receipts” section of your Personal Account. The buyer can provide an email address in the “Profile” section and independently send a cash receipt to the email address in the “Electronic Receipts” section.',
      name: 'accordanceTermsRules',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer has the right at any time to initiate the transfer of funds recorded and displayed on the Personal Account Balance to an account with a credit institution in full or in part, with the exception of Bonus Points accrued in accordance with clause 2.10 of these Rules. Easy Shoppin transfers the funds accounted for and displayed on the Balance within 10 days from the date of receipt of the Buyer’s order. The Buyer’s order is sent using the “Withdrawal of Funds” functionality in the “Balance and Transaction History” section of the Personal Account.`
  String get buyerInitiateTransfer {
    return Intl.message(
      ' The Buyer has the right at any time to initiate the transfer of funds recorded and displayed on the Personal Account Balance to an account with a credit institution in full or in part, with the exception of Bonus Points accrued in accordance with clause 2.10 of these Rules. Easy Shoppin transfers the funds accounted for and displayed on the Balance within 10 days from the date of receipt of the Buyer’s order. The Buyer’s order is sent using the “Withdrawal of Funds” functionality in the “Balance and Transaction History” section of the Personal Account.',
      name: 'buyerInitiateTransfer',
      desc: '',
      args: [],
    );
  }

  /// ` The Buyer acknowledges that payment methods, as a result of which Easy Shoppin does not receive information from which account the payment was made by the Buyer, include payment for the Goods using the Faster Payment System (FPS).`
  String get buyerAcknowledges {
    return Intl.message(
      ' The Buyer acknowledges that payment methods, as a result of which Easy Shoppin does not receive information from which account the payment was made by the Buyer, include payment for the Goods using the Faster Payment System (FPS).',
      name: 'buyerAcknowledges',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
