import 'package:datum/controllers/authentication_controller.dart';
import 'package:datum/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => AuthenticationController(), fenix: true);
  Get.lazyPut(() => CartController(), fenix: true);
}
