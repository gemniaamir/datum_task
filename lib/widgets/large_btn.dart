// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/size_config.dart';
import '../utils/theme_style.dart';

class LargeButton extends StatelessWidget {
  Function event;
  String title;

  LargeButton({
    Key? key,
    required this.event,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event(),
      child: Container(
        decoration: BoxDecoration(
            color: ThemeStyle.primaryColor,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/buy.svg',
              height: 20,
              color: Colors.white,
            ),
            SizeConfig.w10,
            Text(
              'Checkout',
              style: ThemeStyle.normalTextWH,
            ),
          ],
        ),
      ),
    );
  }
}
