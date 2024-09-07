import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class SelectLanguagePageController extends GetxController {
  var selectedLanguage = 'English'.obs;
  UserPreference userPreference = UserPreference();

  @override
  void onInit() async {
    super.onInit();
    String language = await userPreference.getLanguage();
    selectedLanguage.value = language == "en" ? "English" : "العربية";
  }

  void selectRole(String language) {
    selectedLanguage.value = language;

    if (selectedLanguage.value == "English") {
      userPreference.saveLanguage("en").then((value) {
        Get.updateLocale(
          const Locale("en", "US"),
        );
      });
    } else if (selectedLanguage.value == "العربية") {
      userPreference.saveLanguage("ar").then((value) {
        Get.updateLocale(
          const Locale("ar", "SA"),
        );
      });
    }
  }
}
