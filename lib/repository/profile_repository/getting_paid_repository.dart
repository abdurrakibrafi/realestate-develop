import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/profileModels/profile_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class GettingPaidRepository {
  final _apiService = NetworkApiServices();

  Future<ProfileModel> gettingPaidApi(var data) async {
    String addResidenceUrl = AppUrl.profileUrl;

    dynamic response = await _apiService.patchApi(data, addResidenceUrl);
    log(response.toString());

    return ProfileModel.fromJson(response);
  }
}
