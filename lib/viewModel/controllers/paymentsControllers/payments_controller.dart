import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/paymentsModel/payment_model.dart';
import 'package:real_estate_management/repository/payments_repository/payment_repository.dart';

import 'package:real_estate_management/utils/utils.dart';

class PaymentsController extends GetxController {
  final PaymentHistoryRepository _api = PaymentHistoryRepository();
  final RxList<Data> paymentDataList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      PaymentHistoryModel paymentModel = await _api.paymentHistoryApi();
      if (paymentModel.data != null && paymentModel.success == true) {
        paymentDataList.assignAll(paymentModel.data!);
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
