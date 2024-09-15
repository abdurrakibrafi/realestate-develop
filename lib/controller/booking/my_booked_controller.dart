import 'dart:convert';

import 'package:get/get.dart';
import 'package:real_estate_management/models/bookingModels/new_booking_model.dart';

import '../../models/bookingModels/my_booked_model.dart';
import '../../res/app_url/app_url.dart';
import '../../service/base_client.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class MyBookedController extends GetxController {
  var isLoading = false.obs;

  var myBooking = MyBookedModel().obs;
  var myBookingList = <Booked>[].obs;
  var myBookingPendingList = <Booked>[].obs;
  var myBookingApprovedList = <Booked>[].obs;
  var myBookingCanceledList = <Booked>[].obs;

  @override
  void onInit() {
    getBookingRequest();
    super.onInit();

  }

  ///newBooking
  getBookingRequest() async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();


      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
            api: AppUrl.myBookResidenceUrl, headers: headers),
      );
      if (responseBody != null) {
        myBookingList.clear();
        myBookingPendingList.clear();
        myBookingApprovedList.clear();
        myBookingCanceledList.clear();

        myBooking.value = MyBookedModel.fromJson(responseBody);
        myBookingList.addAll(myBooking.value.data!.enrichedBookings);
        myBookingApprovedList.addAll(myBooking.value.data!.enrichedBookings.where((e) => e.status.toString() == "approved" && e.isPaid == true).toList());
        myBookingCanceledList.addAll(myBooking.value.data!.enrichedBookings.where((e) => e.status.toString() == "canceled").toList());
        myBookingPendingList.addAll(myBooking.value.data!.enrichedBookings.where((e) => e.isPaid == false).toList());

        isLoading(false);
      } else {
        throw 'Unable to load get new booking data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}