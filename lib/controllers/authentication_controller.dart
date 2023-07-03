import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  ///
  /// Sign In Password Visibility
  bool _isSignInPasswordVisible = false;
  bool get isSignInPasswordVisible => _isSignInPasswordVisible;

  updateSignInPasswordVisibility(value) {
    _isSignInPasswordVisible = value;
    update();
  }

  ///
  /// Sign Up Password Visibility
  bool _isSignUpPasswordVisible = false;
  bool get isSignUpPasswordVisible => _isSignUpPasswordVisible;

  updateSignUpPasswordVisibility(value) {
    _isSignUpPasswordVisible = value;
    update();
  }
}
