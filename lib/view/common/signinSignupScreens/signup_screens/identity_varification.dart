// lib/login_chooser_screen.dart
// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signup_screens/confirm_identity_page.dart';

import '../../../guest/guest_root_screen.dart';

class IdentityVerificationScreen extends StatefulWidget {
  IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
      child: Image.asset("assets/images/bg-image.jpg",fit: BoxFit.fill,),),
      ]),
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
                  'Build Trust by verifying your ID!'.tr,
                  size: 20,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                        "Why Verify Your Identity?".tr,
                        size: 16,
                        isBold: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          commonText("Ensure the security of your account."),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          commonText(
                              "Protect against fraud and unauthorized access."),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          commonText(
                              "Comply with legal and regulatory requirements."),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                "Verify Now".tr,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ConfirmIdentity();
                    },
                  ));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Get.offAll(const GuestRootScreen());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(width: 2, color: AppColor.primaryColor)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: commonText("Later",
                          size: 18, color: AppColor.primaryColor, isBold: true),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
