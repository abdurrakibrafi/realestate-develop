// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/otp_page.dart';

class EmailSentPage extends StatelessWidget {
  bool bottomSheet;
  EmailSentPage({super.key, this.bottomSheet = false});

  String email = "example@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Image.asset("assets/images/emailbg.png"),
      ),
      bottomSheet: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: commonText(
                'Email sent!'.tr,
                size: 24,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonText("\nWe have sent an email to",
                      size: 14, textAlign: TextAlign.center),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: email,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: " with a link to reset password",
                          style: TextStyle(
                            color: Colors
                                .black, // or any other color you want for this part
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 0.0),
            SizedBox(
              height: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/email.png")],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            commonButton(
              "Open email app".tr,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpPage(
                            bottomSheet: bottomSheet,
                            email: "",
                            isFromAuth: false,
                          )),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText("Email not received?".tr),
                GestureDetector(
                    onTap: () {},
                    child:
                        commonText(" Resend".tr, color: AppColor.primaryColor)),
                SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
