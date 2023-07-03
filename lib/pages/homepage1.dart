import 'dart:developer';

import 'package:datum/controllers/home_controller.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:datum/widgets/coffee_view.dart';
import 'package:datum/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage1 extends StatelessWidget {
  HomePage1({super.key});

  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        log('Changing animation');
        homeController.updateHomeAnim(!homeController.hideAnim);
      },
    );

    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return !controller.hideAnim
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/coffee_cup.gif',
                      height: 200,
                      width: 200,
                    ),
                    SizeConfig.h20,
                    SizeConfig.h20
                  ],
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///
                  /// Upper Header Row - Loyalty Card View
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),

                        ///
                        /// Header Row
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///
                            /// Greeting Message
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Good Morning',
                                  style: ThemeStyle.mediumText!
                                      .copyWith(color: ThemeStyle.accentColor),
                                ),
                                SizeConfig.h5,
                                Text(
                                  'Muhammad Aamir',
                                  style: ThemeStyle.mediumText!
                                      .copyWith(color: ThemeStyle.textColor),
                                )
                              ],
                            ),

                            ///
                            /// Navigation Button - Cart & Profile
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                SvgIcon(imageAsset: 'assets/images/buy.svg'),
                                SvgIcon(
                                    imageAsset: 'assets/images/profile.svg'),
                              ],
                            )
                          ],
                        ),
                        SizeConfig.h10,

                        ///
                        /// Loyalty Card
                        Container(
                          decoration: BoxDecoration(
                              color: ThemeStyle.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              ///
                              /// Loyalty Count View
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Loyalty Card',
                                    style: ThemeStyle.mediumText!.copyWith(
                                        color: ThemeStyle.accentColor),
                                  ),
                                  Text(
                                    '5 / 8',
                                    style: ThemeStyle.mediumText!.copyWith(
                                        color: ThemeStyle.accentColor),
                                  ),
                                ],
                              ),
                              SizeConfig.h10,

                              ///
                              /// Availed Cups View
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Wrap(
                                  runSpacing: 10,
                                  direction: Axis.horizontal,
                                  children: List.generate(8, (index) {
                                    return SvgPicture.asset(
                                      index < 5
                                          ? 'assets/images/availed_cup.svg'
                                          : 'assets/images/unavailed_cup.svg',
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  90) /
                                              8,
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  ///
                  /// Choose your coffee view
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeStyle.primaryColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height * 0.65) - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        /// title
                        Text(
                          'Choose your coffee',
                          style: ThemeStyle.mediumText!
                              .copyWith(fontSize: 18)
                              .copyWith(color: ThemeStyle.accentColor),
                        ),
                        SizeConfig.h20,

                        ///
                        /// Coffee Types - Row 1
                        ///
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                              (MediaQuery.of(context).size.height * 0.6 - 230) /
                                  2,
                          child:

                              ///
                              /// Row 1
                              Row(
                            children: [
                              ///
                              /// Americano Coffee View

                              const CoffeeView(
                                  imagePath: 'assets/images/mug1.png',
                                  title: 'Americano'),
                              SizeConfig.w10,
                              SizeConfig.w5,

                              ///
                              /// Cappuccino Coffee View
                              const CoffeeView(
                                  imagePath: 'assets/images/mug2.png',
                                  title: 'Cappuccino'),
                            ],
                          ),
                        ),

                        SizeConfig.h10, SizeConfig.h5,

                        ///
                        /// Coffee Types - Row 2
                        ///
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                              (MediaQuery.of(context).size.height * 0.6 - 230) /
                                  2,
                          child:

                              ///
                              /// Row 2
                              Row(
                            children: [
                              ///
                              /// Mocha Coffee View
                              const CoffeeView(
                                  imagePath: 'assets/images/mug3.png',
                                  title: 'Mocha Coffee'),
                              SizeConfig.w10,
                              SizeConfig.w5,

                              ///
                              /// Flat White Coffee View
                              const CoffeeView(
                                  imagePath: 'assets/images/mug4.png',
                                  title: 'Flat White'),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
      }),
    );
  }
}
