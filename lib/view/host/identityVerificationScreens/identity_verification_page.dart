import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/host/identityVerificationScreens/uplode_documents_page.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

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
                  commonText("Verify Your Identity".tr,
                      color: AppColor.primaryColor, size: 24, isBold: true),
                  const SizedBox(
                    height: 50,
                  ),
                  commonText("Enhance Trust with Verified ID!".tr, size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  commonText(
                      "Secure your profile with our robust ID verification system and show others that you're serious about safety and reliability."
                          .tr,
                      textAlign: TextAlign.center,
                      size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/verifyImage.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  commonButton("Continue".tr, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UploadDocumentPage()),
                    );
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
