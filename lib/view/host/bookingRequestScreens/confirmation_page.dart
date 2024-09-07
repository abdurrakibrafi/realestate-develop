// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/icons/Password Succesfully Ilustration.png")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: commonText(
                    'Booking Confirmed!'.tr,
                    size: 24,
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: commonText(
                      "\nCongratulations! This booking has been confirmed. Please prepare the property and be available for any questions your guest may have.\n\nThank you for being a valued member. Contact support if you need assistance.",
                      size: 14,
                      color: Colors.grey,
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: commonText("\nHappy Renting!\nThe Mosta'ajer App Team",
                      color: AppColor.blackColor,
                      size: 16,
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 30.0),
                const SizedBox(
                  height: 20,
                ),
                commonButton(
                  "Go to home".tr,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     //
                    //   },
                    // ));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
