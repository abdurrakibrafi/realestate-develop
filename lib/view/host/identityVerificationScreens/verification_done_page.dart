import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';

class VerificationDonePage extends StatefulWidget {
  const VerificationDonePage({super.key});

  @override
  State<VerificationDonePage> createState() => _VerificationDonePageState();
}

class _VerificationDonePageState extends State<VerificationDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/icons/Password Succesfully Ilustration.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  commonText("Excellent!\nVerification Completed".tr,
                      textAlign: TextAlign.center,
                      color: AppColor.blackColor,
                      size: 24,
                      isBold: true),
                  const SizedBox(
                    height: 30,
                  ),
                  commonText(
                      "Thank you for submitting your documents, we’ll review them and confirm your verification as soon as possible."
                          .tr,
                      textAlign: TextAlign.center,
                      size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  commonButton("Go to Home".tr, onTap: () {
                    Get.offAll(const GuestRootScreen());
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
