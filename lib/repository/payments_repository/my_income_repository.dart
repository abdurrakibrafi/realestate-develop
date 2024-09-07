import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/paymentsModel/my_income_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class MyIncomeRepository {
  final _apiService = NetworkApiServices();

  Future<MyIncomeModel> myIncomeApi(String yearValue) async {
    String myIncomeModelUrl = AppUrl.myIncomeUrl(yearValue: yearValue);

    dynamic response = await _apiService.getApi(myIncomeModelUrl);
    log(response.toString());

    return MyIncomeModel.fromJson(response);
  }
}
