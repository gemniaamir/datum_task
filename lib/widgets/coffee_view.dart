import 'package:datum/routes/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme_style.dart';

class CoffeeView extends StatelessWidget {
  final String imagePath;
  final String title;

  const CoffeeView({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTapEvent,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height * .11,
            ),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: ThemeStyle.mediumText,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    ));
  }

  onTapEvent() {
    Get.toNamed(RouteHelper.detailPage(title));
  }
}
