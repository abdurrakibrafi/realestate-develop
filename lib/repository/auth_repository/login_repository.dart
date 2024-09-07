import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/authModel/login_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<LoginModel> loginApi(var data) async {
    String loginUrl =  AppUrl.loginUrl;
    
    dynamic response = await _apiService.postApi(data, loginUrl);
    log(response.toString());

    return LoginModel.fromJson(response);
  }
}
