import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/authModel/chnage_password_model.dart';
import 'package:real_estate_management/models/authModel/resend_password_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class ResetPasswordRepository {
  final _apiService = NetworkApiServices();

  Future<ResetPasswordModel> resetPassword(var data) async {
    String resendOtpUrl = AppUrl.resetPasswordUrl;

    dynamic response = await _apiService.patchApi(data, resendOtpUrl);
    log(response.toString());

    return ResetPasswordModel.fromJson(response);
  }

  Future<ChangePasswordModel> chnagePassword(var data) async {
    String resendOtpUrl = AppUrl.changePasswordUrl;

    dynamic response = await _apiService.patchApi(data, resendOtpUrl);
    log(response.toString());

    return ChangePasswordModel.fromJson(response);
  }
}
