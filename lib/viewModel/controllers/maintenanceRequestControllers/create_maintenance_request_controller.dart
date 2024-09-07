import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_management/repository/maintenance_request_repository/create_maintenance_request_repository.dart';

import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/my_booking_page.dart';

class CreateMaintenanceRequestController extends GetxController {
  final _api = CreateMaintenanceRequestRepository();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  RxBool loading = false.obs;
  String id = "";

  Rx<String> selectedCountryCode = '+965'.obs; // Default to a value
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

  CreateMaintenanceRequestController({required String residenceId}) {
    id = residenceId;
  }

  bool validatePage() {
    List<TextEditingController> requiredControllers = [
      apartmentController,
      fullNameController,
      floorController,
      addressController,
      emailController,
      phoneController,
      descriptionController,
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

      Map<String, dynamic> extraInfo = {
        "name": fullNameController.text,
        "apartment": apartmentController.text,
        "floor": floorController.text,
        "address": addressController.text,
        "email": emailController.text,
        "phoneNumber": selectedCountryCode.value + phoneController.text,
      };

      Map<String, dynamic> nonFileData = {
        "property": id,
        "problems": descriptionController.text,
        "extraInfo": extraInfo,
      };

      String jsonData = jsonEncode(nonFileData);

      var imageFile;

      if (pickedImage.value != null) {
        imageFile = await MultipartFile.fromFile(pickedImage.value!.path,
            filename: "property_image.jpg");
      }

      final formData = FormData.fromMap({
        "data": jsonData,
        if (imageFile != null) "images": imageFile,
      });

      log(formData.fields.toString());
      log("files ${formData.files.toString()}");

      await _api.createMaintenanceRequestApi(formData);
      Utils.snackBar("Residence Created", "Residence Created Successfully!");
      resetFormData();
      Get.off(() => const MyBookingPage());
    } catch (error) {
      log(error.toString());
      //Utils.snackBar("Error", error.toString());
    } finally {
      loading.value = false;
    }
  }

  void resetFormData() {
    apartmentController.clear();
    fullNameController.clear();
    floorController.clear();
    addressController.clear();
    emailController.clear();
    phoneController.clear();
    descriptionController.clear();
    pickedImage.value = null;
    super.onClose();
  }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    apartmentController.dispose();
    fullNameController.dispose();
    floorController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
