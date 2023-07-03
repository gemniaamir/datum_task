import 'package:datum/controllers/cart_controller.dart';
import 'package:datum/controllers/home_controller.dart';
import 'package:datum/models/cart_item.dart';
import 'package:datum/routes/routers.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:datum/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class DetailPage extends StatelessWidget {
  final String itemName;

  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    /// Cart Controller - to add items in cart
    final CartController cartController = Get.find<CartController>();

    /// Reset Item Detail
    Get.find<HomeController>().resetCountAndDetail();

    return Scaffold(body: GetBuilder<HomeController>(builder: (controller) {
      return Stack(
        children: [
          ///
          /// Fixed Header Row
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top,
            child:

                ///

                ///
                /// Header Row
                ListTile(
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const SvgIcon(imageAsset: 'assets/images/left.svg')),
              title: Center(
                child: Text(
                  'Details',
                  style: ThemeStyle.mediumText!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.cartPage);
                },
                child: Stack(
                  children: [
                    const SvgIcon(imageAsset: 'assets/images/buy.svg'),
                    GetBuilder<CartController>(builder: (cartController) {
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
                          cartController.cartItems.length.toString(),
                          style:
                              ThemeStyle.normalTextWH!.copyWith(fontSize: 12),
                        ),
                      ));
                    })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top + 50,
            child: SingleChildScrollView(
                child: Column(
              children: [
                ///
                /// Image Detail
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 20),
                  height: MediaQuery.of(context).size.height * .20,
                  decoration: BoxDecoration(
                      color: ThemeStyle.accentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    'assets/images/${itemName.toLowerCase().replaceAll(' ', '_')}.png',
                    height: MediaQuery.of(context).size.height * .20,
                  ),
                ),
                SizeConfig.h20,

                ///
                /// Choice List
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  shrinkWrap: true,
                  children: [
                    ///
                    /// Quantity selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemName,
                          style: ThemeStyle.mediumText!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      ThemeStyle.accentColor.withOpacity(0.5),
                                  width: 1)),
                          child: Row(children: [
                            SizeConfig.w5,

                            ///
                            /// Minus Action
                            InkWell(
                              onTap: () {
                                controller.updateCount(controller.count - 1);
                              },
                              child: Text(
                                '-',
                                style: ThemeStyle.largeText,
                              ),
                            ),
                            SizeConfig.w10,

                            ///
                            /// Counter

                            Text(
                              controller.count.toString(),
                              style: ThemeStyle.mediumText!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizeConfig.w10,

                            /// Add Action
                            InkWell(
                              onTap: () {
                                controller.updateCount(controller.count + 1);
                              },
                              child: Text(
                                '+',
                                style: ThemeStyle.largeText,
                              ),
                            ),
                            SizeConfig.w5
                          ]),
                        )
                      ],
                    ),
                    SizeConfig.h10,
                    SizeConfig.h5,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ThemeStyle.accentColor.withOpacity(0.2),
                    ),
                    SizeConfig.h20,

                    ///
                    /// Shot selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shot',
                          style: ThemeStyle.mediumText!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ///
                            ///  Single Selection

                            InkWell(
                              onTap: () {
                                controller.updateShotType('Single');
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: controller.shotType == 'Single'
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: ThemeStyle.accentColor
                                            .withOpacity(0.5),
                                        width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text(
                                    'Single',
                                    style: ThemeStyle.normalText!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: controller.shotType == 'Single'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizeConfig.w10,

                            ///
                            /// Double Selection
                            InkWell(
                              onTap: () {
                                controller.updateShotType('Double');
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: controller.shotType == 'Double'
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: ThemeStyle.accentColor
                                            .withOpacity(0.5),
                                        width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text(
                                    'Double',
                                    style: ThemeStyle.normalText!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: controller.shotType == 'Double'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizeConfig.h10,
                    SizeConfig.h5,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ThemeStyle.accentColor.withOpacity(0.2),
                    ),
                    SizeConfig.h20,

                    ///
                    /// Serving Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hot/Iced',
                          style: ThemeStyle.mediumText!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ///
                            ///  Hot Coffee

                            InkWell(
                                onTap: () {
                                  controller.updateServingType('hot');
                                },
                                child: SvgPicture.asset(
                                  'assets/images/cup.svg',
                                  color: controller.servingType == 'hot'
                                      ? Colors.black
                                      : ThemeStyle.accentColor.withOpacity(0.5),
                                )),
                            SizeConfig.w20, SizeConfig.w5,

                            ///
                            /// Iced Coffee
                            InkWell(
                                onTap: () {
                                  controller.updateServingType('iced');
                                },
                                child: SvgPicture.asset(
                                  'assets/images/disposable.svg',
                                  color: controller.servingType == 'iced'
                                      ? Colors.black
                                      : ThemeStyle.accentColor.withOpacity(0.5),
                                )),
                            SizeConfig.w10,
                          ],
                        )
                      ],
                    ),
                    SizeConfig.h10,
                    SizeConfig.h5,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ThemeStyle.accentColor.withOpacity(0.2),
                    ),
                    SizeConfig.h20,

                    ///
                    /// Size Selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Size',
                          style: ThemeStyle.mediumText!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ///
                            ///  Size Small

                            InkWell(
                                onTap: () {
                                  controller.updateSize('Small');
                                },
                                child: SvgPicture.asset(
                                  'assets/images/size_cup.svg',
                                  height: 22,
                                  color: controller.size == 'Small'
                                      ? Colors.black
                                      : ThemeStyle.accentColor.withOpacity(0.5),
                                )),
                            SizeConfig.w20, SizeConfig.w5,

                            ///
                            ///  Size Medium

                            InkWell(
                                onTap: () {
                                  controller.updateSize('Medium');
                                },
                                child: SvgPicture.asset(
                                  'assets/images/size_cup.svg',
                                  height: 26,
                                  color: controller.size == 'Medium'
                                      ? Colors.black
                                      : ThemeStyle.accentColor.withOpacity(0.5),
                                )),
                            SizeConfig.w20, SizeConfig.w5,

                            ///
                            ///  Size Large

                            InkWell(
                                onTap: () {
                                  controller.updateSize('Large');
                                },
                                child: SvgPicture.asset(
                                  'assets/images/size_cup.svg',
                                  height: 32,
                                  color: controller.size == 'Large'
                                      ? Colors.black
                                      : ThemeStyle.accentColor.withOpacity(0.5),
                                )),
                          ],
                        )
                      ],
                    ),
                    SizeConfig.h10,
                    SizeConfig.h5,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ThemeStyle.accentColor.withOpacity(0.2),
                    ),
                    SizeConfig.h20,

                    ///
                    /// Ice Cubes Selection
                    controller.servingType == 'iced'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ice',
                                style: ThemeStyle.mediumText!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ///
                                  ///  One Cube

                                  InkWell(
                                    onTap: () {
                                      controller.updateCubes('1');
                                    },
                                    child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Stack(children: [
                                        Positioned(
                                            top: 12,
                                            left: 7,
                                            child: SvgPicture.asset(
                                              'assets/images/cube.svg',
                                              height: 15,
                                              color: controller.cubes == '1'
                                                  ? Colors.black
                                                  : ThemeStyle.accentColor
                                                      .withOpacity(0.5),
                                            )),
                                      ]),
                                    ),
                                  ),
                                  SizeConfig.w10,

                                  ///
                                  ///  Two Cubes

                                  InkWell(
                                    onTap: () {
                                      controller.updateCubes('2');
                                    },
                                    child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Stack(children: [
                                        Positioned(
                                            top: 3,
                                            right: 5,
                                            child: SvgPicture.asset(
                                              'assets/images/cube.svg',
                                              height: 15,
                                              color: controller.cubes == '2'
                                                  ? Colors.black
                                                  : ThemeStyle.accentColor
                                                      .withOpacity(0.5),
                                            )),
                                        Positioned(
                                            top: 12,
                                            left: 7,
                                            child: SvgPicture.asset(
                                              'assets/images/cube.svg',
                                              height: 15,
                                              color: controller.cubes == '2'
                                                  ? Colors.black
                                                  : ThemeStyle.accentColor
                                                      .withOpacity(0.5),
                                            )),
                                      ]),
                                    ),
                                  ),
                                  SizeConfig.w10,

                                  ///
                                  ///  Three Cubes

                                  InkWell(
                                      onTap: () {
                                        controller.updateCubes('3');
                                      },
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Stack(children: [
                                          Positioned(
                                              child: SvgPicture.asset(
                                            'assets/images/cube.svg',
                                            height: 15,
                                            color: controller.cubes == '3'
                                                ? Colors.black
                                                : ThemeStyle.accentColor
                                                    .withOpacity(0.5),
                                          )),
                                          Positioned(
                                              top: 3,
                                              right: 5,
                                              child: SvgPicture.asset(
                                                'assets/images/cube.svg',
                                                height: 15,
                                                color: controller.cubes == '3'
                                                    ? Colors.black
                                                    : ThemeStyle.accentColor
                                                        .withOpacity(0.5),
                                              )),
                                          Positioned(
                                              top: 12,
                                              left: 7,
                                              child: SvgPicture.asset(
                                                'assets/images/cube.svg',
                                                height: 15,
                                                color: controller.cubes == '3'
                                                    ? Colors.black
                                                    : ThemeStyle.accentColor
                                                        .withOpacity(0.5),
                                              )),
                                        ]),
                                      )),
                                ],
                              )
                            ],
                          )
                        : Container(),
                    SizeConfig.h10,
                    SizeConfig.h5,
                  ],
                )
              ],
            )),
          ),

          ///
          /// Bottom Add to cart View
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black12, width: 1)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white70,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        blurStyle: BlurStyle.outer),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///
                  /// Amount View
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: ThemeStyle.mediumText,
                      ),
                      Text(
                        '\$ ${controller.itemTotal.toDouble().toStringAsFixed(2)}',
                        style: ThemeStyle.mediumText!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  ///
                  /// Checkout Button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.count == 0 ||
                            controller.shotType == '' ||
                            controller.servingType == '' ||
                            controller.size == '') {
                          /// Show success message to user
                          MotionToast.error(
                            description: Text(
                              'Please provide all details',
                              style: ThemeStyle.mediumTextWH,
                            ),
                            iconType: IconType.cupertino,
                            onClose: null,
                          ).show(context);
                        } else {
                          ///
                          /// Call to Checkout Event

                          cartController.addUpdateToCart(
                            CartItem(
                                itemName: itemName,
                                itemDetail: controller.getItemSummary(),
                                quantity: controller.count,
                                total: (controller.price * controller.count)
                                    .toDouble(),
                                image: itemName),
                          );

                          /// Show success message to user
                          MotionToast.success(
                            description: Text(
                              'Item has been added to cart',
                              style: ThemeStyle.mediumTextWH,
                            ),
                            iconType: IconType.cupertino,
                          ).show(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeStyle.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        textStyle: ThemeStyle.normalTextWH!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        "Add to Cart",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }));
  }
}
