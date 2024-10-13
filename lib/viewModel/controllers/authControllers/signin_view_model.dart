import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/auth_repository/login_repository.dart';
import 'package:real_estate_management/repository/otp_repository/otp_repository.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/utils/app_constant.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/otp_page.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class SigninViewModel extends GetxController {
  final _api = LoginRepository();
  final _otpApi = OtpRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  var selectedValue = 0.obs;
  var isLoginPage = false.obs;
  var pageControllerValue = 0.obs;
  var obscuringCharacter = false.obs;

  void setSelectedValue(int value) {
    selectedValue.value = value;
    log(value.toString());
    if (value == 1 || value == 2) {
      pageControllerValue.value = 1;
    }
  }

  void setisLoginvalueValue(bool value) {
    isLoginPage.value = value;
    if (value == true) {
      pageControllerValue.value = 3;
    }
  }

  void setobscuringCharacterValue() {
    obscuringCharacter.value = !obscuringCharacter.value;
  }

  RxBool loading = false.obs;
  @override
  void onClose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    super.onClose();
  }

  void loginApi() {
    loading.value = true;
    Map<String, dynamic> data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    Map<String, dynamic> otpData = {
      "email": emailController.value.text,
    };
    log(data.toString());
    _api.loginApi(data).then((value) {
   //   if (value.data!.user!.verification!.status == true) {
        LocalStorage.saveData(
            key: "userId", data: value.data!.user!.sId.toString());
        LocalStorage.saveData(
            key: AppConstant.token, data: value.data!.accessToken.toString());
        LocalStorage.saveData(
            key: "role", data: value.data!.user!.role.toString());
        userPreference
            .saveUser(
                value.data!.accessToken.toString(),
                value.data!.user!.sId.toString(),
                value.data!.user!.role.toString(),
                value.data!.user!.name.toString(),
                value.data!.user!.image.toString())
            .then((value2) {
          Utils.snackBar("Login", "Login successfully");
          loading.value = false;
          Get.offAll(() => const GuestRootScreen());
        });
     /* } else {
        _otpApi.resendOtpApi(otpData).then((value) {
          if (value.success == true) {
            userPreference
                .saveUser(value.data!.token.toString(), "", "", "","")
                .then((value2) {
              loading.value = false;
              Get.to(() => OtpPage(
                    email: emailController.value.text,
                    isFromAuth: true,
                  ));
              Utils.snackBar("OTP", value.message!);
            });
          }
        });
      }*/
    }).onError((error, stackTrace) {
      loading.value = false;
      log(error.toString());
      Utils.snackBar("Error", error.toString().replaceAll('Exception: ', ''));
    });
  }
}
