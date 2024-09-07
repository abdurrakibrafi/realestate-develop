import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/maintenance_request_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class MaintenanceRequestRepository {
  final _apiService = NetworkApiServices();

  Future<MaintenanceRequestModel> maintenanceRequestApi() async {
    String addUrl = AppUrl.maintenanceRequestUrl;
    dynamic response = await _apiService.getApi(addUrl);
    log(response.toString());

    return MaintenanceRequestModel.fromJson(response);
  }
}
