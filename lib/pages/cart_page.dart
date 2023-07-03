import 'package:datum/controllers/cart_controller.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:datum/widgets/cart_item_view.dart';
import 'package:datum/widgets/large_btn.dart';
import 'package:datum/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(body: GetBuilder<CartController>(builder: (controller) {
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
                /// Header Row
                ListTile(
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const SvgIcon(imageAsset: 'assets/images/left.svg')),
              title: Center(
                child: Text(
                  'My Cart',
                  style: ThemeStyle.mediumText!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/images/buy.svg',
                color: Colors.white,
              ),
            ),
          ),

          ///
          /// List View of Cart items
          Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).padding.top + 50,
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: controller.cartItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: CartItemView(
                        item: controller.cartItems.elementAt(index),
                        index: index,
                      ),
                    );
                  })),

          ///
          /// Bottom Checkout View
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 90,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///
                  /// Amount View
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Amount',
                        style: ThemeStyle.normalText!.copyWith(
                            fontSize: 10,
                            color: ThemeStyle.accentColor.withOpacity(0.7),
                            fontWeight: FontWeight.bold),
                      ),
                      SizeConfig.h5,
                      Text(
                        '\$ ${controller.cartTotal().toStringAsFixed(2)}',
                        style: ThemeStyle.largeText!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ],
                  ),

                  ///
                  /// Checkout button
                  LargeButton(event: checkoutEvent, title: 'Check Out')
                ],
              ),
            ),
          )
        ],
      );
    }));
  }

  checkoutEvent() {}
}
