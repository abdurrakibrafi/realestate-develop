// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/bookingModels/booking_request_model.dart';
import 'package:real_estate_management/repository/booking_repository/booking_request_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import '../../../view/guest/schedulingScreens/booking_success_page.dart';


class SchedulingController extends GetxController {
  final _api = BookingRequestRepository();
  var discountController = TextEditingController().obs;
  var selectedDateIndex = 3.obs;
  var selectedDurationIndex = 0.obs;
  var totalDuration = 7.obs;
  var adultCount = 2.obs;
  var childCount = 1.obs;
  var hasDiscount = false.obs;
  var discountValue = 0.0.obs;
  var loading = false.obs;
  var selectedValue = DateTime.now().obs;
  var isChecked = false.obs;

  void updateDate(DateTime date) {
    selectedValue.value = date;
  }

  void updateDurationIndex(int index) {
    selectedDurationIndex.value = index;
  }
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void updateAdultCount(int count) {
    adultCount.value = count;
  }

  void updateChildCount(int count) {
    childCount.value = count;
  }

  void api(
      String residence,
      String propertyName,
      String rating,
      String address,
      String price,
      String checkIn,
      String checkOut,
      String duration,
      String adult,
      String child,
      String discount,
      String discountAmount,
      String totalAmount) async {
    try {
      loading.value = true;
      Map<String, dynamic> guest = {
        "child": int.parse(child),
        "adult": int.parse(adult)
      };
      Map<String, dynamic> data = {
        "residence": residence,
        "startDate": checkIn,
        "endDate": checkOut,
        "totalPrice": double.parse(totalAmount),
        "discount": discountAmount == "0.0" ? 0 : int.parse(discount),
        "guest": guest
      };
      log(data.toString());
      BookingRequestModel model = await _api.api(data);

      if (model.success == true) {
        Utils.snackBar("Booking Successful", model.message!);
        loading.value = false;
        Get.offAll(() => BookingSuccessPage());

      } else {
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
     // Utils.snackBar("Error", "Some error occurred");
    } finally {
      loading(false);
    }
  }
}
