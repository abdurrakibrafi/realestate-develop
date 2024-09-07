import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:real_estate_management/models/profileModels/profile_model.dart';
import 'package:real_estate_management/repository/profile_repository/getting_paid_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';

class GettingPaidController extends GetxController {
  final _api = GettingPaidRepository();

  TextEditingController countryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController swiftCodeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxBool loading = false.obs;

  void resetFormData() {
    countryController.clear();
    nameController.clear();
    bankNameController.clear();
    swiftCodeController.clear();
    accountNumberController.clear();
    addressController.clear();
  }

  void loginApi() async {
    try {
      loading.value = true;

      Map<String, dynamic> bankInfo = {
        "country": countryController.text,
        "bankName": bankNameController.text,
        "swiftCode": swiftCodeController.text,
        "accountHolder": nameController.text,
        "accountNumber": accountNumberController.text,
        "bankAddress": addressController.text
      };
      Map<String, dynamic> data = {
        "bankInfo": bankInfo,
      };

      String jsonData = jsonEncode(data);

      final formData = FormData.fromMap({
        "data": jsonData,
      });

      log(formData.fields.toString());
      log("files ${formData.files.toString()}");

      ProfileModel model = await _api.gettingPaidApi(formData);
      Utils.snackBar("Bank Info Added", model.message!);
      resetFormData();
      Get.offAll(() => const GuestRootScreen());
    } catch (error) {
      log(error.toString());
      Utils.snackBar("Error", error.toString());
    } finally {
      loading.value = false;
    }
  }
}
