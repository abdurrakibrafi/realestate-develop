import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:real_estate_management/repository/maintenance_request_repository/maintenance_request_accept_decline_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/profileScreens/maintenanceRequestPages/maintenance_request_page.dart';

import 'maintenance_request_controller.dart';

class MaintenanceRequestAcceptDeclineController extends GetxController {
  final MaintenanceRequestController maintenanceRequestController =
  Get.put(MaintenanceRequestController(), permanent: true);
  RxBool loadinga = false.obs;
  RxBool loadingc = false.obs;

  final _api = MaintenanceRequestAcceptDeclineRepository();

  void updateProfileApi(String id, bool isAccept) async {
    isAccept ? loadinga.value = true : loadingc.value = true;

    try {
      await _api.acceptOrDeclineApi(isAccept, id).then((var value) async{
        await maintenanceRequestController.maintenaceRequest();
        isAccept
            ? Utils.snackBar("Accepted", "Request Accepted!")
            : Utils.snackBar("Canceled", "Request Canceled!");

        Get.off(const MaintenanceRequestPage());
      });
    } catch (error) {
      log(error.toString());
      //Utils.snackBar("Error", error.toString());
    } finally {
      isAccept ? loadinga.value = false : loadingc.value = false;
    }
  }
}
