import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class LanguageController extends GetxController {
  var selectedCountry = 'English'.obs;
  UserPreference userPreference = UserPreference();

  @override
  void onInit() async {
    super.onInit();
    String language = await userPreference.getLanguage();
    selectedCountry.value = language == "en" ? "English" : "العربية";
  }

  void selectCountryCode(String language) {
    selectedCountry.value = language;

    if (selectedCountry.value == "English") {
      userPreference.saveLanguage("en").then((value) {
        Get.updateLocale(
          const Locale("en", "US"),
        );
      });
    } else if (selectedCountry.value == "العربية") {
      userPreference.saveLanguage("ar").then((value) {
        Get.updateLocale(
          const Locale("ar", "SA"),
        );
      });
    }
  }
}
