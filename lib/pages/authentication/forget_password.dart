// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:datum/controllers/authentication_controller.dart';
import 'package:datum/pages/authentication/otp_verification.dart';
import 'package:datum/routes/routers.dart';
import 'package:datum/widgets/forward_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';

import '../../widgets/svg_icon.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                          'Forget Password',
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizeConfig.h20,
                        Text(
                          'Enter your email address',
                          style: ThemeStyle.normalText!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ThemeStyle.accentColor),
                        ),
                        SizeConfig.h20,
                        SizeConfig.h20,
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              ///
                              /// Email View
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      /// Svg Icon - Container size is 40
                                      const SvgIcon(
                                        imageAsset: 'assets/images/message.svg',
                                      ),

                                      ///
                                      /// H Line
                                      Container(
                                        height: 30,
                                        width: 1,
                                        color: ThemeStyle.accentColor
                                            .withOpacity(0.5),
                                      ),

                                      ///
                                      /// Email Address Field
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                75,
                                        child: TextFormField(
                                          controller: emailController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Email address',
                                            hintStyle: ThemeStyle.normalText!
                                                .copyWith(
                                                    color: ThemeStyle
                                                        .accentColor
                                                        .withOpacity(0.5),
                                                    fontSize: 12),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 7, 5),
                                          ),
                                          style: ThemeStyle.mediumText!
                                              .copyWith(
                                                  color: ThemeStyle.textColor,
                                                  fontSize: 14),
                                          validator: (value) {
                                            // Check if email is empty

                                            if (value!.isEmpty) {
                                              return 'Email cannot be empty';
                                            }
                                            // Check if email is a valid email
                                            if (EmailValidator.validate(
                                                value)) {
                                              Get.toNamed(
                                                  RouteHelper.otpVerification);
                                            } else {
                                              return 'Write a valid email';
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),

                                  ///
                                  /// W Line
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color:
                                        ThemeStyle.accentColor.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              SizeConfig.h20,
                            ],
                          ),
                        ),

                        SizeConfig.h20, SizeConfig.h20,

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
    _formKey.currentState!.validate();
  }
}
