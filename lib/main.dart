import 'package:datum/pages/authentication/sign_in.dart';
import 'package:datum/pages/detail_page.dart';
import 'package:datum/pages/home_base_view.dart';
import 'package:datum/pages/homepage.dart';
import 'package:datum/pages/onboaring.dart';
import 'package:datum/routes/routers.dart';
import 'package:datum/utils/helping_methods.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dependencies/dependencies.dart' as dep;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await getFirstTimeBit().then(
    (value) {
      runApp(MyApp(value));
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp(this.isFirstTime, {super.key});
  bool isFirstTime;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///
    /// Loading our theme style before our app gets build
    ThemeStyle(context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: RouteHelper.pages,
      home: isFirstTime ? const OnboardingScreen() : SignIn(),
      theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
            titleMedium: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 18),
            titleSmall:
                GoogleFonts.montserrat(color: Colors.black, fontSize: 16),
          ),
          primarySwatch: getMaterialColor(const Color(0xFF314A59)),
          iconTheme: const IconThemeData(color: Colors.black)),
    );
  }
}

Future<bool> getFirstTimeBit() async {
  //
  // Save first time false bit in SP
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('ft')) {
    bool firstTime = prefs.getBool('ft')!;
    return firstTime;
  } else {
    return true;
  }
}
