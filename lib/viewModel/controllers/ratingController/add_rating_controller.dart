import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_management/repository/review_repository/add_review_repository.dart';

import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/my_booking_page.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class AddReviewController extends GetxController {
  final _api = AddReviewRepository();
  TextEditingController reviewDeatilsController = TextEditingController();
  var ratingController = TextEditingController().obs;
  UserPreference userPreference = UserPreference();

  Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  RxBool loading = false.obs;
  String id = "";

  @override
  void onInit() {
    super.onInit();
    ratingController.value.text = "0";
  }

  Rx<String> selectedCountryCode = '+965'.obs;
  Map<String, String> countryCodes = {
    '+965':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/640px-Flag_of_the_United_Arab_Emirates.svg.png',
    '+1':
        'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg',
  };

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  AddReviewController({required String residenceId}) {
    id = residenceId;
  }

  bool validatePage() {
    List<TextEditingController> requiredControllers = [
      reviewDeatilsController,
    ];

    for (var ctrl in requiredControllers) {
      if (ctrl.text.isEmpty) {
        Utils.snackBar("Validation Error", "Please fill all required fields");
        return false;
      }
    }

    return true;
  }

  void selectCountryCode(String value) {
    selectedCountryCode.value = value;
  }

  void callApi() async {
    try {
      loading.value = true;
      String userId = await userPreference.getId();
      double ratingValue = double.parse(ratingController.value.text);

      // Sending fields directly instead of JSON string
      Map<String, dynamic> nonFileData = {
        "user": userId,
        "residence": id,
        "rating": ratingValue,
        "comment": reviewDeatilsController.text
      };

      var imageFile;

      if (pickedImage.value != null) {
        imageFile = await MultipartFile.fromFile(
          pickedImage.value!.path,
          filename: "property_image.jpg",
        );
      }

      final formData = FormData.fromMap({
        ...nonFileData, // Spread the map to include each key-value pair directly
        if (imageFile != null) "images": imageFile,
      });

      log(formData.fields.toString());
      log("files ${formData.files.toString()}");

      await _api.callApi(formData);
      Utils.snackBar("Review Submitted", "Your review was submitted successfully!");
      resetFormData();
      Get.off(() => const MyBookingPage());
    } catch (error) {
      log(error.toString());
      Utils.snackBar("Error", error.toString());
    } finally {
      loading.value = false;
    }
  }


  void resetFormData() {
    reviewDeatilsController.clear();

    pickedImage.value = null;
    super.onClose();
  }

  @override
  void onClose() {
    reviewDeatilsController.dispose();

    super.onClose();
  }
}
