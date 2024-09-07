import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/profileModels/profile_model.dart';
import 'package:real_estate_management/repository/profile_repository/profile_repository.dart';

import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class ProfileController extends GetxController {
  final ProfileRepository _api = ProfileRepository();
  final Rx<Data?> profileData = Rx<Data?>(null);
  var isLoading = true.obs;
  String role = "";
  bool isLandloard = true;
  UserPreference userPreference = UserPreference();

  @override
  void onInit() async {
    fetchData();
    super.onInit();
    role = await userPreference.getRole();
    if (role == "user") {
      isLandloard = false;
    }
    log(role);

  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }

   fetchData() async {
    isLoading(true);
    try {
      ProfileModel profileModel = await _api.profileApi();
      if (profileModel.data != null && profileModel.success == true) {
        profileData.value = profileModel.data;
      } else {
        Utils.snackBar("Error", profileModel.message.toString());
      }
    } catch (e) {
      log(e.toString());
     // Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
