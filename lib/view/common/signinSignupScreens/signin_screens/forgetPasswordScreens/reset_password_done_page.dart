// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/main.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class ResetPasswoardDoneScreen extends StatefulWidget {
  const ResetPasswoardDoneScreen({super.key});

  @override
  State<ResetPasswoardDoneScreen> createState() =>
      _ResetPasswoardDoneScreenState();
}

class _ResetPasswoardDoneScreenState extends State<ResetPasswoardDoneScreen> {
  UserPreference userPreference = UserPreference();
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
                    'Excellent!\nPassword Changed'.tr,
                    size: 24,
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: commonText(
                      "\nYour password has been changed\nsuccessfully",
                      size: 14,
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 30.0),
                const SizedBox(
                  height: 20,
                ),
                commonButton(
                  "Login".tr,
                  onTap: () {
                    userPreference.removeUser().then((value) {
                    //  resetApp();
                      Get.offAll(const SigninPage());
                    });
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
