// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:datum/controllers/cart_controller.dart';
import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../models/cart_item.dart';

class CartItemView extends StatelessWidget {
  final CartItem item;
  final int index;

  const CartItemView({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          extentRatio: 0.15,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Get.find<CartController>().deleteCartItem(index);
              },
              backgroundColor: ThemeStyle.errorColor.withOpacity(0.1),
              foregroundColor: ThemeStyle.errorColor,
              icon: Icons.delete_outlined,
              padding: const EdgeInsets.only(right: 10, left: 10),
              borderRadius: BorderRadius.circular(15),
              flex: 1,
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: Container(
          padding: const EdgeInsets.only(top: 7, bottom: 7,),
          margin: const EdgeInsets.only(left: 15, right: 10),
          decoration: BoxDecoration(
              color: ThemeStyle.accentColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            ///
            /// Coffee Image
            leading: Image.asset(
              'assets/images/${item.image.toLowerCase().replaceAll(' ', '_')}.png',
              height: MediaQuery.of(context).size.height * .20,
            ),

            ///
            /// Total Price
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${item.total.toDouble().toStringAsFixed(2)}',
                  style: ThemeStyle.largeText!.copyWith(
                      fontWeight: FontWeight.bold, color: ThemeStyle.textColor),
                ),
              ],
            ),

            ///
            /// Name of Coffee
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                item.getItemName,
                style: ThemeStyle.mediumText!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            ///
            /// Count and Detail of Coffee
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.getItemDetail,
                  style: ThemeStyle.normalText!
                      .copyWith(color: ThemeStyle.accentColor, fontSize: 12),
                ),
                SizeConfig.h10,
                Text(
                  'x ${item.quantity}',
                  style: ThemeStyle.normalText!.copyWith(
                      color: ThemeStyle.textColor.withOpacity(0.7),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
