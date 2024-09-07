import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/repository/booking_repository/my_booking_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class MyBookingController extends GetxController {
  final _api = MyBookingRepository();
  final RxList<Data> adsDataList = <Data>[].obs;
  final RxList<Data> closedList = <Data>[].obs;
  final RxList<Data> ongoingList = <Data>[].obs;
  final RxList<Data> pendingList = <Data>[].obs; // List for pending bookings
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

   fetchData() async {
    isLoading(true);
    try {
      MyBookingModel myBookingModel = await _api.myBookingApi();
      if (myBookingModel.data != null && myBookingModel.success == true) {
        adsDataList.assignAll(myBookingModel.data!);
       // pendingList.addAll(myBookingModel.data.where((e) => e.status.toString() == ""))

        _separateDataByStatus();
        _separateDataByEndDate();

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

  void _separateDataByStatus() {
    for (var data in adsDataList) {
      if (data.isPaid == false) {
        pendingList.add(data);
      }
    }
  }

  void _separateDataByEndDate() {
    DateTime now = DateTime.now();
    for (var data in adsDataList.where((item) => item.status != 'pending')) {
      if (data.endDate != null) {
        DateTime endDate = DateFormat('yyyy-MM-dd').parse(data.endDate!);
        log("End Date: $endDate");
        log("Current Date: $now");
        if (endDate.isBefore(now)) {
          closedList.add(data);
        } else {
          ongoingList.add(data);
        }
      }
    }
  }
}
