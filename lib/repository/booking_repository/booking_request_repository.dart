import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/bookingModels/booking_request_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class BookingRequestRepository {
  final _apiService = NetworkApiServices();

  Future<BookingRequestModel> api(var data) async {
    String url = AppUrl.bookResidenceUrl;

    dynamic response = await _apiService.postApi(data, url);
    log(response.toString());

    return BookingRequestModel.fromJson(response);
  }
}
