import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/residencesModels/add_residence_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class UpdateResidencesRepository {
  final _apiService = NetworkApiServices();

  Future<AddResidencesModel> updateResidencesApi(
      var data, String residenceId) async {
    String addResidenceUrl = AppUrl.updateResidencesUrl;

    dynamic response =
        await _apiService.patchApi(data, addResidenceUrl + residenceId);
    log(response.toString());

    return AddResidencesModel.fromJson(response);
  }
}
