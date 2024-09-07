import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class HomePageController extends GetxController {
  var selectedItem = 'All'.obs;
  var role = "".obs;
  UserPreference userPreference = UserPreference();

  var name = "".obs;
  var profileImage = "".obs;

  void getName() async {
    name.value = await userPreference.getName();
    profileImage.value = await userPreference.getImage();
    role.value = await userPreference.getRole();
    log("role................${role.value}");
    log("name................${name.value}");
  }

  void selectItem(String item) {
    selectedItem.value = item;
  }

  @override
  void onInit() async {
  //  role = await userPreference.getRole();

    getName();
    super.onInit();
  }
}
