import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/bookingModels/accept_booking_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class BookingAcceptDeclineRepository {
  final _apiService = NetworkApiServices();

  Future<AcceptBookingModel> acceptOrDeclineApi(
      bool isAccept, String id) async {
    String url = isAccept ? AppUrl.bookingAcceptUrl : AppUrl.bookingRejectUrl;
    dynamic response = await _apiService.patchApi({}, "$url$id");
    log(response.toString());

    return AcceptBookingModel.fromJson(response);
  }
}
