import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/residencesModels/residence_booking_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class ResidenceBookingRepository {
  final _apiService = NetworkApiServices();

  Future<ResidenceBookingModel> residenceBookingPostApi(var data) async {
    String residenceBookingUrl = AppUrl.residenceBookingUrl;

    dynamic response = await _apiService.postApi(data, residenceBookingUrl);
    log(response.toString());

    return ResidenceBookingModel.fromJson(response);
  }
}
