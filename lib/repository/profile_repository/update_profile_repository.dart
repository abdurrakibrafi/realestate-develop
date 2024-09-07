import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/profileModels/profile_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class UpdateProfileRepository {
  final _apiService = NetworkApiServices();

  Future<ProfileModel> updateProfileApi(var data) async {
    String addUrl = AppUrl.profileUrl;
    dynamic response = await _apiService.patchApi(data,addUrl);
    log(response.toString());

    return ProfileModel.fromJson(response);
  }
}