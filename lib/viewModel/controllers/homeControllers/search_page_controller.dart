import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/repository/residences_repository/residences_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class SearchPageController extends GetxController {
  final _api = ResidencesRepository();
  final RxList<AllResidence> residencesDataList = <AllResidence>[].obs;
  // final RxList<AllResidence> filteredResidencesList = <AllResidence>[].obs;
  final TextEditingController searchController = TextEditingController();
  var isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    searchController.clear;
    fetchData();
  }

  // void filterResidences(String query) {
  //   if (query.isEmpty) {
  //     filteredResidencesList.assignAll(residencesDataList);
  //   } else {
  //     var list = residencesDataList.where((residence) {
  //       return residence.propertyName!
  //           .toLowerCase()
  //           .contains(query.toLowerCase());
  //     }).toList();
  //     filteredResidencesList.assignAll(list);
  //   }
  // }

  void fetchData(
      {String category = '',
      String budget = "",
      String rooms = "",
      String rentingType = "",
      String residenceType = "",
      String features = "",
      String governorate = ""}) async {
    isLoading(true);
    try {
      ResidencesModel adsModel = await _api.residencesApi(
          searchValue: searchController.value.text,
          category: category,
          budget: budget,
          rooms: rooms,
          rentingType: rentingType,
          residenceType: residenceType,
          features: features,
          governorate: governorate);
      if (adsModel.data != null && adsModel.success == true) {
        residencesDataList.assignAll(adsModel.data!.allResidence!);
        // filteredResidencesList.assignAll(residencesDataList);
      } else {
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
      //Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
