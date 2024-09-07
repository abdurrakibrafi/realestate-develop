import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/repository/residences_repository/residences_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class ResidencesController extends GetxController {
  final _api = ResidencesRepository();
  final RxList<AllResidence> residencesDataList = <AllResidence>[].obs;
  var isLoading = true.obs;
  var isMoreDataAvailable = true.obs; // To check if more data is available
  int currentPage = 1; // To track the current page
  final int limit = 100000000; // Number of items per page

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }


   fetchData(
      {bool isLoadMore = false, String category = "", String host = ""}) async {
    if (!isLoadMore) {
      isLoading(true);
    }
    try {
      ResidencesModel adsModel = await _api.residencesApi(
          page: currentPage, limit: limit, category: category, host: host);
      if (adsModel.data != null && adsModel.success == true) {
        if (isLoadMore) {
          residencesDataList.addAll(adsModel.data!.allResidence!);
        } else {
          residencesDataList.assignAll(adsModel.data!.allResidence!);
        }

        // Check if more data is available
        isMoreDataAvailable.value =
            adsModel.data!.allResidence!.length == limit;
      } else {
        isMoreDataAvailable.value = false;
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
      //Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void loadMoreData() {
    if (isMoreDataAvailable.value && !isLoading.value) {
      currentPage++;
      fetchData(isLoadMore: true);
    }
  }
}
