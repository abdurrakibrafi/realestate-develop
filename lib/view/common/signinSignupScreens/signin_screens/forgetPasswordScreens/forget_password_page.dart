import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/forget_password_controller.dart';

class ForgetPasswordPage extends StatelessWidget {
  final bool bottomSheet;
  const ForgetPasswordPage({super.key, this.bottomSheet = false});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller =
        Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SizedBox(
        width: double.infinity,
        height: 530,
        child: ColorFiltered(
          colorFilter:
              const ColorFilter.mode(Colors.black45, BlendMode.multiply),
            child: Image.asset("assets/images/bg-image.jpg",fit: BoxFit.fill,),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            commonText("Forgot password".tr, size: 24, isBold: true),
            commonText(
                "\nPlease enter your email address to reset\nyour password",
                textAlign: TextAlign.center),
            const SizedBox(
              height: 40,
            ),
            Form(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: commonTextfieldWithTitle(
                    "Email".tr, controller.emailController,
                    hintText: "Enter your email".tr,
                    keyboardType: TextInputType.emailAddress),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return commonButton(
                "Send".tr,
                isLoading: controller.isLoading.value,
                onTap: controller.isLoading.value
                    ? null
                    : () {
                        controller.sendOtp();
                      },
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText("Remember password?".tr),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()),
                      );
                    },
                    child:
                        commonText("Login".tr, color: AppColor.primaryColor)),
                const SizedBox(
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
