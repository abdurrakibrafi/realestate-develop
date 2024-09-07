import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management/utils/utils.dart';

class InformationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<String> dayList = <String>['1', '2', '3', '4'];
  List<String> monthList = <String>['January', 'February', 'March', 'April'];
  List<String> yearList = <String>['2001', '2002', '2003', '2004'];

  var dayDropdownValue = '1'.obs;
  var monthDropdownValue = 'January'.obs;
  var yearDropdownValue = '2001'.obs;

  var selectedRole = 'Male'.obs;

  var checkinDate = "Select Date".obs;
  var checkoutDate = "Select Date".obs;

  void setCheckInDate(String date) {
    checkinDate.value = date;
  }

  void setCheckOutDate(String date) {
    checkoutDate.value = date;
  }

  void setDayDropDownValue(String value) {
    dayDropdownValue.value = value;
  }

  void setMonthDropDownValue(String value) {
    monthDropdownValue.value = value;
  }

  void setYearDropDownValue(String value) {
    yearDropdownValue.value = value;
  }

  void setRoleValue(String value) {
    selectedRole.value = value;
  }

  @override
  void onInit() {
    super.onInit();

    dayDropdownValue.value = '1';
    monthDropdownValue.value = 'January';
    yearDropdownValue.value = '2001';
    selectedRole.value = 'Male';

    dayDropdownValue.value = dayList.first;
    monthDropdownValue.value = monthList.first;
    yearDropdownValue.value = yearList.first;
  }

  bool validateForm() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        numberController.text.isEmpty ||
        addressController.text.isEmpty) {
      Utils.snackBar("Error", "Please fill all the fields.");
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
