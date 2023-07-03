// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/theme_style.dart';

class ForwardButton extends StatelessWidget {
  final Function goNextFunc;

  const ForwardButton({
    Key? key,
    required this.goNextFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 10, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              goNextFunc();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeStyle.primaryColor,
              shape: const CircleBorder(),
              elevation: 0,
              padding: const EdgeInsets.all(10),
              textStyle: const TextStyle(fontSize: 17),
            ),
            child: const Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
    );
  }
}
