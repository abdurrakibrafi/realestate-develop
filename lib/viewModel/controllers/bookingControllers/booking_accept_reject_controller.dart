import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:real_estate_management/repository/booking_repository/booking_accept_reject_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/my_booking_page.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';

import '../../../view/host/bookingRequestScreens/booking_sign_view.dart';
import '../../../view/host/bookingRequestScreens/reservation_list_page.dart';
import 'my_booking_controller.dart';

class BookingAcceptDeclineController extends GetxController {
  MyBookingController controller = Get.put(MyBookingController());
  RxBool loadinga = false.obs;
  RxBool loadingc = false.obs;

  final _api = BookingAcceptDeclineRepository();

  void updateProfileApi(String id, bool isAccept, String bookingId) async {
    isAccept ? loadinga.value = true : loadingc.value = true;

    try {
      await _api.acceptOrDeclineApi(isAccept, id).then((var value) async{

        // Get.delete<MyBookingController>();
        // Get.off(const ReservationListPage());
        await controller.fetchData();
       if(value.message!.contains("canceled")){
         Get.to(ReservationListPage());
       }else{
         Get.to(() => BookingSignView(bookingId: bookingId, isTenant: false,));
       }
      //  Get.off(() => GuestRootScreen());

      /*  isAccept
            ? Utils.snackBar("Accepted", "Request Accepted!")
            : Utils.snackBar("Canceled", "Request Canceled!");*/

      });
    } catch (error) {
      log(error.toString());
      //Utils.snackBar("Error", error.toString());
    } finally {
      isAccept ? loadinga.value = false : loadingc.value = false;
    }
  }
}
