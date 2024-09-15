import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/otp_repository/otp_repository.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_otp_field.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/otp_controller.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class OtpPage extends StatelessWidget {
  final bool bottomSheet;
  final String email;
  final bool isFromAuth;
  OtpPage(
      {super.key,
      this.bottomSheet = false,
      required this.email,
      required this.isFromAuth});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OtpController _controller = Get.put(OtpController());
    final OtpRepository _otpApi = OtpRepository();
    final UserPreference userPreference = UserPreference();

    // List<TextEditingController> controllers =
    //   List.generate(6, (index) => TextEditingController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Image.asset(
        "assets/images/bg-image.jpg",
        fit: BoxFit.fitWidth,
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: commonText(
                  'Verification Code!'.tr,
                  size: 24,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText("\nWe have sent an email to",
                        size: 14, textAlign: TextAlign.center),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: email,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const TextSpan(
                            text: " with a OTP reset password",
                            style: TextStyle(
                              color: Colors
                                  .black, // or any other color you want for this part
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              commonTextfield(otpController, hintText: "Enter your OTP here."),
              const SizedBox(height: 30.0),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return commonButton("Done".tr, onTap: () {
                  _controller.verifyOtp(isFromAuth, otpController);
                }, isLoading: _controller.isLoading.value);
              }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText("Resend the OTP again via whatsapp?".tr),
                  GestureDetector(
                      onTap: () {
                        Map<String, dynamic> otpData = {
                          "email": email,
                          "type": "whatsapp"
                        };
                        _otpApi.resendOtpApi(otpData).then((value) {
                          if (value.success == true) {
                            userPreference
                                .saveUser(value.data!.token.toString(), "", "",
                                    "", "")
                                .then((value2) {
                              Utils.snackBar("OTP", value.message!);
                            });
                          }
                        });
                      },
                      child: commonText(" Resend".tr,
                          color: AppColor.primaryColor)),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
