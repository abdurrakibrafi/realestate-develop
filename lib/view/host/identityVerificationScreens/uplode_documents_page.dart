import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/host/identityVerificationScreens/verification_done_page.dart';

class UploadDocumentPage extends StatelessWidget {
  const UploadDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonText("Upload Your Documents".tr,
                    isBold: true, color: AppColor.primaryColor, size: 24),
                const SizedBox(
                  height: 50,
                ),
                commonText("Front Side of Your ID (or Passport)".tr, size: 18),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [7, 7],
                    color: AppColor.primaryColor,
                    strokeWidth: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 40,
                          ),
                          commonText("Upload".tr, size: 20)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonText("Back Side of Your ID".tr, size: 18),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [7, 7],
                    color: AppColor.primaryColor,
                    strokeWidth: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 40,
                          ),
                          commonText("Upload".tr, size: 20)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Expanded(
                          child: commonText(
                              "I certify that the documents I have provided are original and accurate"
                                  .tr)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonButton("Submit".tr, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerificationDonePage()),
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
    );
  }
}
