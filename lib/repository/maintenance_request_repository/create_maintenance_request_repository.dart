import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/create_maintenance_request_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class CreateMaintenanceRequestRepository {
  final _apiService = NetworkApiServices();

  Future<CreateMaintenanceRequestModel> createMaintenanceRequestApi(
      var data) async {
    String url = AppUrl.createMaintenanceRequestUrl;

    dynamic response = await _apiService.postApi(data, url);
    log(response.toString());

    return CreateMaintenanceRequestModel.fromJson(response);
  }
}
