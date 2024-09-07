import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:real_estate_management/models/profileModels/profile_model.dart';
import 'package:real_estate_management/repository/profile_repository/update_profile_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';

import '../../../view/guest/guest_root_screen.dart';

class EditProfilePageController extends GetxController {
  var selectedGender = 'Male'.obs;
  var selectedCountryCode = '+965'.obs;
  RxBool loading = false.obs;
  Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  final _api = UpdateProfileRepository();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController jobController;
  late TextEditingController aboutController;

  late DropdownController monthlyIncomeController;
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  EditProfilePageController(Data userData) {
    nameController = TextEditingController(text: userData.name ?? '');
    emailController = TextEditingController(text: userData.email ?? '');
    phoneController = TextEditingController(text: userData.phoneNumber ?? '');
    locationController = TextEditingController(text: userData.address ?? '');
    jobController = TextEditingController(text: userData.job ?? '');
    aboutController = TextEditingController(text: userData.about ?? '');

    monthlyIncomeController = Get.put(
      DropdownController([
        'Under 800 KD',
        'Between 800 - 1499 KD',
        'Between 1500 - 3000 KD',
        'Over 3000 KD'
      ], selected: userData.monthlyIncome.toString()),
      tag: 'monthlyIncome',
    );
  }

  void selectRole(String gender) {
    selectedGender.value = gender;
  }

  void selectCountryCode(String item) {
    selectedCountryCode.value = item;
  }

  final Map<String, String> countryCodes = {
    '+965':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/1200px-Flag_of_Kuwait.svg.png',
    '+1':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/800px-Flag_of_the_United_States.svg.png',
  }.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    jobController.dispose();
    aboutController.dispose();
    monthlyIncomeController.dispose();

    super.onClose();
  }

  @override
  void dispose() {
    pickedImage.value = null;
    super.dispose();
  }

  void updateProfileApi({context}) async {
    loading.value = true;

    var imageFile;

    if (pickedImage.value != null) {
      imageFile = await MultipartFile.fromFile(pickedImage.value!.path,
          filename: "property_image.jpg");
    }

    final formData = FormData.fromMap({
      "name": nameController.value.text,
      "job": jobController.value.text,
      "monthlyIncome": monthlyIncomeController.selected,
      "about": aboutController.value.text,
      if (imageFile != null) "image": imageFile,
    });

    log(formData.fields.toString());
    log("files ${formData.files.toString()}");

    try {
      ProfileModel profileModel = await _api.updateProfileApi(formData);
      Utils.snackBar("Update", "Profile Updated Successfully!");

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuestRootScreen()));
    } catch (error) {
      log(error.toString());
      Utils.snackBar("Error", error.toString());
    } finally {
      loading.value = false;
    }
  }
}
