import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class MyBookingRepository {
  final _apiService = NetworkApiServices();

  Future<MyBookingModel> myBookingApi() async {
    String addUrl = AppUrl.myBookingResidenceUrl;
    dynamic response = await _apiService.getApi(addUrl);
    log(response.toString());

    return MyBookingModel.fromJson(response);
  }
}
