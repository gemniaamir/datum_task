// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:datum/controllers/authentication_controller.dart';
import 'package:datum/routes/routers.dart';
import 'package:datum/widgets/forward_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';
import 'package:pinput/pinput.dart';

class OTPVerification extends StatelessWidget {
  OTPVerification({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String rightOTP = '1234';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: GetBuilder<AuthenticationController>(
        builder: (controller) {
          return Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 100,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizeConfig.h20,
                        SizeConfig.h20,
                        Text(
                          'Verification',
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizeConfig.h20,
                        Text(
                          'Enter the OTP Code we send to you',
                          style: ThemeStyle.normalText!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ThemeStyle.accentColor),
                        ),
                        SizeConfig.h20,
                        SizeConfig.h20,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///
                            /// Successfull OTP for testing is set to
                            Pinput(
                              validator: (s) {
                                return s == rightOTP
                                    ? 'Correct Pin entered'
                                    : 'Pin is incorrect';
                              },
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) {
                                log('Entered pin is : $pin');
                                if (pin == rightOTP) {
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) {
                                    Get.toNamed(RouteHelper.signIn);
                                  });
                                }
                              },
                            ),
                          ],
                        ),

                        SizeConfig.h20,

                        ///
                        /// Sign In Action Button
                        ForwardButton(goNextFunc: goForwardAction),
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  goForwardAction() {
    ///
    /// Verify OTP Code
    Get.toNamed(RouteHelper.signIn);
  }
}
