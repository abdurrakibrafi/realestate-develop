import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/auth_repository/reset_password_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/reset_password_done_page.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordRepository _otpApi = ResetPasswordRepository();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  TextEditingController oPassController = TextEditingController();
  var passVisibility = true.obs;
  var cPassVisibility = true.obs;
  var oPassVisibility = true.obs;
  var isLoading = false.obs;

  void setPassVisibleValue() {
    passVisibility.value = !passVisibility.value;
  }

  void setcPassVisibleValue() {
    cPassVisibility.value = !cPassVisibility.value;
  }

  void setoPassVisibleValue() {
    oPassVisibility.value = !oPassVisibility.value;
  }

  void api() async {
    try {
      if (passController.text.isEmpty &&
          cPassController.text.isEmpty &&
          oPassController.text.isEmpty) {
        Utils.snackBar("Empty Field", "Please fill all fields");
        return;
      }

      isLoading.value = true;
      Map<String, dynamic> otpData = {
        // "oldPassword": oPassController.value.text,
        "confirmPassword": cPassController.value.text,
        "newPassword": passController.value.text
      };

      final value = await _otpApi.resetPassword(otpData);
      if (value.success == true) {
        isLoading.value = false;
        Get.to(() => const ResetPasswoardDoneScreen());
        Utils.snackBar("Done", value.message!);
      } else {
        isLoading.value = false;
        Utils.snackBar("Error", "Failed to reset password");
      }
    } catch (e) {
      log(e.toString());
     // Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
