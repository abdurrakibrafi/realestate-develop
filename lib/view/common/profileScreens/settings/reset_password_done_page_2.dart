// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

class ResetPasswoardDoneScreen2 extends StatefulWidget {
  const ResetPasswoardDoneScreen2({super.key});

  @override
  State<ResetPasswoardDoneScreen2> createState() =>
      _ResetPasswoardDoneScreen2State();
}

class _ResetPasswoardDoneScreen2State extends State<ResetPasswoardDoneScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red, width: double.infinity, height: double.infinity),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/icons/verified.png")],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: commonText(
                  'Congratulations!'.tr,
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
                "Go to home".tr,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
