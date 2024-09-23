import 'dart:convert';

import 'package:get/get.dart';
import 'package:real_estate_management/models/bookingModels/new_booking_model.dart';

import '../../res/app_url/app_url.dart';
import '../../service/base_client.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class NewBookingController extends GetxController {
  var isLoading = false.obs;

  var newBooking = NewBookingModel().obs;
  var newBookingList = <Datum>[].obs;
  var newBookingApprovedList = <Datum>[].obs;
  var newBookingCancelList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    newBookingRequest();
  }

  ///newBooking
  newBookingRequest() async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String userId = await userPreference.getId();

      String token = await userPreference.getUser();


      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",

      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
            api: AppUrl.newBooking(userId: userId), headers: headers),
      );
      if (responseBody != null) {
        newBookingList.clear();
        newBookingApprovedList.clear();
        newBookingCancelList.clear();

        newBooking.value = NewBookingModel.fromJson(responseBody);
        newBookingList.addAll(newBooking.value.data!.data.where((e) => e.status.toString() == "pending").toList());
        newBookingApprovedList.addAll(newBooking.value.data!.data.where((e) => e.status.toString() == "approved" && e.isPaid == true).toList());
        newBookingCancelList.addAll(newBooking.value.data!.data.where((e) => e.status.toString() == "canceled").toList());
        isLoading(false);
      } else {
        throw 'Unable to load get new booking data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e.toString() + "555555555");
    } finally {
      isLoading(false);
    }
  }
}