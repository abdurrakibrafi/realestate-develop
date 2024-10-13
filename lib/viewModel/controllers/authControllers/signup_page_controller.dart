import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/auth_repository/sign_up_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/otp_page.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

import '../../../service/local_storage.dart';

class SignupPageController extends GetxController {
  final String role;
  SignupPageController(this.role) {
    monthlyIncomeController = Get.put(
      DropdownController([
        'Under 800 KD',
        'Between 800 - 1499 KD',
        'Between 1500 - 3000 KD',
        'Over 3000 KD'
      ], selected: "Under 800 KD"),
      tag: 'monthlyIncome',
    );
    maritalStatusController = Get.put(
      DropdownController(["Married", "Unmarried", "Others"],
          selected: "Married"),
      tag: 'maritalStatus',
    );
    nationalityController = Get.put(
      DropdownController([
        "Kuwait".tr,
        "USA".tr,
      ], selected: "Kuwait"),
      tag: 'nationality',
    );
  }
  // var selectedCountryCode = '+965'.obs;
  var selectedRole = 'Tenant'.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController fullNameArabicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aboutYouTextController = TextEditingController();
  var dateOfBirthController = TextEditingController().obs;
  TextEditingController jobController = TextEditingController();
  late DropdownController monthlyIncomeController;
  late DropdownController maritalStatusController;
  late DropdownController nationalityController;
  var isTermsAccepted = false.obs;
  var isKycTermsAccepted = false.obs;
  var gender = 'Male'.obs;

  // var selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    // if (picked != null &&
    //     picked != DateTime(int.parse(dateOfBirthController.value.text))) {
    //   dateOfBirthController.value.text = picked.toIso8601String().split('T')[0];
    // }
    dateOfBirthController.value.text = picked!.toIso8601String().split('T')[0];
  }

  @override
  void onInit() {
    dateOfBirthController.value.text =
        DateTime.now().toIso8601String().split('T')[0];
    super.onInit();
  }

  final _api = SignUpRepository();
  RxBool isLoading = false.obs;
  UserPreference userPreference = UserPreference();

  void selectCountryCode(String item) {
    selectedCountryCode.value = item;
  }

  final Map<String, String> countryCodes = {
    '+965':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/1200px-Flag_of_Kuwait.svg.png',
    '+1':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/800px-Flag_of_the_United_States.svg.png',
  /*  '+88':
    'https://t4.ftcdn.net/jpg/01/04/47/13/360_F_104471360_1xohRUSRjfdGxoaRDtLg2z4ztBHkT21K.jpg',*/
    // Add more country codes as needed
  }.obs;
  var selectedCountryCode = '+965'.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  void selectGender(String newGender) {
    gender.value = newGender;
  }

  void resetFormData() {
    usernameController.clear();
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    aboutYouTextController.clear();
    dateOfBirthController.value.clear();
    nationalityController.dispose();
    maritalStatusController.dispose();
    jobController.clear();
    monthlyIncomeController.dispose();
    selectedCountryCode.value = '+965';
    selectedRole.value = 'Tenant';
    isTermsAccepted.value = false;
    isKycTermsAccepted.value = false;
    gender.value = 'Male';
  }

  bool validateForm() {
    List<TextEditingController> controllers = [
      usernameController,
      fullNameController,
      emailController,
      phoneNumberController,
      passwordController,
    ];

    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        Utils.snackBar("Validation Error", "All fields are required.");
        return false;
      }
    }
    if (!isTermsAccepted.value) {
      Utils.snackBar(
          "Validation Error", "Please accept the terms and conditions.");
      return false;
    }
    return true;
  }

  bool kycValidateForm() {
    List<TextEditingController> controllers = [
      dateOfBirthController.value,

    ];

    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        Utils.snackBar("Validation Error", "All fields are required.");
        return false;
      }
    }
    if (!isKycTermsAccepted.value) {
      Utils.snackBar(
          "Validation Error", "Please accept the terms and conditions.");
      return false;
    }

    return true;
  }

  void register() async {
    try {
      isLoading.value = true;
      Map<String, dynamic> data = {
        "username": usernameController.text,
        "name": fullNameController.text,
        "nameArabic": fullNameArabicController.text,
        "email": emailController.text,
        "gender": gender.value,
        "dateOfBirth": dateOfBirthController.value.text,
        "phoneNumber": phoneNumberController.text,
        "phoneCode": selectedCountryCode.value,
        "password": passwordController.text,
        "about": aboutYouTextController.text.isEmpty? "": aboutYouTextController.text,
        "nationality": nationalityController.selected.value,
        "maritalStatus": maritalStatusController.selected.value,
        "job": jobController.text,
        "monthlyIncome": monthlyIncomeController.selected.value,
        "role": role == "Tenant" ? "user" : "landlord"
      };

      log(data.toString());
     await _api.signUpApi(data).then((value) {

        print("dddddddddddddddddddddddddddddddd ${value.success}");

        isLoading.value = false;
        Utils.snackBar("Account Created", "Account Created Successfully!");
        Get.offAll(() => OtpPage(
          email: emailController.value.text,
          isFromAuth: true,
        ));
        resetFormData();
        // Get.offAll(() => const SigninPage());
        LocalStorage.saveData(
            key: "userId", data: value.data!.user!.sId.toString());
        userPreference
            .saveUser(value.data!.otpToken!.token.toString(),
                value.data!.user!.sId!, value.data!.user!.role!, "","")
            .then((value2) {
          isLoading.value = false;

          Utils.snackBar("OTP", value.message!);
        });
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(error.toString());
        Utils.snackBar("Error", error.toString());
      });
    } catch (e) {
     // Utils.snackBar("Registration Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
