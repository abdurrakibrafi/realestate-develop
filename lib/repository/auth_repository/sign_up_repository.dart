import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/authModel/sign_up_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class SignUpRepository {
  final _apiService = NetworkApiServices();

  Future<SignUpModel> signUpApi(var data) async {
    String addResidenceUrl = AppUrl.createAcountUrl;

    dynamic response = await _apiService.postApi(data, addResidenceUrl);
    log(response.toString());

    return SignUpModel.fromJson(response);
  }
}
