import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/maintenance_request_model.dart';
import 'package:real_estate_management/repository/maintenance_request_repository/maintenance_request_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

import '../../../res/app_url/app_url.dart';
import '../../../service/base_client.dart';
import '../user_preference/user_preference_view_model.dart';

class MaintenanceRequestController extends GetxController {
  var isLoading = false.obs;

  var maintenance = MaintenanceRequestModel().obs;
  var maintenanceList = <MRData>[].obs;
  var maintenanceCloseList = <MRData>[].obs;
  var maintenanceAcceptedList = <MRData>[].obs;

  @override
  void onInit() {
    maintenaceRequest();
    super.onInit();

  }

  ///maintenaceRequest
  maintenaceRequest() async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();


      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
            api: AppUrl.maintenanceRequestUrl, headers: headers),
      );
      if (responseBody != null) {
        maintenanceList.clear();
        maintenanceAcceptedList.clear();
        maintenanceCloseList.clear();

        maintenance.value = MaintenanceRequestModel.fromJson(responseBody);
        maintenanceList.addAll(maintenance.value.data!.data.where((e) => e.status.toString() == "pending").toList());
        maintenanceAcceptedList.addAll(maintenance.value.data!.data.where((e) => e.status.toString() == "accepted").toList());
        maintenanceCloseList.addAll(maintenance.value.data!.data.where((e) => e.status.toString() == "cancelled").toList());
        isLoading(false);
      } else {
        throw 'Unable to load data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
