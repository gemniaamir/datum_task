import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:datum/controllers/home_controller.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:datum/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../routes/routers.dart';
import '../widgets/coffee_view.dart';

class HomePage extends StatelessWidget {
  ///
  /// View height based on padding top, bottom, bottom nav bar height calculations
  final double viewHeight;

  final HomeController homeController = Get.find<HomeController>();

  HomePage({super.key, required this.viewHeight});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        log('Changing animation');
        homeController.updateHomeAnim(!homeController.hideAnim);
      },
    );

    return GetBuilder<HomeController>(builder: (controller) {
      return
          //  !controller.hideAnim
          //     ? Center(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Image.asset(
          //               'assets/images/coffee_cup.gif',
          //               height: 200,
          //               width: 200,
          //             ),
          //             SizeConfig.h20,
          //             SizeConfig.h20
          //           ],
          //         ),
          //       )
          //     :
          SizedBox(
        height: viewHeight,
        child: Column(
          children: [
            ///
            /// Upper Header Row - Loyalty Card View
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              height: (viewHeight * 0.40) + 30,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///
                  /// Header Row
                  SizedBox(
                    height: viewHeight * 0.15,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///
                        /// Greeting Message
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.7) - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AutoSizeText(
                                'Good Morning',
                                maxLines: 1,
                                style: ThemeStyle.mediumText!
                                    .copyWith(color: ThemeStyle.accentColor),
                              ),
                              SizeConfig.h5,
                              AutoSizeText(
                                'Mohammad Aamir',
                                maxLines: 1,
                                style: ThemeStyle.mediumText!.copyWith(
                                    color: ThemeStyle.textColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),

                        ///
                        /// Navigation Button - Cart & Profile
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.3) - 15,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.cartPage);
                                  },
                                  child: Stack(
                                    children: [
                                      const SvgIcon(
                                          imageAsset: 'assets/images/buy.svg'),
                                      GetBuilder<CartController>(
                                          builder: (cartController) {
                                        return

                                            ///
                                            /// Cart items number
                                            Positioned(
                                                child: Container(
                                          height: 15,
                                          width: 15,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ThemeStyle.errorColor,
                                              shape: BoxShape.circle),
                                          child: Text(
                                            cartController.cartItems.length
                                                .toString(),
                                            style: ThemeStyle.normalTextWH!
                                                .copyWith(fontSize: 12),
                                          ),
                                        ));
                                      })
                                    ],
                                  )),
                              const SvgIcon(
                                  imageAsset: 'assets/images/profile.svg'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  ///
                  /// Loyalty Card
                  Container(
                    height: viewHeight * .25,
                    decoration: BoxDecoration(
                        color: ThemeStyle.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ///
                        /// Loyalty Count View
                        SizedBox(
                          height: (viewHeight * .20) * .30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Loyalty Card',
                                style: ThemeStyle.mediumText!
                                    .copyWith(color: ThemeStyle.accentColor),
                              ),
                              Text(
                                '5 / 8',
                                style: ThemeStyle.mediumText!
                                    .copyWith(color: ThemeStyle.accentColor),
                              ),
                            ],
                          ),
                        ),

                        ///
                        /// Availed Cups View
                        Container(
                          height: (viewHeight * .20) * .70,
                          width: MediaQuery.of(context).size.width - 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Wrap(
                            runAlignment: WrapAlignment.spaceEvenly,
                            direction: Axis.horizontal,
                            children: List.generate(8, (index) {
                              return SvgPicture.asset(
                                index < 5
                                    ? 'assets/images/availed_cup.svg'
                                    : 'assets/images/unavailed_cup.svg',
                                width:
                                    (MediaQuery.of(context).size.width - 110) /
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
            SizeConfig.h10,

            ///
            /// Choose your coffee view
            Container(
              decoration: BoxDecoration(
                  color: ThemeStyle.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: (viewHeight * 0.60) - 40,
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
                    height: ((viewHeight * 0.27) - 50),
                    child:

                        ///
                        /// Row 1
                        Row(
                      children: [
                        ///
                        /// Americano Coffee View

                        const CoffeeView(
                            imagePath: 'assets/images/americano.png',
                            title: 'Americano'),
                        SizeConfig.w10,
                        SizeConfig.w5,

                        ///
                        /// Cappuccino Coffee View
                        const CoffeeView(
                            imagePath: 'assets/images/cappuccino.png',
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
                    height: ((viewHeight * 0.27) - 50),
                    child:

                        ///
                        /// Row 2
                        Row(
                      children: [
                        ///
                        /// Mocha Coffee View
                        const CoffeeView(
                            imagePath: 'assets/images/mocha_coffee.png',
                            title: 'Mocha Coffee'),
                        SizeConfig.w10,
                        SizeConfig.w5,

                        ///
                        /// Flat White Coffee View
                        const CoffeeView(
                            imagePath: 'assets/images/flat_white.png',
                            title: 'Flat White'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
