import 'package:datum/pages/authentication/otp_verification.dart';
import 'package:datum/pages/cart_page.dart';
import 'package:datum/pages/detail_page.dart';
import 'package:datum/pages/home_base_view.dart';
import 'package:datum/pages/onboaring.dart';
import 'package:get/route_manager.dart';

import '../pages/authentication/forget_password.dart';
import '../pages/authentication/sign_in.dart';
import '../pages/authentication/sign_up.dart';

class RouteHelper {
  ///
  /// Route Names
  static const String _homeBaseView = '/home-base-view';
  static const String _onBoarding = '/on-boarding';
  static const String _signIn = '/sign-in';
  static const String _signUp = '/sign-up';
  static const String _forgetPassword = '/forget-password';
  static const String _otpVerification = '/otp-verification';
  static const String _detailPage = '/detail-page';
  static const String _cartPage = '/cart-page';

  ///
  /// Route Getters
  static String get homeBaseView => _homeBaseView;
  static String get onBoarding => _onBoarding;
  static String get signIn => _signIn;
  static String get signUp => _signUp;
  static String get forgetPassword => _forgetPassword;
  static String get otpVerification => _otpVerification;
  static String get cartPage => _cartPage;

  static String detailPage(String itemName) =>
      "$_detailPage?itemName=$itemName";

  ///
  /// Pages List
  static List<GetPage> pages = [
    GetPage(
        name: onBoarding,
        page: () => const OnboardingScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: signIn,
        page: () => SignIn(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: signUp,
        page: () => SignUp(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: forgetPassword,
        page: () => ForgetPassword(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: otpVerification,
        page: () => OTPVerification(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: homeBaseView,
        page: () => const HomeBaseView(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: _detailPage,
        page: () {
          var itemName = Get.parameters['itemName'];

          return DetailPage(
            itemName: itemName.toString(),
          );
        }),
    GetPage(
        name: cartPage,
        page: () => const CartPage(),
        transition: Transition.rightToLeftWithFade),
  ];
}
