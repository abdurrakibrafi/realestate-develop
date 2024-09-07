import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/subscriptionModels/subscription_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class SubscriptionRepository {
  final _apiService = NetworkApiServices();

  Future<SubscriptionModel> subscriptionApi() async {
    String subscriptionUrl = AppUrl.subscriptionsUrl;

    dynamic response = await _apiService.getApi(subscriptionUrl);
    log(response.toString());

    return SubscriptionModel.fromJson(response);
  }
}
