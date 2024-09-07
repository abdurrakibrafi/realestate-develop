import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/adsModels/ads_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class AdsRepository {
  final _apiService = NetworkApiServices();

  Future<AdsModel> loginApi() async {
    String addUrl = AppUrl.adsUrl;
    dynamic response = await _apiService.getApi(addUrl);
    log(response.toString());

    return AdsModel.fromJson(response);
  }
}
