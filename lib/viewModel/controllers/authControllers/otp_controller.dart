import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management/repository/otp_repository/otp_repository.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/reset_password_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

import '../../../view/common/signinSignupScreens/signup_screens/identity_varification.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
 // TextEditingController controllers = TextEditingController();
  final OtpRepository _otpApi = OtpRepository();
  final UserPreference userPreference = UserPreference();

/*  String getFullOtp() {
    return controllers.map((controller) => controller.text.trim()).join();
  }*/

  void verifyOtp(bool isFromAuth, TextEditingController controller) async {
    if (controller.text != "") {
      isLoading(true);
      String otp = controller.text;
      Map<String, dynamic> otpData = {"otp": otp};

      _otpApi.verifyOtpApi(otpData).then((value) async {
        isLoading(false);
        if (value.success == true) {

          await userPreference
              .saveUser(
                  value.data!.token.toString(),
                  value.data!.user!.sId.toString(),
                  value.data!.user!.role.toString(),
                  "","")
              .then((value2) {
            log(userPreference.getUser().toString());
            Get.offAll(() => isFromAuth == true
                ?  IdentityVerificationScreen()
                : const ResetPasswordPage());
            Utils.snackBar("OTP", value.message!);
          });
        } else {
          Utils.snackBar("OTP Error", value.message ?? "Verification failed!");
        }
      }).catchError((error) {
        isLoading(false);
        Utils.snackBar("OTP Error", "$error");
      });
    } else {
      Utils.snackBar("OTP Error", "Please fill all fields.");
    }
  }
}
