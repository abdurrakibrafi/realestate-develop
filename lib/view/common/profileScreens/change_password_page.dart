import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/chnage_password_controller.dart';

class ChnagePasswordPage extends StatelessWidget {
  final bool bottomSheet;
  const ChnagePasswordPage({super.key, this.bottomSheet = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChnagePasswordController());

    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SizedBox(
          width: double.infinity,
          height: 530,
          child: ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.multiply),
            child: Image.asset(
              "assets/images/reset.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20.0),
                commonText(
                  'Reset your password!'.tr,
                  size: 24,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                commonText(
                  'Please enter a new password for your account.'.tr,
                  size: 12,
                  color: Colors.grey[600]!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Obx(() {
                    return Column(
                      children: [
                        commonTextfieldWithTitle(
                            "Old Password".tr, controller.oPassController,
                            hintText: "Enter your password".tr,
                            obscureText: controller.oPassVisibility.value,
                            suffixWidget: (!controller.oPassVisibility.value)
                                ? InkWell(
                                    onTap: () {
                                      controller.setoPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility))
                                : InkWell(
                                    onTap: () {
                                      controller.setoPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility_off)),
                            keyboardType: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 20,
                        ),
                        commonTextfieldWithTitle(
                            "New Password".tr, controller.passController,
                            hintText: "Enter your password".tr,
                            obscureText: controller.passVisibility.value,
                            suffixWidget: (!controller.passVisibility.value)
                                ? InkWell(
                                    onTap: () {
                                      controller.setPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility))
                                : InkWell(
                                    onTap: () {
                                      controller.setPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility_off)),
                            keyboardType: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 20,
                        ),
                        commonTextfieldWithTitle("Confirm New Password".tr,
                            controller.cPassController,
                            suffixWidget: (!controller.cPassVisibility.value)
                                ? InkWell(
                                    onTap: () {
                                      controller.setcPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility))
                                : InkWell(
                                    onTap: () {
                                      controller.setcPassVisibleValue();
                                    },
                                    child: const Icon(Icons.visibility_off)),
                            hintText: "Enter your password".tr,
                            obscureText: controller.cPassVisibility.value,
                            keyboardType: TextInputType.visiblePassword),
                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  return commonButton(
                    isLoading: controller.isLoading.value,
                    "Done".tr,
                    onTap: () {
                      controller.api();
                    },
                  );
                }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
