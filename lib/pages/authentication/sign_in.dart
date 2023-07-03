// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:datum/controllers/authentication_controller.dart';
import 'package:datum/routes/routers.dart';
import 'package:datum/widgets/forward_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datum/utils/size_config.dart';
import 'package:datum/utils/theme_style.dart';

import '../../widgets/svg_icon.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          'Sign In',
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizeConfig.h20,
                        Text(
                          'Welcome Back',
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
                                              log('valid');
                                            } else {
                                              log('invalid');

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

                              ///
                              /// Password View
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      /// Svg Icon - Container size is 40
                                      const SvgIcon(
                                        imageAsset: 'assets/images/lock.svg',
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
                                      /// Password Field
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: !controller
                                              .isSignInPasswordVisible,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Password',
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
                                            if (value!.isEmpty ||
                                                value.length < 8) {
                                              return 'Password must be atleast of 8 characters ';
                                            }
                                            
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .updateSignInPasswordVisibility(
                                                  !controller
                                                      .isSignInPasswordVisible);
                                        },
                                        child: Icon(
                                          controller.isSignInPasswordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: ThemeStyle.textColor,
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
                              )
                            ],
                          ),
                        ),
                        SizeConfig.h10,
                        SizeConfig.h5,

                        ///
                        /// Forget Password button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteHelper.forgetPassword);
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: ThemeStyle.normalText!.copyWith(
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),

                        SizeConfig.h20, SizeConfig.h20,

                        ///
                        /// Sign In Action Button
                        ForwardButton(goNextFunc: goForwardAction),
                      ],
                    ),
                  )),

              ///
              /// New Member message box
              Positioned(
                  left: 30,
                  bottom: 0,
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          'New Member?',
                          style: ThemeStyle.normalText!
                              .copyWith(color: ThemeStyle.accentColor),
                        ),
                        SizeConfig.w5,
                        InkWell(
                          splashColor: Colors.amber,
                          onTap: () {
                            Get.toNamed(RouteHelper.signUp);
                          },
                          child: Text(
                            'Sign up',
                            style: ThemeStyle.normalText!
                                .copyWith(color: ThemeStyle.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  goForwardAction() {
    bool valid = _formKey.currentState!.validate();

    if (valid) {
      Get.toNamed(RouteHelper.homeBaseView);
    }
  }
}
