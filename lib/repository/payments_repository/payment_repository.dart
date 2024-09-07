import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/paymentsModel/payment_model.dart';

import 'package:real_estate_management/res/app_url/app_url.dart';

class PaymentHistoryRepository {
  final _apiService = NetworkApiServices();

  Future<PaymentHistoryModel> paymentHistoryApi() async {
    String paymentHistoryUrl = AppUrl.myPaymentUrl;

    dynamic response = await _apiService.getApi(paymentHistoryUrl);
    log(response.toString());

    return PaymentHistoryModel.fromJson(response);
  }
}
