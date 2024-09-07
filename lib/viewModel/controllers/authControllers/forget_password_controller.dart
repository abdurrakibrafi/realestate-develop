import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/otp_repository/otp_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/otp_page.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final OtpRepository _otpApi = OtpRepository();
  final UserPreference userPreference = UserPreference();
  var isLoading = false.obs;

  void sendOtp() async {
    if (emailController.text.isEmpty) {
      Utils.snackBar("Empty Field", "Please fill all fields");
      return;
    }

    isLoading.value = true;
    Map<String, dynamic> otpData = {
      "email": emailController.value.text,
    };

    final value = await _otpApi.forgetPassApi(otpData);
    if (value.success == true) {
      await userPreference.saveUser(value.data!.token.toString(), "", "", "","");
      isLoading.value = false;
      Get.to(() => OtpPage(
            email: emailController.value.text,
            isFromAuth: false,
          ));
      Utils.snackBar("OTP", value.message!);
    } else {
      isLoading.value = false;
      Utils.snackBar("Error", "Failed to send OTP");
    }
  }
}
