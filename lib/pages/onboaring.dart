import 'package:datum/pages/home_base_view.dart';
import 'package:datum/pages/homepage.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:datum/widgets/forward_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/on_boarding_contents.dart';
import '../utils/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: ThemeStyle.primaryColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 30 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    saveFirstTimeBit();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///
            /// Image, Title & Subtitle Area
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        ///
                        /// Image from assets
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 40,
                        ),
                        SizeConfig.h20,

                        ///
                        /// Title
                        Flexible(
                          child: Text(
                            contents[i].title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: ThemeStyle.textColor,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizeConfig.h20,

                        ///
                        /// Subtitle
                        Text(
                          contents[i].desc,
                          style: GoogleFonts.poppins(
                            color: ThemeStyle.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeBaseView()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeStyle.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 10)
                                  : EdgeInsets.symmetric(
                                      horizontal: width * 0.2, vertical: 25),
                              textStyle:
                                  TextStyle(fontSize: (width <= 550) ? 13 : 17),
                            ),
                            child: Text(
                              "START BREWING",
                              style: ThemeStyle.normalTextWH,
                            ),
                          ),
                        )
                      : ForwardButton(goNextFunc: goNextFunc)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveFirstTimeBit() async {
    //
    // Save first time false bit in SP
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('ft', false);
  }

  goNextFunc() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }
}
