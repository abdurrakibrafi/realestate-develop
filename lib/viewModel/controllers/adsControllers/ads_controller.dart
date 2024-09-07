import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/adsModels/ads_model.dart';
import 'package:real_estate_management/repository/ads_repository/ads_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class AdsController extends GetxController {
  final _api = AdsRepository();
  final RxList<Data> adsDataList = <Data>[].obs;
  var isLoading = true.obs;

  var selectedItem = 'Recommended'.obs;

  void selectItem(String item) {
    selectedItem.value = item;
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      AdsModel adsModel = await _api.loginApi();
      if (adsModel.adsData != null && adsModel.success == true) {
        adsDataList.assignAll(adsModel.adsData!.data!);
      } else {
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
     // Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
