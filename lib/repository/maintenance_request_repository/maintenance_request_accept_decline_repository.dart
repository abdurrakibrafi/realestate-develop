import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/maintenance_request_accept_decline_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class MaintenanceRequestAcceptDeclineRepository {
  final _apiService = NetworkApiServices();

  Future<MaintenanceRequestAcceptDeclineModel> acceptOrDeclineApi(
      bool isAccept, String id) async {
    String url = AppUrl.maintenanceRequestUrl;
    dynamic response = isAccept
        ? await _apiService.patchApi({}, "$url/accept/$id")
        : await _apiService.patchApi({}, "$url/cancel/$id");
    log(response.toString());

    return MaintenanceRequestAcceptDeclineModel.fromJson(response);
  }
}
