import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/otpModels/resend_otp_model.dart';
import 'package:real_estate_management/models/otpModels/verify_otp_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class OtpRepository {
  final _apiService = NetworkApiServices();

  Future<ResendOtpModel> resendOtpApi(var data) async {
    String resendOtpUrl = AppUrl.otpResendUrl;

    dynamic response = await _apiService.postApi(data, resendOtpUrl);
    log(response.toString());

    return ResendOtpModel.fromJson(response);
  }

  Future<ResendOtpModel> forgetPassApi(var data) async {
    String resendOtpUrl = AppUrl.forgetPasswordUrl;

    dynamic response = await _apiService.patchApi(data, resendOtpUrl);
    log(response.toString());

    return ResendOtpModel.fromJson(response);
  }

  Future<VerifyOtpModel> verifyOtpApi(var data) async {
    String verifyOtpUrl = AppUrl.otpVerifyUrl;

    dynamic response = await _apiService.postApi(data, verifyOtpUrl);
    log(response.toString());

    return VerifyOtpModel.fromJson(response);
  }
}
