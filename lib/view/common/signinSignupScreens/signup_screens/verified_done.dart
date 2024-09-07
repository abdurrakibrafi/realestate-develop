// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

class VerificationDoneScreen extends StatefulWidget {
  const VerificationDoneScreen({super.key});

  @override
  State<VerificationDoneScreen> createState() => _VerificationDoneScreenState();
}

class _VerificationDoneScreenState extends State<VerificationDoneScreen> {
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
                    'Excellent!\nVerification Completed'.tr,
                    size: 24,
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: commonText(
                      "\nThank you for submitting your documents, we’ll review them and confirm your verification as soon as possible",
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
